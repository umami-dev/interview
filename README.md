# Interview Rails App

Minimal Ruby on Rails API with `/pricing` endpoint.

## Setup

```bash
bundle install
rails s -p 8080
```

## Test the API

```bash
curl 'localhost:8080/pricing?period=summer&hotel=FloatingPointResort&room=SingletonRoom'
# response
{ "rate" : "12000" }
```

