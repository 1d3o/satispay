require './lib/satispay'

RSpec.describe Satispay do

  # Set here satispay informations for tests
  security_bearer = 'osh_34ough7c6g2rkr0vkh2lrvjqj009setp54r4n2me991lekuv76go0glmiu9e74la49jae5t2j9l28l0l4lvndv2qg3fpfssn2133d4u4i86d2ek278lp2c3g5hdddtorsfrfct3mu50o9ljl5go8bovdqtg4tusnflji6p51np2envhhg1l5m3kjcbl5h1rac6m92831'
  existing_user_phone_number = '+393459210580'

  satispay = Satispay.new('staging', security_bearer)

  # Bearer requests:

  context 'check bearer' do

    it 'should not raise an error' do
      response = satispay.check_bearer
    end

  end

  # User requests:

  context 'get all users' do

    it 'should return users list' do
      response = satispay.all_users
      expect(response['has_more']).not_to eq nil
      expect(response['list']).not_to eq nil
    end

  end

  context 'create new user' do

    it 'should return new user informations' do
      response = satispay.create_user(phone_number: existing_user_phone_number)
      expect(response['id']).not_to eq nil
      expect(response['uuid']).not_to eq nil
      expect(response['phone_number']).to eq existing_user_phone_number
    end

  end

  context 'get user' do

    it 'should return user informations' do
      user_data = satispay.create_user(phone_number: existing_user_phone_number)
      response = satispay.get_user(user_id: user_data['id'])
      expect(response['id']).not_to eq nil
      expect(response['uuid']).not_to eq nil
      expect(response['phone_number']).to eq existing_user_phone_number
    end

  end

  # Charge requests:

  context 'get all charges' do

    it 'should return charges list' do
      response = satispay.all_charges
      expect(response['has_more']).not_to eq nil
      expect(response['list']).not_to eq nil
    end

  end

  context 'create new charge' do

    it 'should return new charge informations' do
      user_data = satispay.create_user(phone_number: existing_user_phone_number)
      response = satispay.create_charge(user_id: user_data['id'], currency: 'EUR', amount: 115)
      expect(response['id']).not_to eq nil
      expect(response['uuid']).not_to eq nil
      expect(response['currency']).to eq 'EUR'
      expect(response['amount']).to eq 115
    end

  end

  context 'get charge' do

    it 'should return charge informations' do
      user_data = satispay.create_user(phone_number: existing_user_phone_number)
      charge_data = satispay.create_charge(user_id: user_data['id'], currency: 'EUR', amount: 115)
      response = satispay.get_charge(charge_id: charge_data['id'])
      expect(response['id']).not_to eq nil
      expect(response['uuid']).not_to eq nil
      expect(response['currency']).to eq 'EUR'
      expect(response['amount']).to eq 115
    end

  end

  context 'update charge' do

    it 'should update charge and return charge informations' do
      user_data = satispay.create_user(phone_number: existing_user_phone_number)
      charge_data = satispay.create_charge(user_id: user_data['id'], currency: 'EUR', amount: 115)
      response = satispay.update_charge(charge_id: charge_data['id'], charge_state: 'CANCELED')
      expect(response['id']).not_to eq nil
      expect(response['uuid']).not_to eq nil
      expect(response['currency']).to eq 'EUR'
      expect(response['amount']).to eq 115
      expect(response['status']).to eq 'FAILURE'
    end

  end

  # Refund requests:

  context 'get all refunds' do

    it 'should return refunds list' do
      response = satispay.all_refunds
      expect(response['has_more']).not_to eq nil
      expect(response['list']).not_to eq nil
    end

  end

  context 'create new refund' do

    it 'should return new refund informations' do
      # user_data = satispay.create_user(phone_number: existing_user_phone_number)
      # charge_data = satispay.create_charge(user_id: user_data['id'], currency: 'EUR', amount: 115)
      # response = satispay.create_refund(charge_id: charge_data['id'], currency: 'EUR', amount: 100)
      # puts response
      # NB: Not tested because of a 500 error message
    end

  end

end
