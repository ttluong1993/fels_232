class CategoriesController < ApplicationController
  def index
  	search = params[:search]
  	order = params[:order].present? ? params[:order] : "name_asc"
    categories_by_search = if search.present?
      Category.where "name LIKE ?", search
    else
      Category.all
    end
    @categories = if categories_by_search.respond_to? order
      categories_by_search.send(order).pagination params[:page]
    else
      categories_by_search.pagination params[:page]
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
