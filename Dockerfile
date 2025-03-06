# Stage 1: Build the application
FROM golang:1.23-alpine AS builder

# Set environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum first (for caching)
COPY go.mod go.sum ./

# Download dependencies
RUN go mod tidy && go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o api-contact-form .

# Stage 2: Create the production image
FROM alpine:latest

# Install tzdata for timezone support
RUN apk add --no-cache tzdata

# Set the timezone environment variable (can be overridden by .env)
ENV TZ=Asia/Jakarta

# Configure the timezone
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory
WORKDIR /app

# Create user and group for application
RUN addgroup -g 1001 binarygroup && \
    adduser -D -u 1001 -G binarygroup userapp

# Copy the binary from the builder stage
COPY --from=builder /app/api-contact-form .

# Ensure the binary is executable
RUN chmod +x api-contact-form

# Switch to the non-root user
USER userapp

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["./api-contact-form"]
