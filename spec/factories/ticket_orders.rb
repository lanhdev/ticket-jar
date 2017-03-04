FactoryGirl.define do
  factory :ticket_order do
    ticket_type nil
    quantity 1
    name "MyString"
    email "MyString"
    phone "MyString"
    address "MyString"
    total_price "9.99"
  end
end
