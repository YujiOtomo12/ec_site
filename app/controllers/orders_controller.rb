class OrdersController < ApplicationController
  def new
    @order = Order.new
    @books = @current_cart.books
  end

  def confirm
    @order = Order.new(order_params)
    @books = Book.where(order_params[:book_ids]) # 編集
    @line_items = @current_cart.line_items # 追加
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      OrderDetail.create_items(@order, @current_cart.line_items)
      redirect_to complete_order_path(@order), notice: '注文が正常に登録されました'
    else
      redirect_to new_order_path, alert: '注文の登録ができませんでした'  
    end
  end

  def complete
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:count, :address, book_ids: [])
  end  
end