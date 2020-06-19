class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        
        if @post.save
            flash[:notice] = '投稿に成功しました'
            redirect_to @post
        else
            flash.now[:danger] = '投稿に失敗しました'
            render :new
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    
    private
    
    def post_params
        params.require(:post).permit(:drink, :description)
    end
end
