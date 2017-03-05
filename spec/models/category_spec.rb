require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validate" do
    it "name presence" do
      category = Category.create name: "Sport"
      expect(category.errors.full_messages).to include "Name is not included in the list"
    end
  end
end
