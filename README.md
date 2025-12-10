# lesson-5 — Terraform on AWS + Kubernetes (EKS + Helm + Django)
## Структура
lesson-5/
│
├── main.tf
├── backend.tf
├── outputs.tf
├── README.md
└── modules/
├── s3-backend/
│ ├── s3.tf
│ ├── dynamodb.tf
│ ├── variables.tf
│ └── outputs.tf
├── vpc/
│ ├── vpc.tf
│ ├── routes.tf
│ ├── variables.tf
│ └── outputs.tf
└── ecr/
├── ecr.tf
├── variables.tf
└── outputs.tf
charts/
└── django-app/
    ├── Chart.yaml
    ├── values.yaml
    ├── templates/
    │   ├── deployment.yaml
    │   ├── service.yaml
    │   ├── hpa.yaml
    │   └── configmap.yaml
    └── README.md

## Мета
- Налаштувати S3 + DynamoDB як бекенд для Terraform state (з блокуванням).
- Створити VPC з 3 публічними та 3 приватними підмережами, IGW, NAT GW, маршрути.
- Створити ECR репозиторій та завантажити Docker-образ Django.
- Створити кластер EKS з одним node group.
- Розгорнути Django-застосунок через Helm-чарт.
- Забезпечити доступ до застосунку через LoadBalancer.
- Додати ConfigMap для змінних середовища.
- Налаштувати HPA для автоматичного масштабування подів (від 2 до 6) при CPU > 70%.

## Файли
- `main.tf` — підключення модулів і провайдера.
- `backend.tf` — конфігурація S3 бекенду.
- `outputs.tf` — загальні outputs.
- `terraform.tfvars` — значення змінних для локальної/віддаленої інфраструктури.
- `modules/*` — модулі `s3-backend`, `vpc`, `ecr`, `eks`.
- `charts/django-app/` — Helm-чарт для Django.

## Команди
1. Ініціалізація (після створення S3 бакету і DynamoDB або якщо використовуєш локальний бекенд спочатку):
terraform init
2. Перевірка плану:
terraform plan
3. Застосування:
terraform apply
4. Видалення всієї інфраструктури:
terraform destroy
