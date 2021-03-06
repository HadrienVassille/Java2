
class PostsController < ApplicationController
  
  before_action :set_post, only: [:update, :edit, :show, :destroy]
  
  def index
 
  @posts=Post.includes( :category, :tags).all
  respond_to do |format|
	format.html
	format.json{render json: @posts}
		
	end
  end
  
  def show
   respond_to do |format|
   format.html
   format.json{render json: @post}
   end
  
  end
  
  def edit
 
  
  end
  
  def update
  
  if @post.update(post_params)
	redirect_to posts_path, success: "Article modifie avec succes"
   else
		render 'edit'
    end
  
  end
  
  def new
  @post = Post.new
  end
  
 def create
 post = Post.new(post_params)
 if post.valid?
	post.save
	redirect_to post_path(post.id), success: "Article crée avec succes"
 else
 @post = post
 render 'new'
 end

 end
 
 def destroy

 @post.destroy
 redirect_to posts_path, success: "Article supprimé avec succès"
 
 end
 
 private
 def post_params
 params.require(:post).permit(:title, :content, :slug, :category_id)
 end
 
 def set_post
 @post = Post.find(params[:id])
 end
 
  
end
