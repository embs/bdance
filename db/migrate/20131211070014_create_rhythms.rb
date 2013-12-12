class CreateRhythms < ActiveRecord::Migration
  def change
    create_table :rhythms do |t|
      t.string :name
      t.text :description
      t.references :modality, null: false

      t.timestamps
    end
  end
end
