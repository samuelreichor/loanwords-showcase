# Loanwords Showcase for Plugin Development

## Requirements
- DDEV installed locally

## Get started

### 1. Start ddev
```bash
ddev start
```

### 2. Install Composer Packages and set up Craft
```bash
ddev composer install && ddev craft setup/keys
```

### 2. Import dummy database
```bash
ddev import-db --file=./databases/db.sql
```

### 3. Launch Craft Control Panel
```bash
ddev launch admin
```

**You can access it with these credentials:**
<br>

>User: Admin <br>
>PW: admin123
