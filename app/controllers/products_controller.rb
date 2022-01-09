# frozen_string_literal: true

# Controller for serving Product API
class ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def create
    product = Product.new(product_params)
    if product.valid?
      product.save
      render json: product
    else
      json_response(product.errors, 400)
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    render json: product
  end

  def destroy
    Product.destroy(params[:id])
  end

  private

  def product_params
    params.permit(
      :name,
      :price,
      :description,
      :status,
      :image
    )
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
