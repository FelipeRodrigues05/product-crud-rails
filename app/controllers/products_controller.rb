class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    puts @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Product was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: "Product was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy!
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully deleted." }
    end
  end

  private
  def set_product
    @product = Product.find(params.expect(:id))
  end

  def product_params
    params.required(:product).permit(:name, :description, :price)
  end
end
