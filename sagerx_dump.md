Dựa trên nội dung `docker-compose.yml` bạn cung cấp, container PostgreSQL đang chạy có:

* **Tên container:** `postgres`
* **User:** `sagerx`
* **Password:** `sagerx`
* **Database:** `sagerx`
* **Port:** `5432` (được map ra host luôn)

---

### ✅ Dump database từ container

Bạn có thể chạy lệnh sau để dump trực tiếp từ container ra file trên host:

```bash
docker exec -t postgres pg_dump -U sagerx sagerx > sagerx_backup.sql
```

---

### ✅ Dump database từ host (host cần cài sẵn `pg_dump`)

```bash
export PGPASSWORD='sagerx'
pg_dump -h localhost -p 5432 -U sagerx -d sagerx > sagerx_backup.sql
```

---

### ✅ Tạo script tự động dump

Tạo file `backup_pg.sh`:

```bash
#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M")
OUTPUT="sagerx_backup_$TIMESTAMP.sql"

echo "🔄 Dumping PostgreSQL database from container..."
docker exec -t postgres pg_dump -U sagerx sagerx > "$OUTPUT"

if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $OUTPUT"
else
    echo "❌ Backup failed."
fi
```

Sau đó chạy:

```bash
chmod +x backup_pg.sh
./backup_pg.sh
```

---

Bạn có muốn tôi đóng gói lệnh này thành file `.zip` kèm hướng dẫn sử dụng?
