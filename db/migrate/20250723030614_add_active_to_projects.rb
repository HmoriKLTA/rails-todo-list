class AddActiveToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :active, :boolean, default: true, null: false
  end
end
