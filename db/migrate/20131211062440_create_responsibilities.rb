class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.string :kinship
      t.references :pupil
      t.references :responsible

      t.timestamps
    end
  end
end
