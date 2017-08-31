# frozen_string_literal: true

require 'rest-client'
require 'json'

# Satispay.
class Satispay

  def initialize(env, security_bearer)
    @env = (env == 'prod' ? :production : :staging)
    @url = (env == 'prod' ? 'https://authservices.satispay.com' : 'https://staging.authservices.satispay.com')
    @security_bearer = security_bearer
  end

  # Bearer requests:

  def check_bearer
    send_request('/wally-services/protocol/authenticated', :get, {})
  end

  # User requests:

  def all_users
    send_request('/online/v1/users', :get, {})
  end

  def create_user(args)
    args = validate_args(args, [:phone_number])
    send_request('/online/v1/users', :post, args)
  end

  def get_user(args)
    args = validate_args(args, [:user_id])
    send_request("/online/v1/users/#{args[:user_id]}", :get, {})
  end

  # Charge requests:

  def all_charges
    send_request('/online/v1/charges', :get, {})
  end

  def create_charge(args)
    args = validate_args(args, [:user_id, :currency, :amount])
    send_request('/online/v1/charges', :post, args)
  end

  def get_charge(args)
    args = validate_args(args, [:charge_id])
    send_request("/online/v1/charges/#{args[:charge_id]}", :get, {})
  end

  def update_charge(args)
    args = validate_args(args, [:charge_id])
    send_request("/online/v1/charges/#{args[:charge_id]}", :put, args)
  end

  # Refund requests:

  def all_refunds
    send_request('/online/v1/refunds', :get, {})
  end

  private

  # This function send a request to a specific url and return the response or
  # the error.
  def send_request(path, method, body)
    url = "#{@url}#{path}"
    response = (method == :get ? send_get_request(url) : send_post_request(url, body, method))
    JSON.parse(response.body) if response.body && !response.body.empty?
  rescue RestClient::ExceptionWithResponse => e
    error = JSON.parse(e.response)
    raise e.response
  end

  # This function send a GET request.
  def send_get_request(url)
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      verify_ssl: false,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@security_bearer}"
      }
    )
  end

  # This function send a POST request.
  def send_post_request(url, body, method)
    response = RestClient::Request.execute(
      method: method,
      url: url,
      verify_ssl: false,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@security_bearer}"
      },
      payload: body.to_json
    )
  end

  # This function validates an hash of arguments and raise an error if required
  # arguments are not present.
  def validate_args(args, required)
    required.each do |required_arg|
      raise 'Missing required argument' if args[required_arg] == nil
    end
    args
  end

end
