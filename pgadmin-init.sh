#!/bin/sh

echo "✅ Đang chạy pgadmin-init.sh"
sleep 2

USER_EMAIL="${PGADMIN_USER_DIR:-admin_vimaru.edu.vn}"
STORAGE_PATH="/var/lib/pgadmin/storage/$USER_EMAIL"

if [ -d "$STORAGE_PATH" ]; then
  if [ ! -L "$STORAGE_PATH/backups_link" ]; then
    echo "🔗 Tạo symlink backups_link → /backups"
    ln -s /backups "$STORAGE_PATH/backups_link"
  else
    echo "✅ backups_link đã tồn tại"
  fi
else
  echo "❌ STORAGE_PATH chưa tồn tại: $STORAGE_PATH"
  ls -l /var/lib/pgadmin/storage/
fi
