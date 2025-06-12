class ProductsController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
    @products = Product.includes(:brand, :category)

    if params[:brand_id].present?
      @products = @products.where(brand_id: params[:brand_id])
    end

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Товар добавлен.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku, :price, :description, :brand_id, :category_id, :image)
  end
end
