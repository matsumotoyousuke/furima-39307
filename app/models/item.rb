class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
  end

  with_options presence: true do
    validates :explanation, length: { maximum: 1000 }
  end

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
