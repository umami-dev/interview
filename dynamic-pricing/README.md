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
docker run -p 3000:3000 -v $(pwd):/rails --name interview-dev interview-app

# Run in background
docker run -d -p 3000:3000 -v $(pwd):/rails --name interview-dev interview-app

# Run all tests (assuming container is running)
docker container exec -it interview-dev ./bin/rails test
# Run a specific file
docker container exec -it interview-dev ./bin/rails test test/controllers/pricing_controller_test.rb
# Run a specific test method
docker container exec -it interview-dev ./bin/rails test test/controllers/pricing_controller_test.rb -n test_should_get_pricing_with_all_parameters

# Run Rails commands in the container
docker container exec -it interview-dev ./bin/rails console
docker container exec -it interview-dev ./bin/rails db:migrate
docker container exec -it interview-dev bundle install

# Stop the container
docker stop interview-dev

# Remove the container
docker rm interview-dev
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
