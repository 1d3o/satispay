# Satispay Ruby API

## Usage

To use the API you need to initialize a new instance

```ruby
satispay = Satispay.new(env, security_bearer)

# NB: env sholud be 'prod' or 'staging'
```

### Check bearer

Allow application to check if bearer is valid.

```ruby
response = satispay.check_bearer
```

### Get all users

TODO: Continue

