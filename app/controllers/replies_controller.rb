# frozen_string_literal: true

# Replies controller
class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: %i[edit update show destroy]
  before_action :set_discussion, only: %i[create edit show update destroy]

  # defines new reply creation
  def create
    @reply = @discussion.replies.create(params[:reply].permit(:reply, :discussion_id))
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion) }
      else
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply did not save. Please try again.' }
      end
    end
  end

  # defines new
  def new; end

  # defines deletion of reply
  def destroy
    @reply = @discussion.replies.find(params[:id])
    @reply.destroy
    redirect_to discussion_path(@discussion)
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.find(params[:id])
  end

  def update
    @reply = @discussion.replies.find(params[:id])
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show; end

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end
