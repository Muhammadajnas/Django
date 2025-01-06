# Django Web Application Deployment with Docker, EC2, and CI/CD

This project demonstrates the deployment of a Python (Django) web application. The project includes:
- Web server setup using Django.
- Dockerization for consistent deployment across environments.
- Deployment on AWS EC2.
- CI/CD implementation for automated deployment.

## Features
- A Django-based web server.
- Docker containerization for easy and reliable deployment.
- Terraform for provisioning AWS EC2 instances.
- GitHub Actions for CI/CD pipeline.

---

## Prerequisites

1. [Python](https://www.python.org/downloads/) installed (for Django development).
2. [Docker](https://www.docker.com/) installed.
3. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed.
4. AWS credentials configured locally.
5. SSH key pair available (`~/.ssh/id_rsa.pub`).

# Installation and Setup

Follow the steps below to set up and run the project locally:

### Clone the Repository

```
git clone https://github.com/Muhammadajnas/Django.git
cd Django 

STRUCTURE

 Django/
├── <project_name>/        # Main project directory
│   ├── settings.py        # Project settings
│   ├── urls.py            # URL routing
│   ├── wsgi.py            # WSGI configuration
│   └── asgi.py            # ASGI configuration
├── <app_name>/            # Custom app directory
│   ├── migrations/        # Database migrations
│   ├── admin.py           # Admin site customization
│   ├── models.py          # Database models
│   ├── views.py           # Application views
│   └── urls.py            # App-specific URL routing
├── db.sqlite3             # SQLite database (auto-created)
├── manage.py              # Django's CLI utility
├── requirements.txt       # Python dependencies
└── README.md              # Project documentation
