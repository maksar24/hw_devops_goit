# lesson-8-9 — Terraform on AWS + Kubernetes (EKS + Helm + Django)
## Структура
lesson-8-9/
│
├── main.tf
├── backend.tf
├── outputs.tf
├── README.md
└── modules/
    ├── s3-backend/
    │   ├── s3.tf
    │   ├── dynamodb.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── vpc/
    │   ├── vpc.tf
    │   ├── routes.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ecr/
    │   ├── ecr.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── eks/
    │   ├── eks.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── argo_cd/
        ├── argo_cd.tf
        ├── namespace.tf
        ├── providers.tf
        ├── values.yaml
        ├── outputs.tf
        └── charts/
            ├── Chart.yaml
            └── templates/
                ├── application.yaml
                └── repository.yaml
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
- Розгорнути Jenkins через Helm для CI:
  - Pipeline збирає Docker-образ із Dockerfile
  - Пушить образ до ECR
  - Оновлює тег у `values.yaml` іншого репозиторію
  - Пушить зміни у main гілку
- Встановити Argo CD через Helm для GitOps:
  - Argo CD Application стежить за оновленнями Helm-чарту Django
  - Автоматично синхронізує зміни у кластері після оновлення Git

  ## CI/CD схема
```text
GitHub Repository
       │
       │ Push/PR
       ▼
    Jenkins Pipeline
       │
       │ Build Docker image
       │ Push to ECR
       │ Update values.yaml
       │ Git push
       ▼
Git repository (Helm chart updates)
       │
       │ Argo CD monitors changes
       ▼
Kubernetes Cluster (EKS)
       │
       │ Helm Release (django-app)
       │ Auto-sync via Argo CD
       ▼
Live Django Application

## Файли
- `main.tf` — підключення модулів і провайдера.
- `backend.tf` — конфігурація S3 бекенду.
- `outputs.tf` — загальні outputs.
- `terraform.tfvars` — значення змінних для локальної/віддаленої інфраструктури.
- `modules/*` — модулі `s3-backend`, `vpc`, `ecr`, `eks`.
- `charts/django-app/` — Helm-чарт для Django.
- `modules/argo_cd/charts/` — Helm-чарт для створення Argo CD Application.

## Команди
1. Ініціалізація (після створення S3 бакету і DynamoDB або якщо використовуєш локальний бекенд спочатку):
terraform init
2. Перевірка плану:
terraform plan
3. Застосування:
terraform apply
4. Перевірка статусу namespace і podів:
kubectl get ns
kubectl get pods -n django-app
kubectl get pods -n jenkins
kubectl get pods -n argocd
5. Видалення всієї інфраструктури:
terraform destroy
