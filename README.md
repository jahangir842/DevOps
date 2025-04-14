
# DevOps Learning Repository

Welcome to the **DevOps Learning Repository** – a curated collection of practical examples, configurations, and notes to help you master modern DevOps tools and practices. This repository is organized into multiple directories, each focused on a specific DevOps technology.

---

## 📁 Repository Structure

Each folder contains hands-on examples, configuration files, and brief documentation where applicable.

### 🔧 `ansible`
Contains playbooks, inventory files, and examples using Ansible for configuration management and automation.

- Examples using `ansible.builtin.*` modules.
- Playbook best practices.
- Dynamic inventory setup.

📌 Example:
```bash
ansible-playbook playbooks/install_nginx.yml -i inventory/hosts
```

### 🐳 `docker`
Includes Dockerfiles, Docker Compose configurations, and usage examples.

- Dockerfile samples for various apps.
- Multi-stage builds.
- Docker Compose for multi-container apps.

📌 Example:
```bash
docker compose -f compose/node-app.yml up -d
```

### ☸️ `kubernetes`
Kubernetes manifests, Helm charts, and kubectl usage examples.

- Deployment, Service, Ingress YAML files.
- Helm basics.
- kustomize usage.

📌 Example:
```bash
kubectl apply -f manifests/deployment.yaml
```

### 🌍 `terraform`
Infrastructure as Code using Terraform across different cloud providers.

- AWS and Azure modules.
- Remote state management.
- Terraform Cloud examples.

📌 Example:
```bash
terraform init
terraform apply
```

### 🚀 `azure-devops`
Pipelines and tasks for automating CI/CD on Azure DevOps.

- YAML pipeline examples.
- Service connections.
- Multi-stage pipeline configuration.

📌 Example:
```yaml
trigger:
  branches:
    include:
      - main
```

### 🧬 `github-actions`
Workflows for automating tasks with GitHub Actions.

- CI/CD pipelines using `.github/workflows/`.
- Matrix builds and secrets.
- Deployment workflows.

📌 Example:
```yaml
name: Build and Test
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
```

---

## 📚 Getting Started

To start using the examples:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/devops-learning.git
   cd devops-learning
   ```

2. Navigate to the folder you're interested in and follow the instructions in the README (if available).

---

## 🧩 Contributions

Feel free to open issues or pull requests to add new tools, fix examples, or enhance documentation.

---

## 🛡 License

This project is licensed under the [MIT License](LICENSE).

---

Happy Automating! 🚀
```
