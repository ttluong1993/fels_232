class Word < ApplicationRecord
  belongs_to :category
  has_many :results, dependent: :destroy
end
