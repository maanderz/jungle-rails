require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(password: 'some_password', password_confirmation: 'some_password', email: 'john@doe.com', name: 'John Doe') }

  describe "Validations" do

    it "password and password confirmation need to match" do
      subject.password = 'some_password'
      subject.password_confirmation = 'some_password'
      subject.password == subject.password_confirmation 
      expect(subject).to be_valid
    end 

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password or password confirmation" do
      subject.password = nil || subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if the email is not unique" do 
      user = User.create(
        password: '123',
        password_confirmation: '123',
        email: 'john@DOE.com',
        name: 'Jane Doe'
      )
      expect(user).to_not be_valid 
    end
    
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it "the password needs to have a minimum length of 8 characters" do
      subject.password = '123456'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "should login if credentials are valid" do
      user = User.create(
        password: '123456789',
        password_confirmation: '123456789',
        email: 'bill@doe.com',
        name: 'Bill Doe'
      )
      user.authenticate_with_credentials = expect(user).to be_valid  
    end 
  end

end
