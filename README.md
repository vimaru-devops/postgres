# pgAdmin + PostgreSQL Docker Stack with Backup Symlink

## ✅ Features

- PostgreSQL with configurable version and timezone
- pgAdmin 4 auto-creates symlink to `/backups`
- Can restore `.backup` files directly from pgAdmin UI

## 🧾 Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| POSTGRES_VERSION | 17 | PostgreSQL version |
| POSTGRES_USER | admin | DB username |
| POSTGRES_PASSWORD | 1 | DB password |
| POSTGRES_DB | system | DB name |
| TZ | Asia/Ho_Chi_Minh | Timezone |
| POSTGRES_PORT | 5432 | Host port for PostgreSQL |
| PGADMIN_EMAIL | admin@vimaru.edu.vn | pgAdmin login email |
| PGADMIN_PASSWORD | 1 | pgAdmin password |
| PGADMIN_PORT | 5431 | Host port for pgAdmin |
| PGADMIN_USER_DIR | admin_vimaru.edu.vn | pgAdmin user folder |

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
