class CreateAnomalyTags < ActiveRecord::Migration[6.1]
  def change
    create_table :anomaly_tags do |t|
      t.references :anomaly, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
