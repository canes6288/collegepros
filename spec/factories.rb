FactoryGirl.define do

  sequence :name do |n|
    "Name#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  factory :user do
    name
    email
    password              "foobar"
    password_confirmation "foobar"
    school                "Miami (Fla.)"
    phone                 "9999999999"
  end

  factory :player do
    school "Miami (Fla.)"
    name "Ed Reed"
  end
end
