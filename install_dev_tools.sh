#!/bin/bash

set -e

# Функція для перевірки команди
command_exists() {
    echo "Перевіряємо наявність команди: $1"
    command -v "$1"
}

echo "Оновлюємо список пакетів..."
apt update

# -----------------------------
# Встановлення Docker
# -----------------------------
if command_exists docker; then
    echo "Docker вже встановлено: $(docker --version)"
else
    echo "Встановлюємо Docker..."
    apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    apt update
    apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin docker-ce-rootless-extras
    echo "Docker встановлено: $(docker --version)"
fi

# -----------------------------
# Встановлення Python 3+
# -----------------------------
if command_exists python3; then
    echo "Python вже встановлено: $(python3 --version)"
else
    echo "Встановлюємо Python..."
    apt install -y python3 python3-venv python3-dev python3-pip
    echo "Python встановлено: $(python3 --version)"
fi

# -----------------------------
# Встановлення Django
# -----------------------------
if python3 -m pip show django; then
    echo "Django вже встановлено: $(python3 -m django --version)"
else
    echo "Встановлюємо Django..."
    python3 -m pip install --upgrade pip
    python3 -m pip install Django
    echo "Django встановлено: $(python3 -m django --version)"
fi

echo "Всі інструменти встановлено або вже були наявні."
