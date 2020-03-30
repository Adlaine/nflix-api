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
end
