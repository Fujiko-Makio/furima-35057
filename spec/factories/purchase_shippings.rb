FactoryBot.define do
  factory :purchase_shipping do
    post_code {'111-1111'}
    area_id {2}
    city {'東京都'}
    address {'大田区大森本町２'}
    building_name {'太田ビル'}
    phone_number {'08041235285'}
    token {"tok_abcdefghijk00000000000000000"}

    association :item
    
  end
end
