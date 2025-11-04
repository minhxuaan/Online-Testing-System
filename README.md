# Online-Testing-System Project
NetBeans project for Online Testing System

---

## Database
File database: `db/quizsystem.sql`

### 1. Import bằng MySQL command-line

1. Tạo database (nếu chưa có):
```sql
CREATE DATABASE quizsystem;
Import dữ liệu từ file SQL:

mysql -u root -p mystore < db/quizsystem.sql
2. Import bằng MySQL Workbench
Mở MySQL Workbench → Server → Data Import.
Chọn Import from Self-Contained File → chọn file db/quizsystem.sql.
Chọn target schema quizsystem và tick Dump Structure and Data.
Click Start Import.

3. Cấu hình kết nối database
Mở file cấu hình DB (ví dụ src/resources/db.properties hoặc DBConnection.java) và chỉnh thông tin:
db.url=jdbc:mysql://localhost:3306/quizsystem?useSSL=false&serverTimezone=UTC
db.user=root
db.password=YOUR_PASSWORD_HERE

4. Run project
Mở project trong NetBeans.
Clean and Build → Run.
Truy cập: http://localhost:8080/TracNghiemOnline/DangNhap.jsp

Thử login với account mẫu:
## Contributing / Git

Để cập nhật project lên GitHub:

```bash
git add .
git commit -m "Initial commit with README and project files"
git push origin main
