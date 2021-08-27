# frozen_string_literal: true

class CommentsController < ActionController::Base
  def index
    @comments = current_user.comments
  end

  def show
    @comment = comment.find(params[:id])
  end

  def new
    @comment = comment.new
  end

  def create
    @comment = comment.new(comment_params)

    if @comment.save
      redirect_to(owner_path(current_user),
                  flash: { notice: "comment successfully added!" })
    else
      redirect_to(comment_path(@comment),
                  flash: { error: @comment.errors.full_messages.to_sentence })
    end
  end

  private

  def pet_params
    params
      .require(:pet)
      .permit(%i[kind name gender years weight height description owner_id photo])
  end
end
