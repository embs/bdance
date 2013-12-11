class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.float :price
      t.time :hour
      t.string :local
      t.date :start
      t.date :end
      t.references :modality

      t.timestamps
    end
  end
end
