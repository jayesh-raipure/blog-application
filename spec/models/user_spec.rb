require 'rails_helper'

RSpec.describe User, type: :model do
  it 'email uniqueness' do
    user = FactoryGirl.create(:user)
    next_user = FactoryGirl.build(:user)
    next_user.email = User.last.email
    next_user.valid? 
    expect(next_user.errors[:email]).to be == ['has already been taken']
  end
end