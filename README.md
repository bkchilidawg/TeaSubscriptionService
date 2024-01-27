# Tea Subscriptions

## Project Learning Goals

 - Expose an API for CRUD functionality
 - Determine completion criteria based on the needs of other developers
 - Demonstrate error handling


## Prerequisites

Rails 7.1.2

## Installation

1. Gem Installation
   ```sh
    bundle install
   ```
2. Database reset
   ```sh
    rails db:{drop,create,migrate,seed}
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Testing
Use RSpec for testing.

### Running Tests

1. Run all tests
   ```sh
    bundle exec rspec
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Endpoint Usage

1. Start the local host server
   ```sh
   rails s
   ```

2. Call the api using the root address

    ```ruby
    http://localhost:3000
    ```
### Endpoints

  1. ```POST api/v0/subscriptions```

Call API using JSON payload in body to create a subscription for a specific tea and user. Ex:

```ruby
POST http://localhost:3000/api/v0/subscriptions 

```

Body
```
{
customer_id: 1,
tea_id: 1,
title: "Oolong Tea",
frequency: 30,
price: 10,
}
```

  2. ```PATCH api/v0/subscriptions/cancel```

Call API using JSON payload in body to cancel a specific tea subscription given the subscription's id. Ex:

```ruby
PATCH http://localhost:3000/api/v0/subscriptions/cancel
``````

Body
```
{
"id": 1
}
```

  3. ```GET api/v0/customers/:id/subscriptions ```

Call API with customer ID to view all subscriptions from that customer. Ex:

```ruby
GET http://localhost:3000/api/v0/customers/:id/subscriptions
```

 # Contributing

Blaine Kennedy 

[![LinkedIn][linkedin-shield]][linkedin-url-bk] 
[![GitHub][github-shield-bk]][github-url-bk]

[linkedin-url-bk]: https://www.linkedin.com/in/blaine-kennedy
[github-shield-bk]: https://img.shields.io/badge/GitHub-bkchilidawg-success?style=for-the-badge&logo=github
[github-url-bk]: https://github.com/bkchilidawg
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555