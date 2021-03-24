FactoryBot.define do
  factory :user do
    name {"テスト"}
    email { "test@mail" }
    password { "111111" }
    password_confirmation { "111111" }

    factory :user1 do
      name {"ユーザー1"}
      email { "test1@mail" }
      password { "222222" }
      password_confirmation { "222222" }
    end

    factory :user2 do
      name {"ユーザー2"}
      email { "test2@mail" }
      password { "333333" }
      password_confirmation { "333333" }
    end
  end
end