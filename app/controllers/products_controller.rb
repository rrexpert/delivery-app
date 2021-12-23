class ProductsController < ApplicationController
  before_action :fetch_product, only: [:make_favorite]

  #for retrieve all products
  def index
    products = Product.search(params)
    render json: products
  end

  def make_favorite
    response = if @current_user.supplier?
      { success: false, message: 'Only buyer can like products' }
    elsif @current_user.buyer_products.find_or_create_by(product: @product)
      { success: true, message: 'Product successfully added to your favorites' }
    else
      { success: false, message: 'Product successfully added to your favorites' }
    end

    render json: response
  end

  def favorites
    render json: @current_user.favorite_products
  end

  private

  def fetch_product
    @product = Product.find(params[:id])
  end
end
