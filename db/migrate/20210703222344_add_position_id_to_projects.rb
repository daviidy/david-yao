class AddPositionIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :position_id, :integer
  end
end
