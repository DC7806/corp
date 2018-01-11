class Admin::CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    @admin_categories = Admin::Category.order(created_at: :desc)
  end

  def new
    @admin_category = Admin::Category.new
  end

  def create
    @admin_category = Admin::Category.new(category_params)
    if @admin_category.save
      redirect_to admin_categories_path, notice: "New Category Created"
    else
      flash[:alert] = "Something Went Wrong: "
      render :new
    end
  end

  def edit
  end

  def update
    if @admin_category.update(category_params)
      redirect_to admin_categories_path, notice: "Category Updated"
    else
      flash[:alert] = "Something Went Wrong: "
      render :edit
    end
  end

  def destroy
    @admin_category.destroy
    redirect_to admin_categories_path
  end

  private

  def find_category
    @admin_category = Admin::Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:admin_category).permit(:name, :permalink, :name_en, :"name_zh_tw")
  end

end
