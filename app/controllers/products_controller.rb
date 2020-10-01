class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]

    def index 
    @products = Product.all
    if params[:query].present?
        @products = @products.where('name ILIKE? ', "%#{params[:query]}%")
    end
    if params[:seller].present?
        shop = Shop.find_by(name: params[:seller])
        @products = @products.where(shop_id: shop.id)
    end
    if params[:category].present?
        @products = @products.where(category_name: params[:category])
    end
    if params[:brand].present?
        @products = @products.where(brand: params[:brand])
    end
    end


    def new
    @product = Product.new
    end
    def show 
    @product = Product.find(params[:id])
    @strigowl = Strigowl.new
    end
    def create
    @product = Product.new(product_params)
        if @product.save
        redirect to @product
        else
        render :new
        end
    end

    def edit
    end

    def destroy
    @product.destroy
    end
end