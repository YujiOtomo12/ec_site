class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def total_price
    book.price ||= 0
    book.price * quantity
  end

  def add_product(book_id)
    line_items.find_or_initialize_by(book_id: book_id)
  end
end
