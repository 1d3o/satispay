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
response = satispay.all_users(*extra_params)
```

### Create new user

```ruby
response = satispay.create_user(phone_number: user_phone_number, *extra_params)
```

### Get user

```ruby
response = satispay.get_user(user_id: user_satispay_id)
```

### Get all chanrges

```ruby
response = satispay.all_charges(*extra_params)
```

### Create new charges

```ruby
response = satispay.create_charge(user_id: user_id, currency: 'EUR', amount: 100, *extra_params)
```

### Get charge

```ruby
response = satispay.get_charge(charge_id: charge_id)
```

### Update charge


```ruby
response = satispay.update_charge(charge_id: charge_id, *extra_params)
```

### Get all refunds

```ruby
response = satispay.all_refunds(*extra_params)
```

