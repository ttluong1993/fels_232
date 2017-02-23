class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :results, dependent: :destroy
  
  scope :updated_at_desc, ->{order updated_at: :desc}
  scope :following_by, ->user {where "user_id IN (SELECT followed_id
    FROM relationships  WHERE  follower_id = user_id)
    OR user_id = user_id", user_id: user.id}
end
