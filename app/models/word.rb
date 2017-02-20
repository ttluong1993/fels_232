class Word < ApplicationRecord
  belongs_to :category
  has_many :results, dependent: :destroy

  attr_accessor :filter_status, :filter_category

  scope :learned_by, ->user {joins(:results).where "results.lesson_id IN (?)", 
    user.lessons.ids}
  scope :unlearned_by, ->user {where "id NOT IN (?)", 
    Word.learned_by(user).ids}
  scope :category_by, ->category {where category_id: category.id}

  after_save :update_category

  validates :category, presence: true
end
