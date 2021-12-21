class ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def create
    product = Product.create(product_params)
    render json: product
  end

  private

  def product_params
    params.require(:product).permit(:name, :price) 
  end
end
