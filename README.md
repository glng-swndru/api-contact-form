# API Contact Form

## Introduction
Contact forms play a crucial role in online communication, linking users with service providers effectively. Whether it's for gathering feedback, handling inquiries, or offering support, having a well-structured API simplifies the process.

This project demonstrates how to build a simple Contact Form API using Golang, Gin, GORM, and Docker. This technology stack provides excellent performance, scalability, and simplifies both deployment and maintenance.

## Project Overview
`api-contact-form` is a RESTful API that enables users to submit, retrieve, update, and delete contact messages. The project leverages:
- **Golang** as the main programming language
- **Gin** as the web framework
- **GORM** as the ORM for database interactions
- **Docker** for containerization

This API is designed to be efficient, scalable, and easy to deploy across various environments.

## Key Features
- **CRUD Operations**: Create, Read, Update, and Delete contact messages.
- **Structured API Responses**: Consistent and standardized responses for all endpoints.
- **Dockerized Deployment**: Containerized application for seamless deployment.
- **Environment Configuration**: Easily manage configurations using environment variables.

## Prerequisites
Ensure you have the following installed before proceeding:
- Golang (version 1.20 or later)
- Docker
- MariaDB or MySQL (or your preferred database)
- Docker Compose (optional, for easier deployment with multiple services)

## Installation

### Clone the repository
```bash
git clone https://github.com/yourusername/api-contact-form.git
cd api-contact-form
```

### Set up environment variables
Create a `.env` file and configure the necessary environment variables:
```
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=password
DB_NAME=contacts_db
DB_PORT=3306

# Server Configuration
SERVER_PORT=8080
```

### Run the application locally (without Docker)
Install dependencies:
```bash
go mod tidy
```

Run the application:
```bash
go run main.go
```

## Docker Deployment
To deploy using Docker:

Build the Docker image:
```bash
docker build -t api-contact-form .
```

Run the container:
```bash
docker run -p 8080:8080 --env-file .env api-contact-form
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/messages` | Submit a new message |
| GET | `/messages` | Retrieve all messages |
| GET | `/messages/:id` | Retrieve a single message |
| PUT | `/messages/:id` | Update a message |
| DELETE | `/messages/:id` | Delete a message |

## Example Usage

### Create a new contact message:
```bash
curl --location --request POST 'http://localhost:8080/messages' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "1234567890",
  "message": "Hello, I need support."
}'
```

### Get all contact messages:
```bash
curl --location 'http://localhost:8080/messages'
```

### Get a specific contact message by ID:
```bash
curl --location 'http://localhost:8080/messages/1'
```

### Update a contact message:
```bash
curl --location --request PUT 'http://localhost:8080/messages/1' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "phone": "0987654321",
  "message": "Updated message content."
}'
```

### Delete a contact message:
```bash
curl --location --request DELETE 'http://localhost:8080/messages/1'
```
