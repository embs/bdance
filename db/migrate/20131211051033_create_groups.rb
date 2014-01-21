class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :local
      t.date :start
      t.date :end
      t.references :modality
      t.references :teacher

      t.timestamps
    end
  end
end
