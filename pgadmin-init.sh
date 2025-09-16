sudo nano /data/configs/pgadmin-init.sh 

# Xác định thư mục storage cho user của pgAdmin
if [ -n "$PGADMIN_USER_DIR" ]; then
  USER_DIR="$PGADMIN_USER_DIR"
elif [ -n "$PGADMIN_DEFAULT_EMAIL" ]; then
  USER_DIR="$(printf "%s" "$PGADMIN_DEFAULT_EMAIL" | tr '@' '_')"
else
  USER_DIR="admin_vimaru.edu.vn"
fi

STORAGE_BASE="/var/lib/pgadmin/storage"
STORAGE_PATH="$STORAGE_BASE/$USER_DIR"
BACKUPS_MOUNT="/backups"
HOST_BACKUPS="/data/backups"
LINK_NAME="backups_link"

echo "👤 USER_DIR: $USER_DIR"
echo "📦 STORAGE_PATH: $STORAGE_PATH"
echo "💾 BACKUPS_MOUNT: $BACKUPS_MOUNT"

# 0) Mở quyền cho thư mục host (nếu mount trực tiếp)
if [ -d "$HOST_BACKUPS" ]; then
  echo "🔑 Cấp quyền cho $HOST_BACKUPS trên host"
  chmod -R 775 "$HOST_BACKUPS" 2>/dev/null || true
fi

# 1) Đảm bảo mount backup tồn tại & có quyền ghi
[ -d "$BACKUPS_MOUNT" ] || mkdir -p "$BACKUPS_MOUNT"
chown -R 5050:5050 "$BACKUPS_MOUNT" 2>/dev/null || true
chmod -R 775 "$BACKUPS_MOUNT" 2>/dev/null || true

# 2) Đảm bảo STORAGE_PATH tồn tại
[ -d "$STORAGE_PATH" ] || mkdir -p "$STORAGE_PATH"
chown -R 5050:5050 "$STORAGE_PATH" 2>/dev/null || true

# 3) Tạo symlink backups_link -> /backups
LINK_PATH="$STORAGE_PATH/$LINK_NAME"
[ -e "$LINK_PATH" ] || ln -s "$BACKUPS_MOUNT" "$LINK_PATH"


sudo chmod +x /data/configs/pgadmin-init.sh

sudo chown -R 5050:5050 /data/backups/postgres
sudo chmod -R 775 /data/backups/postgres
