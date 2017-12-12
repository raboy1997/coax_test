class BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.search(params[:name]).page(params[:page]).per(5)
                       .where.not(id: try(:current_user).try(:usages).try(:pluck, :bicycle_id))

    if params[:category_id].present?
      @bicycles = @bicycles.where(category_id: params[:category_id])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @bicycle = Bicycle.new
    @category = Category.all
  end

  def create
    @category = Category.all
    @bicycle = Bicycle.create(bicycle_params)
    @bicycle.user_id = current_user.id

    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully created.' }
        format.json { render :show, status: :created, location: @bicycle }
      else
        @categories = Category.all
        format.html { render :new }
      end
    end
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @suggestions = @bicycle.suggestion
  end

  def use
    current_user.usages.create(bicycle_id: params[:id])

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Success!' }
      format.js
    end
  end

  private

  def search_params
    params.permit(:name, :category_id)
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :bicycle_photo, :category_id)
  end

end
