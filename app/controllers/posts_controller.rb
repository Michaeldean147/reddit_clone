class PostsController <ApplicationController

  before_action :find_post, :only =>[:show, :edit, :destroy, :update]


  def find_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def update
    if @post.update(post_params)
       redirect_to @post
    else
      render :edit
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end


  def destroy
    if current_user.id == @post.user_id
      @post.comments.each do |comment|
        comment.destroy
      end
      @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(
    :title,
    :description,
    :user_id
    )
  end
end
