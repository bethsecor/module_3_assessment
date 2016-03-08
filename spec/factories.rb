FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "Item#{n}" }
    sequence(:description) { |n| "description#{n}" }
    image_url "http://www.eastcottvets.co.uk/uploads/Animals/gingerkitten.jpg"
  end

  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }

    factory :user_with_orders do
      transient do
        order_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:order_with_order_items, evaluator.order_count, user: user)
      end
    end
  end

  factory :orders do
    amount 2
    user

    factory :order_with_order_items do
      transient do
        order_items_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:order_items, evaluator.order_items_count, order: order)
      end
    end
  end

  factory :order_items do
    order
    item
  end
end
