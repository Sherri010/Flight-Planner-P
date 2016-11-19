class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.float :lat
      t.float :long
      t.belongs_to :route, foreign_key: true

      t.timestamps
    end
  end
end
