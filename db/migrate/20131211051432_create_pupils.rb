class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.text :observations
      t.references :responsible

      t.timestamps
    end
  end
end
