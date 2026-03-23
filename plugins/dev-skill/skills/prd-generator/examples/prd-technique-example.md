# PRD Technique : Système de Gestion de Stock en Temps Réel

---

## 📋 Métadonnées

- **Type**: PRD Technique
- **Date de création**: 2024-01-16
- **Auteur**: Engineering Team
- **Version**: 1.0
- **Statut**: Approved

---

## 🎯 Résumé Exécutif

Développer un système de gestion de stock en temps réel avec synchronisation multi-warehouses, gestion automatique des alertes de rupture, et API REST pour intégrations tierces. Le système doit supporter 10,000 SKUs, 100 transactions/seconde, avec latence < 100ms.

---

## 📌 Contexte

### Problème Technique
Le système actuel utilise des batch jobs toutes les heures, causant des décalages de stock pouvant atteindre 60 minutes. Cela entraîne des surventes (3% des commandes) et des ruptures non détectées (pertes estimées à 50K$/mois).

### Solution Proposée
Architecture événementielle avec PostgreSQL pour persistance, Redis pour cache temps réel, et WebSockets pour notifications push. Synchronisation bidirectionnelle avec warehouses via API REST.

### Alternatives Considérées
1. **Batch processing optimisé** : Rejeté (latence toujours > 5 min)
2. **Database polling** : Rejeté (charge DB trop élevée)
3. **Event-driven architecture** : ✅ Retenu (temps réel, scalable)

---

## 🎯 Objectifs Techniques

### Objectifs Principaux
- [ ] Latence < 100ms pour lecture stock (P95)
- [ ] Support 100 transactions/seconde
- [ ] Uptime 99.9%
- [ ] Zero data loss sur les transactions

---

## 🏗️ Architecture Technique

### Architecture de Haut Niveau
```
┌─────────────────┐
│   Next.js UI    │ ←─ WebSocket ─→ ┌──────────────┐
└─────────────────┘                   │              │
        │                             │   Backend    │
        │ REST API                    │  (AdonisJS)  │
        ↓                             │              │
┌─────────────────┐                   └──────────────┘
│  API Gateway    │                          │
│   (Nginx)       │                          │
└─────────────────┘                          │
        │                                    │
        ├──────────────┬─────────────────────┤
        ↓              ↓                     ↓
┌─────────────┐  ┌──────────┐      ┌──────────────┐
│ PostgreSQL  │  │  Redis   │      │   RabbitMQ   │
│  (Primary)  │  │ (Cache)  │      │   (Queue)    │
└─────────────┘  └──────────┘      └──────────────┘
```

### Composants Principaux

#### Composant 1 : Stock Service
- **Responsabilité**: Gestion CRUD stock, calculs disponibilité
- **Technologies**: AdonisJS 6, PostgreSQL 15
- **Interfaces**:
  - REST API: `/api/v1/stock/*`
  - Events: `stock.updated`, `stock.low_alert`

#### Composant 2 : Sync Service
- **Responsabilité**: Synchronisation avec warehouses externes
- **Technologies**: Node.js, RabbitMQ
- **Interfaces**:
  - Webhook receiver: `/webhooks/warehouse/*`
  - Queue consumer: `warehouse.sync` queue

#### Composant 3 : Real-time Service
- **Responsabilité**: Notifications temps réel via WebSocket
- **Technologies**: Socket.io, Redis (pub/sub)
- **Interfaces**: WebSocket sur `/ws/stock`

---

## 🔌 Spécifications API

### API Endpoint 1: Get Stock

**Endpoint**: `GET /api/v1/stock/:sku`

**Description**: Récupérer le stock disponible pour un SKU

**Response Success (200)**:
```json
{
  "sku": "PROD-001",
  "quantity": 150,
  "available": 120,
  "reserved": 30,
  "warehouses": [
    {
      "id": "WH-01",
      "name": "Paris",
      "quantity": 80
    },
    {
      "id": "WH-02",
      "name": "Lyon",
      "quantity": 40
    }
  ],
  "low_stock_threshold": 50,
  "is_low_stock": false,
  "last_updated": "2024-01-16T10:30:00Z"
}
```

**Response Error (404)**:
```json
{
  "error": "SKU_NOT_FOUND",
  "message": "SKU not found in inventory"
}
```

### API Endpoint 2: Reserve Stock

**Endpoint**: `POST /api/v1/stock/:sku/reserve`

**Description**: Réserver du stock pour une commande

**Request**:
```json
{
  "quantity": 5,
  "order_id": "ORD-12345",
  "warehouse_id": "WH-01"
}
```

**Response Success (200)**:
```json
{
  "reservation_id": "uuid",
  "sku": "PROD-001",
  "quantity_reserved": 5,
  "expires_at": "2024-01-16T11:00:00Z"
}
```

**Validation Rules**:
- `quantity`: Required, positive integer, <= available stock
- `order_id`: Required, unique
- `warehouse_id`: Required, must exist

---

## 🗄️ Schéma de Base de Données

### Table 1 : `stock_items`

```sql
CREATE TABLE stock_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  sku VARCHAR(50) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  quantity INTEGER DEFAULT 0,
  available INTEGER DEFAULT 0, -- calculated: quantity - reserved
  reserved INTEGER DEFAULT 0,
  low_stock_threshold INTEGER DEFAULT 10,
  warehouse_id UUID REFERENCES warehouses(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  deleted_at TIMESTAMP NULL
);

CREATE INDEX idx_stock_sku ON stock_items(sku);
CREATE INDEX idx_stock_warehouse ON stock_items(warehouse_id);
CREATE INDEX idx_stock_low ON stock_items(available) WHERE available <= low_stock_threshold;
```

### Table 2 : `stock_reservations`

```sql
CREATE TABLE stock_reservations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  stock_item_id UUID REFERENCES stock_items(id),
  order_id VARCHAR(50) UNIQUE NOT NULL,
  quantity INTEGER NOT NULL,
  status VARCHAR(20) DEFAULT 'active', -- active, confirmed, expired, cancelled
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_reservations_order ON stock_reservations(order_id);
CREATE INDEX idx_reservations_status ON stock_reservations(status);
CREATE INDEX idx_reservations_expires ON stock_reservations(expires_at) WHERE status = 'active';
```

---

## 🔒 Sécurité

### Authentification
- JWT tokens avec 15 min expiration
- Refresh tokens (30 days)

### Autorisation
- Rôles: `admin`, `warehouse_manager`, `read_only`
- Permissions:
  - `stock:read` → Tous les rôles
  - `stock:write` → `admin`, `warehouse_manager`
  - `stock:delete` → `admin` uniquement

### Protection
- Rate limiting: 100 req/min par API key
- SQL injection: Utilisation de Lucid ORM (parameterized queries)
- CSRF: Tokens sur mutations
- XSS: Sanitization des inputs

---

## ⚡ Performance

### Objectifs de Performance
- **Response Time**: < 100ms P95, < 50ms P50
- **Throughput**: 100 transactions/seconde
- **Database Queries**: < 3 queries par requête API

### Optimisations Prévues
- [ ] Redis cache pour lectures fréquentes (TTL: 5 sec)
- [ ] Database indexes sur sku, warehouse_id
- [ ] Connection pooling (max 50 connections)
- [ ] Batch processing pour sync warehouse (10 items/batch)

---

## 🧪 Tests

### Tests Unitaires
- [ ] Stock calculation logic (available = quantity - reserved)
- [ ] Reservation expiration logic
- **Coverage Target**: 85%+

### Tests d'Intégration
- [ ] Scénario: Create → Reserve → Confirm → Release
- [ ] Scénario: Low stock alert triggered

### Tests E2E
- [ ] Flow: User views product → Adds to cart → Stock reserved → Checkout → Stock confirmed

### Tests de Performance
- [ ] Load testing : 100 req/s pendant 5 min
- [ ] Stress testing : augmentation progressive jusqu'à rupture

---

## 📈 Métriques de Succès

### Métriques Techniques
- [ ] **Uptime**: 99.9%+ (max 43 min downtime/mois)
- [ ] **Response Time P95**: < 100ms
- [ ] **Error Rate**: < 0.1%
- [ ] **Stock Sync Lag**: < 5 seconds

---

## ⚠️ Risques et Contraintes

### Risques Techniques
| Risque | Impact | Probabilité | Mitigation |
|--------|--------|-------------|------------|
| Redis failure | High | Low | Fallback to PostgreSQL, Redis cluster (HA) |
| Race conditions | High | Medium | Pessimistic locking, transactions |
| Webhook failures | Medium | Medium | Retry mechanism (3 attempts), dead letter queue |

---

## 📅 Planning

### Phase 1 : Conception et Setup (Semaine 1-2)
- [ ] Finaliser architecture et schémas database
- [ ] Setup environnement dev (Docker)
- [ ] Créer migrations

### Phase 2 : Développement Core (Semaine 3-5)
- [ ] Implémenter Stock Service (CRUD + business logic)
- [ ] Implémenter API REST endpoints
- [ ] Tests unitaires

### Phase 3 : Real-time & Sync (Semaine 6-7)
- [ ] WebSocket notifications
- [ ] Sync service avec warehouses
- [ ] Tests d'intégration

### Phase 4 : Tests et Déploiement (Semaine 8)
- [ ] Performance testing
- [ ] Security audit
- [ ] Production deployment

---

## ✅ Checklist de Validation

### Avant Développement
- [x] Architecture validée par l'équipe tech
- [x] Sécurité reviewée
- [x] Performance requirements clairs
- [ ] Dépendances externes identifiées (warehouse APIs)

### Avant Production
- [ ] Tests passent (unit, integration, e2e)
- [ ] Performance benchmarks atteints
- [ ] Security audit complété
- [ ] Documentation API (Swagger) publiée
- [ ] Rollback plan testé
