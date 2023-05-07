class Tag < ApplicationRecord
  has_many :anomaly_tags,dependent: :destroy
  has_many :anomalys,through: :anomaly_tags
  
  validates :tag_name, uniqueness: true, presence: true
end
