class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  scope :name_desc, ->{order name: :desc}
  scope :name_asc, ->{order name: :asc}
  scope :recently, ->{order name: :desc}
  scope :most_learned, ->{order "lessons_count DESC"}
  scope :pagination, ->params {paginate page: params, 
    per_page: Settings.categories.per_page}

  before_save :count_word

  private
  def count_word
    self.word_number = self.words.count
  end
end
