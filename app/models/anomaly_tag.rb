class AnomalyTag < ApplicationRecord
  belongs_to :anomaly
  belongs_to :tag
  
  validates :anomaly_id, presence: true
  validates :tag_id, presence: true
end
