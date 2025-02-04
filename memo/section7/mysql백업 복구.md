### 📌 **MySQL 백업 및 복원 정리**

---

## ✅ **1. 데이터베이스 백업 (dump)**
데이터베이스를 `.sql` 파일로 백업하는 방법.

### 🔹 **1. 전체 데이터베이스 백업**
```bash
mysqldump -u root -p 데이터베이스명 > backup.sql
```
👉 `backup.sql` 파일에 데이터베이스의 전체 내용을 백업.

### 🔹 **2. 특정 테이블만 백업**
```bash
mysqldump -u root -p 데이터베이스명 테이블명1 테이블명2 > backup.sql
```
👉 특정 테이블만 백업.

### 🔹 **3. 모든 데이터베이스 백업**
```bash
mysqldump -u root -p --all-databases > all_backup.sql
```
👉 MySQL 서버의 모든 데이터베이스를 백업.

### 🔹 **4. 백업할 때 데이터 없이 구조만 저장**
```bash
mysqldump -u root -p --no-data 데이터베이스명 > structure.sql
```
👉 테이블의 **스키마(구조)만** 백업.

---

## ✅ **2. 데이터베이스 복원**
백업된 `.sql` 파일을 데이터베이스에 다시 적용하는 방법.

### 🔹 **1. 데이터베이스 복원 (일반적인 방법)**
```bash
mysql -u root -p 데이터베이스명 < backup.sql
```
👉 `backup.sql` 파일의 내용을 `데이터베이스명`에 복원.

### 🔹 **2. 모든 데이터베이스 복원**
```bash
mysql -u root -p < all_backup.sql
```
👉 MySQL 서버의 모든 데이터베이스를 복원.

### 🔹 **3. 새로운 데이터베이스에 복원**
기존 데이터베이스가 없거나, 새로운 데이터베이스에 복원하려면 먼저 생성 후 적용.

```bash
mysql -u root -p -e "CREATE DATABASE 새데이터베이스명"
mysql -u root -p 새데이터베이스명 < backup.sql
```

### 🔹 **4. 특정 테이블만 복원**
백업 파일에서 원하는 테이블만 골라서 `.sql` 파일을 편집한 후 실행.

```bash
mysql -u root -p 데이터베이스명 < 테이블_backup.sql
```

### 🔹 **5. 백업 파일이 너무 클 경우 (속도 개선)**
```bash
mysql -u root -p --max_allowed_packet=512M 데이터베이스명 < backup.sql
```
👉 큰 파일을 복원할 때 `max_allowed_packet` 값을 증가.

---

## 🎯 **정리**
| 작업 | 명령어 |
|------|------|
| **데이터베이스 전체 백업** | `mysqldump -u root -p 데이터베이스명 > backup.sql` |
| **특정 테이블만 백업** | `mysqldump -u root -p 데이터베이스명 테이블명1 테이블명2 > backup.sql` |
| **모든 데이터베이스 백업** | `mysqldump -u root -p --all-databases > all_backup.sql` |
| **구조(스키마)만 백업** | `mysqldump -u root -p --no-data 데이터베이스명 > structure.sql` |
| **백업된 데이터베이스 복원** | `mysql -u root -p 데이터베이스명 < backup.sql` |
| **새로운 데이터베이스에 복원** | `mysql -u root -p -e "CREATE DATABASE 새데이터베이스명"` <br> `mysql -u root -p 새데이터베이스명 < backup.sql` |
| **큰 백업 파일 복원** | `mysql -u root -p --max_allowed_packet=512M 데이터베이스명 < backup.sql` |

🚀 이제 MySQL 백업과 복원을 완벽하게 할 수 있을 거예요! 😃