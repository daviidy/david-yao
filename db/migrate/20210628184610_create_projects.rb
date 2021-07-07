class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :company
      t.date :start_year
      t.date :end_year
      t.text :short_desc
      t.text :long_desc
      t.string :github
      t.string :demo
      t.string :image

      t.timestamps
    end
  end
end
