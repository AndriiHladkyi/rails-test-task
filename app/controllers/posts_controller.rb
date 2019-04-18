class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :create_shared_url, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      if has_shared_url?
        format.html
        format.json { render json: @post }
      else
        format.html { redirect_to posts_url, notice: 'Create shared url.' }
        format.json { render json: @post }
      end
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        update_title
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_shared_url
    @post.update(shared_url: shared_url_value)

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Shared url was successfully create.' }
      format.json { render json: @post }
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def has_shared_url?
    @post&.shared_url ? true : false
  end

  def shared_url_value
    SecureRandom.hex
  end

  def update_title
    @post.update(title: "Title #{@post.id}")
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text, :category_id)
  end
end
