require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validate" do
    it 'name presence' do
      user = User.create(email: "user@example.com", password: "123")
      expect(user.errors.full_messages).to include "Name can't be blank"
    end

    it 'email presence' do
      user = User.create(name: "User", password: "123")
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'email unique' do
      user1 = User.create(name: "User 1", email: "user@example.com", password: "123")
      user2 = User.create(name: "User 2", email: "user@example.com", password: "123")
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end
  end
end