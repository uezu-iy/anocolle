class Tag < ApplicationRecord
  has_many :anomaly_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :anomalys,through: :anomaly_tags
  
  validates :tag_name, uniqueness: true, presence: true
end
