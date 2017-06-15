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

```ruby
response = satispay.all_users
```

### Create new user

```ruby
response = satispay.create_user(phone_number: user_phone_number)
```

### Get user

```ruby
response = satispay.get_user(user_id: user_satispay_id)
```

