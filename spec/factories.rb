FactoryGirl.define do
  # factory :task do
  #   # Factory only needs what is required by your model for each task
  #   title       "Walk the dog"
  #   completed   false
  #   user
  # end

  # sequence :name do |n|
  #   "Name#{n}"
  # end

  # sequence :email do |n|
  #   "email-#{n}@email.com"
  # end


  factory :user do
    name                  "Josh Kushner"
    email                 "joshkushner1@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end
