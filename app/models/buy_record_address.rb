class BuyRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :street_address, :building, :phone_number,
                :buy_record_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input correctly' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  end

  validates :token, presence: true

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   street_address: street_address, building: building, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end
