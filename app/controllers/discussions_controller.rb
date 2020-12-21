# frozen_string_literal: true

# Discussions controller
class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # creates index
  def index
    @discussions = Discussion.all.order('title desc')
  end

  # initiates creation
  def new
    @discussion = current_user.discussions.build
  end

  # defines edit
  def edit; end

  # create new discussion
  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # update discussion
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # delete discussion
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
    end
  end

  private

  # finds discussion by pressed id
  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  # defines discussion parameters, cant create new discussion without using this
  def discussion_params
    params.require(:discussion).permit(:title, :content, :channel_id)
  end
end
