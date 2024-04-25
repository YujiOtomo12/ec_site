class Book < ApplicationRecord
  has_many :taggings
  has_many :tags,through: :taggings
  has_many :line_items
  has_many :order_details, dependent: :destroy #追記
  has_many :orders, through: :order_details # 追記

  enum status: {salling: 1, sold_out: 2}
end
