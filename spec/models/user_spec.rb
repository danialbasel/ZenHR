require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of email' do
      user = User.new(Email: nil)
      expect(user).to_not be_valid
    end
    it 'validates maximum length of email' do
      user = User.new(Email: 'a' * 256)
      expect(user).to_not be_valid
    end
    it 'validates format of email' do
      valid_emails = %w[email@example.com EMAIL@example.com email.example@com.au]
      valid_emails.each do |valid_email|
        user = User.new(Email: valid_email,password: '123')
        expect(user).to be_valid
      end
      invalid_emails = %w[email@example,com email_at_example.com email.example@com]
      invalid_emails.each do |invalid_email|
        user = User.new(Email: invalid_email,password: '123')
        expect(user).to_not be_valid
      end
    end
    it 'validates uniqueness of email' do
      user1 = User.create(Email: 'email@example.com')
      user2 = User.new(Email: 'email@example.com')
      expect(user2).to_not be_valid
    end
  end
  
  describe 'callbacks' do
    it "downcases email before saving" do
      user = User.new(Email: "EMAIL@EXAMPLE.COM",password: '123')
      user.save
      expect(user.Email).to eq("email@example.com")
    end
  end
end
