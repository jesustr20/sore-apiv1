FactoryBot.define do
  factory :user do
    email { "jesus@mail.com" }
    age { 32 }
    password_digest { "MyString" }
    type { "test" }
  end
end
