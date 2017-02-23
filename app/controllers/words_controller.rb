class WordsController < ApplicationController
  def index
    category_id = params[:category_id]
    status = params[:status]
    words_by_category = if category_id.present?
      Word.category_by(category_id)
    else
      Word.all
    end
    words_by_filter = if words_by_category.respond_to? "#{status}_by"
      words_by_category.send("#{status}_by", current_user)
    else
      words_by_category
    end
    @words = words_by_filter.pagination params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
