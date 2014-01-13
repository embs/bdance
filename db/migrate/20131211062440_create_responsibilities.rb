class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.string :kinship
      t.references :pupil, :responsible

      t.timestamps
    end
    add_index :responsibilities, [:pupil_id, :responsible_id]
  end
end
