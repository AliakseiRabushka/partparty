class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.includes(:product)
  end

  def create
    item = CartItem.find_or_initialize_by(product_id: params[:product_id])
    item.quantity ||= 0
    item.quantity += 1
    item.save
    redirect_to cart_items_path, notice: 'Товар добавлен в корзину.'
  end

  def update
    item = CartItem.find(params[:id])
    item.update(quantity: params[:quantity])
    redirect_to cart_items_path
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_items_path, notice: 'Товар удален из корзины.'
  end
end
