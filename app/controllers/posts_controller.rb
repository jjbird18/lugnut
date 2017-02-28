class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search]

	helper_method :sort_column, :sort_direction

	def search
		if params[:search].present?
			@posts = Post.where("lower(title) LIKE :search OR lower(content) LIKE :search", search: "%#{params[:search]}%".downcase) #TO LOWERCASE
			puts @posts
		else
			@posts = Post.all
		end
	end

	def index
		# @posts = Post.all.order("created_at DESC")
		@posts = Post.order("#{sort_column} #{sort_direction}")
	end

	def new
		@post = current_user.posts.build
	end

	def show
		@post = Post.find(params[:id])
	end

	def create 
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

		def find_post
			@post = Post.find(params[:id])
		end
		def post_params
			params.require(:post).permit(:title, :content)
		end
		def sortable_columns
			["title", "created_at"]
		end
		def sort_column
		    sortable_columns.include?(params[:column]) ? params[:column] : "Title"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "Asc"
		end
end