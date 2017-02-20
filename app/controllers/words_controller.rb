class WordsController < ApplicationController
  def index
  	@category = Category.find_by id: params[:filter_category].to_i
  	if @category.present?
  	  @words = Word.category_by(@category).paginate page: params[:page], per_page: Settings.words.per_page
  	else
  	  @words = Word.all.paginate page: params[:page], per_page: Settings.words.per_page
  	end
  	length = @words.length
  	@words_left = @words[0...length/2]
  	@words_right = @words[length/2...length]
  	respond_to do |format|
      format.html { redirect_to user_words_path(current_user) }
      format.js {render layout: false}
    end
  end

  private
  def filter_params
    params.require(:word).permit :filter_category, :filter_status
  end
end
