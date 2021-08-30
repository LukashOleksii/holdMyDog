# frozen_string_literal: true

class CommentsController < ActionController::Base
  def index
    @comments = current_user.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    author   = User.find(params[:author_id])
    receiver = User.find(params[:receiver_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      if author.is_a?(Owner)
        redirect_to(sitter_path(receiver),
                    flash: { notice: 'comment successfully added!' })
      else
        redirect_to(owner_path(receiver),
                    flash: { notice: 'comment successfully added!' })
      end
    else
      redirect_to(comment_path(@comment),
                  flash: { error: @comment.errors.full_messages.to_sentence })
    end
  end

  private

  def comment_params
    params
      .permit(%i[body rating author_id receiver_id])
  end
end
