FactoryBot.define do
  factory :item do
    items_name          {"商品名"}
    description         {"商品説明"}
    price               {11111}
    category_id         {2}
    status_id           {2}
    area_id             {2}
    shipping_cost_id    {2}
    shipping_time_id    {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
