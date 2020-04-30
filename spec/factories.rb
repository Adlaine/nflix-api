require_relative "models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Isabela" }
    email { "isa@teste.com" }
    password { "abc123" }

    after(:build) do |user|
      #puts "apagando o email " + user.email
      Database.new.delete_user(user.email)
    end
  end

  factory :registared_user, class: UserModel do
    full_name { "Isach" }
    email { "isach@teste.com" }
    password { "abi123" }

    after(:build) do |user|
      #puts "apagando o email " + user.email
      Database.new.delete_user(user.email)
      ApiUser.save(user.to_hash)
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Isabela" }
    email { "isa#teste.com" }
    password { "abc123" }
  end

  factory :empty_name_user, class: UserModel do
    full_name { "" }
    email { "isa#teste.com" }
    password { "abc123" }
  end

  factory :empty_email_user, class: UserModel do
    full_name { "Isabela" }
    email { "" }
    password { "abc123" }
  end

  factory :empty_password_user, class: UserModel do
    full_name { "Isabela" }
    email { "isa#teste.com" }
    password { "" }
  end

  factory :null_name, class: UserModel do
    email { "isa@teste.com" }
    password { "abc123" }
  end

  factory :null_email, class: UserModel do
    full_name { "Isabela" }
    password { "abc123" }
  end

  factory :null_password, class: UserModel do
    full_name { "Isabela" }
    email { "isa@teste.com" }
  end
end
