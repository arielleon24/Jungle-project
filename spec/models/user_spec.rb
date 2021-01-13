require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "validates password and password_confirmation match" do 
      @user = User.new(email: 'test@mail.com', name: 'testman', password: 'password', password_confirmation: 'password')
      @user.save!
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "should require name" do
      @user = User.new(email: 'test@mail.com', name: nil, password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it "Should need email" do
      @user = User.new(email: nil, name: 'testman', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
    end

    it "Should have a password" do 
      @user = User.new(email: 'me@mail.com', name: 'testman', password: nil, password_confirmation: 'password')
      expect(@user).to_not be_valid
    end
  end

    describe '.authenticate_with_credentials' do
      it 'Should pass if credentials are correct' do
        user = User.new(email: 'test@mail.com', name: 'testman', password: 'password', password_confirmation: 'password')
        user.save
        expect(User.authenticate_with_credentials('test@mail.com', 'password')).not_to be(nil)
      end
    end
end
