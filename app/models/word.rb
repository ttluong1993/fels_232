class Word < ApplicationRecord
  belongs_to :category
  has_many :results, dependent: :destroy

  scope :learned_by, ->user {joins(:results).where "(results.correct = ?) 
    AND (results.lesson_id IN (?))", true, user.lessons.ids}
  scope :unlearned_by, ->user {where "id NOT IN (SELECT word_id 
    FROM words INNER JOIN results ON results.word_id = words.id 
    WHERE (results.correct = ? AND results.lesson_id IN (?)))", 
    true, user.lessons.ids}
  scope :category_by, ->category_id {where category_id: category_id}
  scope :pagination, ->params {paginate page: params, 
    per_page: Settings.words.per_page}

  after_save :update_category

  validates :category, presence: true

  private
  def update_category
    self.category.save
  end
end
