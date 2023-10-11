FactoryBot.define do
  factory :buy_record_address do
    post_code          { '123-4567' }
    prefecture_id      { '2' }
    municipalities     { '神戸市中央区' }
    street_address     { '三宮1-1' }
    building           { '三宮ビル' }
    phone_number       { '11111111111' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
