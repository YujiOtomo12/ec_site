class LineItemsController < ApplicationController
  def create
    book  = Book.find(params[:book_id])
    @line_item = @current_cart.add_product(book.id)
  
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_path }
      else
        format.html { redirect_to products_index_url, notice: 'Unprocessable entity.' }
      end
    end
  end
end
