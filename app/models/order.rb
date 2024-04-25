class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy #追記
  has_many :books, through: :order_details # 追記

  def total_price # 追加
    order_details.sum { |order| order.total_price } # 追加
  end # 追加
  
  def total_number # 追加
    order_details.sum { |order| order.quantity } # 追加
  end # 追加
end
