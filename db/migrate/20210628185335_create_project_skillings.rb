class CreateProjectSkillings < ActiveRecord::Migration[6.0]
  def change
    create_table :project_skillings do |t|
      t.integer :project_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
