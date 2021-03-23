FactoryBot.define do
  factory :user do
    name {"テスト"}
    email { "test@mail" }
    password { "111111" }
    password_confirmation { "111111" }
  end
end