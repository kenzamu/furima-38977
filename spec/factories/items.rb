FactoryBot.define do
  factory :item do
    name { 'name' }
    description { 'text' }
    price { 2000 }
    condition_id       { 2 }
    postage_id         { 2 }
    prefecture_id      { 2 }
    category_id        { 2 }
    delivery_day_id    { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
