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
    
    def update
        @post = Post.find(params[:id])
        
        if @post.update(post_params)
            flash[:success] = '投稿は正常に更新されました'
            redirect_to @post
        else
            flash.now[:danger] = '投稿は更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        flash[:success] = '投稿は正常に削除されました'
        redirect_to posts_url
    end

    
    private
    
    def post_params
        params.require(:post).permit(:drink, :description)
    end
end
