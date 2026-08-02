# Server Performance Stats

Un script Bash simple qui te donne une vue d'ensemble complète de l'état du serveur (CPU, RAM, Disque et Top Processus) en quelques secondes, sans avoir à taper plusieurs commandes séparément.

## 📋 Description

`server-stats.sh` est un script unique qui rassemble les informations de performance les plus importantes d'un serveur Linux, et les affiche de façon claire et organisée dans le terminal.

## ✨ Fonctionnalités

Le script affiche :

1. **CPU Usage** — Le pourcentage total d'utilisation du processeur
2. **Memory Usage** — La RAM utilisée, la RAM libre, et le pourcentage
3. **Disk Usage** — L'espace disque utilisé et libre, avec le pourcentage
4. **Top 5 Processes by CPU** — Les 5 processus consommant le plus de CPU
5. **Top 5 Processes by Memory** — Les 5 processus consommant le plus de mémoire

## 🛠️ Prérequis

Le script fonctionne sur n'importe quel système Linux disposant de ces outils (généralement présents par défaut) :

- `bash`
- `top`
- `free`
- `df`
- `ps`
- `awk`

## 🚀 Installation & Utilisation

### 1. Cloner le script
```bash
git clone https://github.com/username/server-performance-stats.git
cd server-performance-stats
```

### 2. Donner les droits d'exécution
```bash
chmod +x server-stats.sh
```

### 3. Lancer le script
```bash
./server-stats.sh
```

## 📊 Exemple de sortie

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

## 🔍 Fonctionnement technique

| Section | Commande utilisée | Explication |
|---|---|---|
| CPU Usage | `top -bn1 \| grep "Cpu(s)"` | Récupère le pourcentage d'inactivité (Idle) du CPU et le soustrait de 100 pour obtenir le taux d'utilisation réel |
| Memory Usage | `free -m` | Affiche la RAM en Mégaoctets, `awk` calcule ensuite le pourcentage |
| Disk Usage | `df -h --total` | Donne l'espace disque total (au lieu de chaque partition séparément) |
| Top CPU Processes | `ps -eo pid,cmd,%cpu --sort=-%cpu` | Trie les processus par consommation CPU, du plus grand au plus petit |
| Top Memory Processes | `ps -eo pid,cmd,%mem --sort=-%mem` | Trie les processus par consommation RAM, du plus grand au plus petit |

## 💡 Améliorations possibles

- [ ] Ajouter des arguments comme `--cpu-only` ou `--mem-only` pour n'afficher qu'une seule section
- [ ] Exporter les résultats dans un fichier log (`.txt` ou `.csv`)
- [ ] Ajouter des alertes/notifications si le CPU ou la RAM dépassent un certain seuil
- [ ] Support de plusieurs serveurs via SSH
- [ ] Afficher l'uptime du serveur
- [ ] Automatiser l'exécution via un cron job




