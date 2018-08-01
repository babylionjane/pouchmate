class PostsController < ApplicationController
  def title
  end
  
  def cosmetic_table
    if params[:id].present?    #1 화장대 이동링크
      if user_signed_in?    #1-1 로그인 상태
        if params[:id] == current_user.id     #1-1-1 내 화장대로 이동
          @nickname = current_user.nickname
          @posts = Post.where(user_id:current_user.id)
          @friends_icon = friend_requests_path
          @friends_icon_comment = "친구관리"
          @friends_method = "get"
        else                                  #1-1-2 타인 화장대로 이동
          user_id = params[:id] 
          @nickname = User.find(user_id).nickname
          @posts = Post.where(user_id:user_id)
          @friends_icon = friend_requests_path(friend_id: user_id)
          @friends_icon_comment = "친구신청"
          @friends_method = "post"
        end
      else                  #1-2 비로그인 상태 => 타인 화장대로 이동
          user_id = params[:id] 
          @nickname = User.find(user_id).nickname
          @posts = Post.where(user_id:user_id)
      end
    else    #2 타이틀에서 화장대이동
      if user_signed_in?    #2-1 로그인 상태 => 내 화장대로 이동
        @nickname = current_user.nickname
        @posts = Post.where(user_id:current_user.id)
        @friends_icon = friend_requests_path
        @friends_icon_comment = "친구관리"
        @friends_method = "get"
      else                  #2-2 비로그인 상태 => 견본 화장대로 이동
        @nickname = "견본화장대"
        @posts = Post.all
      end
    end
  end
  
  def table_move
  end
  
  def janenewmypage
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    post = Post.new
    post.title = params[:post][:title]
    post.memo = params[:post][:memo]
    post.category = params[:post][:category]
    
    if params[:post][:"open_date(1i)"].present? && params[:post][:"open_date(2i)"].present? && params[:post][:"open_date(3i)"].present?
      open_date = Date.new(params[:post][:"open_date(1i)"].to_i, params[:post][:"open_date(2i)"].to_i, params[:post][:"open_date(3i)"].to_i) 
      post.open_date = open_date
    end
    if params[:post][:"exp_date(1i)"].present? && params[:post][:"exp_date(2i)"].present? && params[:post][:"exp_date(3i)"].present?
      exp_date = Date.new(params[:post][:"exp_date(1i)"].to_i, params[:post][:"exp_date(2i)"].to_i, params[:post][:"exp_date(3i)"].to_i) 
      post.exp_date = exp_date
    end
    
    post.public = params[:post][:public]
    post.user_id = params[:post][:user_id]
    post.img_url = params[:post][:image]
    post.save
    redirect_to posts_cosmetic_table_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:post][:title]
    post.memo = params[:post][:content]
    if !params[:post][:image].nil?
      post.img_url = params[:post][:image]
    end
    post.save
    redirect_to '/'
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
