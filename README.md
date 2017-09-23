# Satispay Ruby API

Full documentation here: https://ideonetwork.github.io/ruby-satispay/

## Usage

To use the API you need to initialize a new instance

```ruby
satispay = Satispay::Api.new(env, security_bearer)

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

For extra params info watch the official documentation: https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#get-a-user-list

### Create new user

```ruby
response = satispay.create_user(phone_number: user_phone_number, *extra_params)
```

For extra params info watch the official documentation: https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#create-a-user

### Get user

```ruby
response = satispay.get_user(user_id: user_satispay_id)
```

### Get all chanrges

```ruby
response = satispay.all_charges(*extra_params)
```

For extra params info watch the official documentation: https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#get-a-charge-list

### Create new charges

```ruby
response = satispay.create_charge(user_id: user_id, currency: 'EUR', amount: 100, *extra_params)
```

For extra params info watch the official documentation: 
https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#create-a-charge

### Get charge

```ruby
response = satispay.get_charge(charge_id: charge_id)
```

### Update charge


```ruby
response = satispay.update_charge(charge_id: charge_id, *extra_params)
```

For extra params info watch the official documentation: 
https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#update-a-charge

### Get all refunds

```ruby
response = satispay.all_refunds(*extra_params)
```

For extra params info watch the official documentation: https://s3-eu-west-1.amazonaws.com/docs.online.satispay.com/index.html#get-a-refunds-list

## Development

To update the documentation run:

```console

rdoc --op docs

```