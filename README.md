# 🖥️ Linux Server Administration & Automation

A hands-on Linux server administration project covering user management, web server deployment, automated monitoring, and log management on Ubuntu 22.04.

---

## 📌 Project Overview

This project demonstrates core Linux system administration skills required for Cloud Support and IT Infrastructure roles. All configurations and scripts are production-inspired and follow best practices.

---

## 🛠️ Technologies Used

| Tool | Purpose |
|------|---------|
| Ubuntu 22.04 | Server OS |
| Apache2 | Web Server |
| UFW (Uncomplicated Firewall) | Firewall Management |
| Bash Scripting | Automation |
| Cron Jobs | Task Scheduling |
| Logrotate | Log Management |
| SSH | Secure Remote Access |

---

## 📁 Project Structure

```
project1-linux-server/
├── scripts/
│   ├── health_monitor.sh       # CPU, memory, disk monitoring
│   ├── user_setup.sh           # User creation with SSH key auth
│   └── backup.sh               # Automated backup script
├── configs/
│   ├── apache.conf             # Apache virtual host config
│   ├── logrotate.conf          # Log rotation config
│   └── ufw_rules.sh            # Firewall rules setup
├── website/
│   └── index.html              # Static site served by Apache
└── README.md
```

---

## ⚙️ Setup & Usage

### 1. Update System
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Create a New User with SSH Key Authentication
```bash
bash scripts/user_setup.sh
```

### 3. Install & Configure Apache Web Server
```bash
sudo apt install apache2 -y
sudo cp configs/apache.conf /etc/apache2/sites-available/mysite.conf
sudo a2ensite mysite.conf
sudo systemctl restart apache2
```

### 4. Configure Firewall (UFW)
```bash
bash configs/ufw_rules.sh
```

### 5. Start Automated Health Monitoring
```bash
crontab -e
# Add this line to run every day at 8 AM:
# 0 8 * * * /path/to/scripts/health_monitor.sh >> /var/log/health.log 2>&1
```

### 6. Configure Log Rotation
```bash
sudo cp configs/logrotate.conf /etc/logrotate.d/mysite
sudo logrotate -f /etc/logrotate.d/mysite
```

---

## 📊 Features

- ✅ User management with SSH key-based authentication (no password login)
- ✅ Apache web server serving a static website on port 80
- ✅ UFW firewall allowing only ports 22 (SSH), 80 (HTTP), 443 (HTTPS)
- ✅ Automated daily system health report (CPU, RAM, Disk)
- ✅ Log rotation retaining 30 days of logs
- ✅ Cron job scheduling for automated tasks

---

## 📸 Screenshots

> Add screenshots of your terminal output, health monitor logs, and Apache site here.

---

## 🎓 What I Learned

- Linux file system structure and permissions (`chmod`, `chown`)
- SSH hardening and key-based authentication
- Writing and scheduling Bash automation scripts
- Apache virtual host configuration
- UFW firewall rules and security best practices
- Log management with logrotate

---

## 👩‍💻 Author

**Insha Taj Shaikh**
📧 inshashaikh1210@gmail.com
🌍 Belagavi, Karnataka
