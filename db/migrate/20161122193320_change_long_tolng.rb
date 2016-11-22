class ChangeLongTolng < ActiveRecord::Migration[5.0]
  def change
    rename_column :nodes, :long, :lng
  end
end
