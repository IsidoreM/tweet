class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def edit
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Tweet was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Tweet was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Tweet was successfully destroyed.'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:content)
    end
  end