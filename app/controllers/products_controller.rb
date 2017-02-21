class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  @productlines = Productline.all

  def index
    @products = Product.all.order("productname ASC")
  end

  def new
    @productlines = Productline.all
    @products = Product.all
    @product = Product.all.build
  end

  def show
    @product = Product.find(params[:id])
  end

  def create 
    @product = Product.all.build(product_params)

    if @product.save
      
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:productcode, :productname, :productscale, :productvendor, :productdescription, :quantityinstock, :buyprice, :msrp, :productline_id)
    end
end

