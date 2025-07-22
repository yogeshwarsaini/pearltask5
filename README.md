# Task 4 – Strapi Deployment on EC2 using Docker & Terraform

## ✅ Objective

Deploy a Strapi application on an AWS EC2 instance using Docker and Terraform.

---

## 📦 Tech Stack Used

- AWS EC2 (Provisioned via Terraform)
- Docker & Docker Compose
- Strapi CMS (Node.js)
- Nginx (as reverse proxy on port 80)
- Terraform (for infrastructure automation)

---

## 🛠️ Folder Structure
├── Dockerfile
├── docker-compose.yml
├── package.json
├── yarn.lock
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── provider.tf


---

## 🚀 Deployment Steps

### 1️⃣ Provision EC2 Instance using Terraform

```bash
cd terraform
terraform init
terraform apply

2️⃣ SSH into EC2 & Clone Project
ssh -i <your-key.pem> ec2-user@<EC2_PUBLIC_IP>

3️⃣ Build and Run Strapi with Docker
docker-compose up --build -d

⚙️ Environment Variables (if any)
You can create a .env or update the docker-compose.yml to pass:


STRAPI_ADMIN_BACKEND_URL=http://localhost
STRAPI_TELEMETRY_DISABLED=true

👨‍💻 Author
Yogeshwar Saini – DevOps Intern @ PearlThoughts
GitHub: yogeshwar-saini