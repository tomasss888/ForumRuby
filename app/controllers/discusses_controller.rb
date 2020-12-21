# frozen_string_literal: true

#  Discusses controller
class DiscussesController < ApplicationController
  before_action :set_discuss, only: %i[show edit update destroy]

  # defines index
  def index
    @discusses = Discuss.all
  end

  # defines show
  def show; end

  # defines new
  def new
    @discuss = Discuss.new
  end

  # defines edit
  def edit; end

  # defines creating new discussion
  def create
    @discuss = Discuss.new(discuss_params)

    respond_to do |format|
      if @discuss.save
        format.html { redirect_to @discuss, notice: 'Discuss was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # defines update
  def update
    respond_to do |format|
      if @discuss.update(discuss_params)
        format.html { redirect_to @discuss, notice: 'Discuss was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # defines destroying of discusses
  def destroy
    @discuss.destroy
    respond_to do |format|
      format.html { redirect_to discusses_url, notice: 'Discuss was successfully destroyed.' }
    end
  end
end
