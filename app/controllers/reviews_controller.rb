class ReviewsController < ApplicationController
  before_filter :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :set_product, only: [:create]
  respond_to :html

  def index
    @comments = Review.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Review.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = @product.reviews.new(params[:review])
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @comment.product}
        format.js {}
      else
        format.html {render action "new"}
      end
    end
  end

  def update
    @comment.update_attributes(params[:review])
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Review.find(params[:id])
    end

    def set_product 
      @product = Product.find(params[:product_id])
    end
end


