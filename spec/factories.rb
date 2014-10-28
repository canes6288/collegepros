FactoryGirl.define do

  sequence (:name) { |n| "Name-#{n}" }
  sequence (:email) { |n| "email-#{n}@email.com" }

  factory :user do
    password              "foobar"
    password_confirmation "foobar"
    school                "Miami (Fla.)"
  end

  factory :player do
    school "Miami (Fla.)"
    name "Ed Reed"
  end
end
