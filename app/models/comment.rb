class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :anomaly

  validates :comment_content, presence: true
end
