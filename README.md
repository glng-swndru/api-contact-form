# api-contact-form

## Introduction
Contact forms play a crucial role in online communication, linking users with service providers effectively. Whether it's for gathering feedback, handling inquiries, or offering support, having a well-structured API simplifies the process.

This project demonstrates how to build a simple **Contact Form API** using **Golang, Gin, GORM, and Docker**. This technology stack provides excellent performance, scalability, and simplifies both deployment and maintenance.

## Project Overview
**api-contact-form** is a RESTful API that enables users to submit, retrieve, update, and delete contact messages. The project leverages:
- **Golang** as the main programming language
- **Gin** as the web framework
- **GORM** as the ORM for database interactions
- **Docker** for containerization

This API is designed to be **efficient, scalable, and easy to deploy** across various environments.

## Key Features
- **CRUD Operations**: Create, Read, Update, and Delete contact messages.
- **Structured API Responses**: Consistent and standardized responses for all endpoints.
- **Dockerized Deployment**: Containerized application for seamless deployment.
- **Environment Configuration**: Easily manage configurations using environment variables.

## Prerequisites
Ensure you have the following installed before proceeding:
- [Golang](https://go.dev/dl/)
- [Docker](https://www.docker.com/get-started)
- [PostgreSQL/MySQL](https://www.postgresql.org/) (or your preferred database)

## Installation
1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/api-contact-form.git
   cd api-contact-form
   ```

2. **Set up environment variables**
   Create a `.env` file and configure the necessary environment variables:
   ```sh
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=password
   DB_NAME=contact_db
   DB_PORT=5432
   SERVER_PORT=8080
   ```

3. **Run the application (without Docker)**
   ```sh
   go mod tidy
   go run main.go
   ```

## Docker Deployment
To deploy using Docker:
1. **Build the Docker image**
   ```sh
   docker build -t api-contact-form .
   ```

2. **Run the container**
   ```sh
   docker run -p 8080:8080 --env-file .env api-contact-form
   ```

## API Endpoints
| Method | Endpoint       | Description              |
|--------|---------------|--------------------------|
| POST   | `/messages`   | Submit a new message    |
| GET    | `/messages`   | Retrieve all messages   |
| GET    | `/messages/:id` | Retrieve a single message |
| PUT    | `/messages/:id` | Update a message       |
| DELETE | `/messages/:id` | Delete a message       |

