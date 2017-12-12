class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_suggestion, only: [:destroy, :merge]

  def new
    @bicycle = Bicycle.find(params[:id])
    @suggestion = Suggestion.new(@bicycle.attributes.except('user_id', 'bicycle_img', 'bicycle_photo'))
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to bicycle_path(id: @suggestion.bicycle.id)
    else
      render 'new'
    end
  end

  def destroy
    @suggestion.destroy if @suggestion.bicycle.user == current_user
    redirect_to root_path
  end

  def merge
    @bicycle = @suggestion.bicycle
    if @bicycle.user == current_user
      @suggestion.bicycle.update(@suggestion.attributes.except('bicycle_id', 'id'))
      @bicycle.save
      @suggestion.destroy
      redirect_to root_path
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:name, :description,
                                               :category_id,
                                               :bicycle_id)
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end
end
