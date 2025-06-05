# 🏡 Homelab Docker Compose Stack

This repository contains the Docker Compose configuration for my personal **homelab**. It includes a comprehensive suite of self-hosted tools for media automation, monitoring, VPN routing, and secure access — all managed via Docker Compose.


## 🖥️ Hardware

This homelab runs on the following hardware:

| Component         | Details                                                |
|------------------|---------------------------------------------------------|
| **CPU**          | AMD Ryzen 5 5600G                                       |
| **Motherboard**  | Gigabyte A520M S2H                                      |
| **Memory**       | 16GB Corsair Vengeance LPX DDR4 3600MHz CL18            |
| **Boot Drive**   | Patriot P210 256GB SATA SSD (RAID 0)                    |
| **Root Drive**   | Crucial P3 2TB NVMe SSD                                 |
| **Media Drive**  | WD_BLACK P10 5TB External HDD                           |
| **Storage Drive**| Crucial BX500 1TB SATA SSD (RAID 0)                     |


## 🚀 Services

| Service           | Description                                                  |
|------------------|---------------------------------------------------------------|
| **Bazarr**        | Subtitle management for Radarr and Sonarr                    |
| **Dozzle**        | Real-time log viewer for Docker containers                   |
| **FlareSolverr**  | Bypass Cloudflare protection (used with indexers)            |
| **Gluetun**       | VPN client container with DNS and kill switch                |
| **Homepage**      | Elegant dashboard for homelab service links                  |
| **Jellyfin**      | Open-source media server                                     |
| **Jellyseerr**    | Request manager for Jellyfin media                           |
| **Plex**          | Popular personal media server                                |
| **Profilarr**     | Centralized profile management for media apps                |
| **Prowlarr**      | Indexer manager for Sonarr/Radarr                            |
| **qBittorrent**   | Torrent client with Web UI                                   |
| **Radarr**        | Automated movie downloads and organization                   |
| **Sonarr**        | Automated TV show downloads and organization                 |
| **Speedtest Tracker** | Internet speed monitoring over time                      |
| **TinyAuth**      | Lightweight HTTP basic auth proxy                            |
| **Traefik**       | Reverse proxy with auto-HTTPS and dynamic routing            |
| **Uptime Kuma**   | Self-hosted uptime monitoring tool                           |
| **Vaultwarden**   | Lightweight Bitwarden-compatible password manager            |
| **Watchtower**    | Automatic Docker container updates                           |


## 📂 Directory Structure

<pre>
homelab/
├── compose.yaml
├── .env.example
├── config/
│   └── traefik/
├── scripts/
│   ├── install-docker.sh
│   ├── update-gluetun-port.sh
│   └── setup-media-dirs.sh
└── services/
    ├── bazarr/
    ├── dozzle/
    ├── flareSolver/
    ├── gluetun/
    ├── homepage/
    ├── jellyfin/
    ├── jellyseerr/
    ├── plex/
    ├── prowlarr/
    ├── qbittorrent/
    ├── radarr/
    ├── sonarr/
    ├── speedtest-tracker/
    ├── tinyAuth/
    ├── traefik/
    ├── uptime-kuma/
    ├── vaultwarden/
    └── watchtower/

</pre>


## 🛠️ Scripts

This directory contains utility scripts for managing the homelab environment:

- `docker.sh`: Installs Docker and Docker Compose on a fresh system.
- `update_qbit_port.sh`: Automatically updates the forwarded port configuration for Gluetun VPN.
- `create_media_dirs.sh`: Sets up media directories for Plex, Jellyfin, Radarr, Sonarr, etc.

Run these scripts as needed to automate setup and maintenance tasks.


## 🔧 Setup Instructions

### 1. Prerequisites

- Linux-based system (Ubuntu recommended)
- Docker & Docker Compose installed
- Port forwarding for 80/443 (if external access is required)
- VPN credentials (for Gluetun setup)

### 2. Clone and Configure

~~~bash
git clone https://github.com/xskayne/homelab.git
cd homelab
cp .env.example .env  # Edit this file with your configuration
~~~

### 3. Start the Stack

~~~bash
docker-compose up -d
~~~

### 4. Monitor & Manage

~~~bash
docker-compose logs -f
~~~

You can manage services via **Homepage**, or directly via ports/hostnames managed by **Traefik**.


## 🌐 Networking & Routing

All services are routed using **Traefik**, with optional HTTPS via Let's Encrypt.

- **TinyAuth** adds basic authentication to exposed services
- **Gluetun** handles VPN routing for qBittorrent and other traffic-sensitive services


## 🔐 Security Notes

- Store secrets in `.env` and never commit them
- Use VPNs or firewalls to restrict access when exposing services
- Traefik with HTTPS + TinyAuth provides simple secure access externally


## 📊 Monitoring Tools

- **Dozzle** – View real-time logs per container  
- **Uptime Kuma** – Service uptime and response tracking  
- **Speedtest Tracker** – Historical tracking of internet speed performance


## 🔄 Updates & Maintenance

- **Watchtower** keeps your containers updated automatically
- Use `docker-compose pull && docker-compose up -d` for manual updates


## 🤝 Contributing

This project is intended for personal use, but forks and suggestions are welcome. Feel free to open issues or PRs.
