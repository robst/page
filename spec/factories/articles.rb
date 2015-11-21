# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    content "MyText"
    association :user, factory: :user, strategy: :build
  end
end
