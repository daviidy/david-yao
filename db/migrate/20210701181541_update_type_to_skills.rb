class UpdateTypeToSkills < ActiveRecord::Migration[6.0]
  def change
    rename_column :skills, :type, :skill_type
  end
end
