# Server Performance Stats

Script Bash bسيط لي كيعطيك نظرة شاملة على حالة السرفر ديالك (CPU, RAM, Disk, و Top Processes) فشي ثواني، بلا ما تحتاج تدخل لعدة أوامر بوحدها.

## 📋 Description

`server-stats.sh` هو سكريبت واحد كيجمع أهم المعلومات ديال الأداء (performance) ديال أي سرفر Linux، ويعرضها بشكل منظم ومقروء فـ terminal.

## ✨ Features

السكريبت كيعرض:

1. **CPU Usage** — النسبة المئوية ديال استعمال المعالج (total, machi per-core)
2. **Memory Usage** — RAM المستعملة، RAM الفارغة، والنسبة المئوية
3. **Disk Usage** — المساحة المستعملة والفارغة فـ الديسك، مع النسبة المئوية
4. **Top 5 Processes by CPU** — أكثر 5 processes كايستهلكو المعالج
5. **Top 5 Processes by Memory** — أكثر 5 processes كايستهلكو الذاكرة

## 🛠️ Requirements

السكريبت خدام على أي نظام Linux فيه هاد الأدوات (غالبا موجودين by default):

- `bash`
- `top`
- `free`
- `df`
- `ps`
- `awk`

## 🚀 Installation & Usage

### 1. حمل السكريبت
```bash
git clone https://github.com/username/server-performance-stats.git
cd server-performance-stats
```

### 2. عطيه صلاحية التنفيذ (executable permission)
```bash
chmod +x server-stats.sh
```

### 3. شغله
```bash
./server-stats.sh
```

## 📊 Example Output

```
=========================================
        SERVER PERFORMANCE STATS         
=========================================
CPU Usage: 15.3%

Memory Usage:
Used: 2048MB / Free: 4096MB (33.33%)

Disk Usage:
Used: 25G / Free: 75G (25%)

Top 5 processes by CPU usage:
    PID CMD                         %CPU
   1234 /usr/bin/node                12.5
   5678 mysqld                        8.2
   ...

Top 5 processes by memory usage:
    PID CMD                         %MEM
   1234 /usr/bin/node                 5.4
   5678 mysqld                        4.1
   ...
```

## 🔍 كيفاش خدام السكريبت (Technical Breakdown)

| Section | Command Used | الشرح |
|---|---|---|
| CPU Usage | `top -bn1 \| grep "Cpu(s)"` | كيجيب نسبة الـ Idle CPU وكينقصها من 100 باش يحصل على نسبة الاستعمال الحقيقية |
| Memory Usage | `free -m` | كيعطي RAM بـ Megabytes، و awk كيحسب النسبة المئوية |
| Disk Usage | `df -h --total` | كيعطي مساحة الديسك الكلية (total) بدل كل partition لوحدو |
| Top CPU Processes | `ps -eo pid,cmd,%cpu --sort=-%cpu` | كيرتب processes حسب استهلاك CPU من الأكبر للأصغر |
| Top Memory Processes | `ps -eo pid,cmd,%mem --sort=-%mem` | كيرتب processes حسب استهلاك RAM من الأكبر للأصغر |

## 💡 Possible Improvements (Ideas for later)

- [ ] زيادة argument بحال `--cpu-only` وla `--mem-only` باش يعرض غير جزء واحد
- [ ] Export النتائج لملف log (`.txt` وla `.csv`)
- [ ] إضافة alert/notification إلا CPU وla RAM دازو حد معين (threshold)
- [ ] دعم multiple servers عبر SSH
- [ ] عرض uptime ديال السرفر
- [ ] Cron job باش يشغل السكريبت automatiquement كل فترة

## 📄 License

Had المشروع مفتوح للاستعمال والتعديل بحرية (MIT License).

## 🤝 Contributing

Pull requests مرحب بيهم! إلا عندك اقتراح واlla bug، حل issue وla دير PR.
