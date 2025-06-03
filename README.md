# PostgreSQL HA Docker Stack with Pgpool-II & PgBouncer

## ✅ Features
Triển khai hệ thống PostgreSQL với khả năng **High Availability (HA)** sử dụng:
- **PostgreSQL 17** với 1 node primary và nhiều replica
- **Pgpool-II** để cân bằng tải, kiểm tra sức khỏe, failover
- **PgBouncer** để quản lý kết nối
- Docker Compose & Portainer

# PostgreSQL HA với Repmgr + Pgpool

## Mô hình

```plaintext
+--------------------+
| Application / App  |
+---------+----------+
          |
          v
+------------------+          +-------------------+
| Pgpool           | <---->   | PostgreSQL Cluster |
| Port 15436       |          | Primary + Replicas |
+------------------+          +-------------------+
```

## 📦 Thành phần hệ thống
| Service            | Vai trò                          |
|--------------------|----------------------------------|
| `postgres-primary` | Cơ sở dữ liệu chính (writable)   |
| `postgres-replica` | Bản sao chỉ đọc (read-only)      |
| `pgpool`           | Load balancing, healthcheck      |
| `pgbouncer`        | Connection pooling               |

## 🧾 Environment Variables

```bash
docker compose --env-file .env up -d
docker logs postgres-ui
```

## 🚀 Usage

```bash
.env
```

## 🚀 Connect

```bash
host=pgpool
port=15436
user=admin
password=admin123
dbname=mydb

```

## 🚀 Test

```bash
SHOW password_encryption;

SELECT rolname, rolcanlogin, rolpassword FROM pg_authid WHERE rolpassword IS NOT NULL;

select client_addr, state, sync_state from pg_stat_replication;

SELECT inet_server_addr(), pg_is_in_recovery();
```

## 🔁 Restore in pgAdmin

In the Restore dialog, browse to:

```
/var/lib/pgadmin/storage/admin_vimaru.edu.vn/backups_link/
```

Then select `.backup` files located in `./data/backups`
