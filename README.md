# PostgreSQL HA Docker Stack with Pgpool-II & PgBouncer

## ✅ Features
Triển khai hệ thống PostgreSQL với khả năng **High Availability (HA)** sử dụng:
- **PostgreSQL 17** với 1 node primary và nhiều replica
- **Pgpool-II** để cân bằng tải, kiểm tra sức khỏe, failover
- **PgBouncer** để quản lý kết nối
- Docker Compose & Portainer

## 📦 Thành phần hệ thống
| Service            | Vai trò                          |
|--------------------|----------------------------------|
| `postgres-primary` | Cơ sở dữ liệu chính (writable)   |
| `postgres-replica` | Bản sao chỉ đọc (read-only)      |
| `pgpool`           | Load balancing, healthcheck      |
| `pgbouncer`        | Connection pooling               |

## 🧾 Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `POSTGRES_USER` | `admin` | Tài khoản DB |
| `POSTGRES_PASSWORD` | `admin123` | Mật khẩu DB |
| `POSTGRES_DB` | `mydb` | Tên cơ sở dữ liệu |
| `REPLICA_USER` | `admin` |
| `REPLICA_PASSWORD` | `admin123` |
| `PGPOOL_ADMIN_USER` | `admin` |
| `PGPOOL_ADMIN_PASS` | `admin123` |
| `PGPOOL_POSTGRES_USER` | `admin` |
| `PGPOOL_POSTGRES_PASS` | `admin123` |
| `PGPOOL_BACKEND_NODES` | `0:postgres-primary:5432:1,...` |
| `PGPOOL_SR_CHECK_USER` | `admin` |
| `PGPOOL_SR_CHECK_PASSWORD` | `admin123` |
| `DB_NAME` | `appdb` |
| `DB_USER` | `admin` |
| `DB_PASSWORD` | `admin123` |
| `DB_HOST` | `pgpool` |
| `DB_PORT` | `5432` |
| `POOL_MODE` | `transaction` |

## 🚀 Usage

```bash
docker compose --env-file .env up -d
docker logs postgres-ui
```

## 🔁 Restore in pgAdmin

In the Restore dialog, browse to:

```
/var/lib/pgadmin/storage/admin_vimaru.edu.vn/backups_link/
```

Then select `.backup` files located in `./data/backups`
