# lesson-5 — Terraform on AWS (S3 backend + VPC + ECR)

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

## Мета
- Налаштувати S3 + DynamoDB як бекенд для Terraform state (з блокуванням).
- Створити VPC з 3 публічними та 3 приватними підмережами, IGW, NAT GW, маршрути.
- Створити ECR репозиторій з автоскануванням.

## Файли
- `main.tf` — підключення модулів і провайдера.
- `backend.tf` — конфігурація S3 бекенду.
- `outputs.tf` — загальні outputs.
- `modules/*` — модулі `s3-backend`, `vpc`, `ecr`.

## Команди
1. Ініціалізація (після створення S3 бакету і DynamoDB або якщо використовуєш локальний бекенд спочатку):
terraform init
2. Перевірка плану:
terraform plan
3. Застосування:
terraform apply
4. Видалення всієї інфраструктури:
terraform destroy
