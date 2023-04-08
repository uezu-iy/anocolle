class Anomaly < ApplicationRecord
  has_rich_text :content

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
