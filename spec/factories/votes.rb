FactoryGirl.define do
  factory :vote do
    value [1, -1].sample
    post
    user
  end

  factory :up_vote, class: Vote do
    value 1
    post
    user
  end
  factory :down_vote, class: Vote do
    value -1
    post
    user
  end
end
