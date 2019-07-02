class CommentsController < ApplicationController
  before_action :set_quote
  before_action :set_comment, only: %i[show update destroy]
  before_action :require_admin, only: %i[create]

  def index
    @comments = @quote.comments.order('created_at desc')
    render_comments_json(@comments)
  end

  def show
    render_comments_json(@comment)
  end

  def create
    comment = @quote.comments.create!(comment_params)
    json_response(comment, :created)
  end

  def update
    @comment.update(comment_params)
    json_response(@comment)
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  # admin methods

  def show_comment
    comment = Comment.find_by!(id: params[:id])
    render_comments_json(comment)
  end

  private

  def comment_params
    params.permit(:text, :quote_id, :user_id)
  end

  def render_comments_json(comment)
    render json: comment, include: ['user'], status: :ok
  end

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def set_comment
    @comment = @quote.comments.find_by!(id: params[:id]) if @quote
  end
end
