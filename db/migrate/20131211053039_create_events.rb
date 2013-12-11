class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :local
      t.datetime :date

      t.timestamps
    end
  end
end
