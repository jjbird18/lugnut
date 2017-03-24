class ProductlinesController < ApplicationController
	before_action :find_productline, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@productlines = Productline.all.order("title ASC")
	end

	def new
		@productlines = Productline.all
		@productline = Productline.all.build
	end

	def show
		@productline = Productline.find(params[:id])
	end

	def create 
		@productline = Productline.all.build(productline_params)
		@productline.user_id = current_user.id if current_user

		if @productline.save
			redirect_to @productline
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @productline.update(productline_params)
			redirect_to @productline
		else
			render 'edit'
		end
	end

	def destroy
		@productline.destroy
		redirect_to root_path
	end

	private

		def find_productline
			@productline = Productline.find(params[:id])
		end
		def productline_params
			params.require(:productline).permit(:title, :textdescription)
		end
end

