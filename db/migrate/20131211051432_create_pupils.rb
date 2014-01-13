class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.text :observations

      t.timestamps
    end
  end
end
