# Interview Rails App

Minimal Ruby on Rails API with `/pricing` endpoint.

## Development with Docker

This project is configured for Docker-based development with live reloading.

### Prerequisites

- Docker installed on your system
- Git (for cloning the repository)

### Quick Start

1. **Clone and navigate to the project:**
   ```bash
   git clone https://github.com/umami-dev/interview.git
   cd interview
   ```

2. **Build the Docker image:**
   ```bash
   docker build -t interview-app .
   ```

3. **Run the development container:**
   ```bash
   docker run -p 3000:3000 -v $(pwd):/rails interview-app
   ```

4. **Access the application:**
   - Open http://localhost:3000 in your browser
   - The Rails server will start automatically

### Development Features

- ✅ **Live Reloading**: Changes to your code are immediately reflected
- ✅ **Volume Mounting**: Your local code is mounted into the container
- ✅ **Development Gems**: All development dependencies are available
- ✅ **Database**: SQLite database is automatically prepared
- ✅ **Hot Reloading**: No need to restart the container for code changes

### Available Commands

```bash
# Build the Docker image
docker build -t interview-app .

# Run the development container
docker run -p 3000:3000 -v $(pwd):/rails interview-app

# Run in background
docker run -d -p 3000:3000 -v $(pwd):/rails --name interview-dev interview-app

# Stop the container
docker stop interview-dev

# Remove the container
docker rm interview-dev

# Run Rails commands in the container
docker run --rm -v $(pwd):/rails interview-app rails console
docker run --rm -v $(pwd):/rails interview-app rails db:migrate
docker run --rm -v $(pwd):/rails interview-app bundle install

# Run tests
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test test/controllers/pricing_controller_test.rb
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test -v

# View container logs
docker logs interview-dev
```

### Project Structure

```
interview/
├── app/
│   ├── controllers/
│   │   └── pricing_controller.rb    # Main API controller
│   └── models/
├── config/
│   ├── routes.rb                    # API routes
│   └── database.yml                 # Database configuration
├── Dockerfile                       # Development Docker configuration
└── Gemfile                         # Ruby dependencies
```

### API Endpoints

#### Pricing Endpoint

```bash
curl 'http://localhost:3000/pricing?period=Summer&hotel=FloatingPointResort&room=SingletonRoom'
```

**Response:**
```json
{ "rate": "12000" }
```

**Parameters:**
- `period`: Pricing period - must be one of: "Summer", "Autumn", "Winter", "Spring"
- `hotel`: Hotel name - must be one of: "FloatingPointResort", "GitawayHotel", "RecursionRetreat"
- `room`: Room type - must be one of: "SingletonRoom", "BooleanTwin", "RestfulKing"

### Troubleshooting

**Database issues:**
```bash
# Reset the database
docker run --rm -v $(pwd):/rails interview-app rails db:drop db:create db:migrate
```

**Gems not updating:**
```bash
# Rebuild the container
docker build -t interview-app .
```

**Permission issues:**
```bash
# Fix file permissions
sudo chown -R $USER:$USER .
```

### Development Workflow

1. Make changes to your code in your local editor
2. Changes are automatically reflected in the running container
3. View changes at http://localhost:3000
4. Use `docker logs interview-dev` to see server logs
5. Stop with `Ctrl+C` or `docker stop interview-dev`

### Testing

The project includes comprehensive tests for the pricing API. Run tests using Docker:

```bash
# Run all tests
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test

# Run specific test file
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test test/controllers/pricing_controller_test.rb

# Run tests with verbose output
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test -v

# Run a specific test method
docker run --rm -v $(pwd):/rails interview-app ./bin/rails test test/controllers/pricing_controller_test.rb -n test_should_get_pricing_with_all_parameters
```
