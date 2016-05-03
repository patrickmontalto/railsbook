FactoryGirl.define do
  factory :user do
    name 'example user'
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'f4k3p455w0rd'

    after(:build) { |user| user.class.skip_callback(:save, :after, :friend_default_user) }
  end

  factory :post do
    content "This is a post."
    association :author, factory: :user
  end

  factory :friendship do
    user
    association :friend, factory: :user
    accepted true

  end

  factory :like do
    user
    post
  end

  factory :comment do
    association :author, factory: :user
    post
    content "This is a comment."
  end
  
end