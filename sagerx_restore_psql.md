Để **restore file `sagerx_backup.sql`** vào PostgreSQL container (`sagerx` database), bạn làm theo các cách sau:

---

## ✅ Cách 1: Restore từ host vào container

Giả sử bạn đã có file `sagerx_backup.sql` trên máy host (cùng folder với `docker-compose.yml`):

```bash
cat sagerx_backup.sql | docker exec -i postgres psql -U sagerx -d sagerx
```

* `-i postgres`: tên container (theo `docker-compose.yml`)
* `-U sagerx`: username PostgreSQL
* `-d sagerx`: tên database

✅ **Nếu chạy thành công, dữ liệu sẽ được khôi phục.**

---

## ✅ Cách 2: Dùng `psql` từ host (cần cài sẵn PostgreSQL client)

```bash
export PGPASSWORD='sagerx'
psql -h localhost -p 5432 -U sagerx -d sagerx -f sagerx_backup.sql
```

---

## 🧪 Cách kiểm tra sau khi restore

Bạn có thể mở psql:

```bash
docker exec -it postgres psql -U sagerx -d sagerx
```

Rồi gõ:

```sql
\dt        -- xem các bảng
SELECT * FROM ten_bang LIMIT 5;
```

---

