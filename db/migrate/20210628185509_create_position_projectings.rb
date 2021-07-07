class CreatePositionProjectings < ActiveRecord::Migration[6.0]
  def change
    create_table :position_projectings do |t|
      t.integer :position_id
      t.integer :project_id

      t.timestamps
    end
  end
end
