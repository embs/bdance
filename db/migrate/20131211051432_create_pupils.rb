class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.text :observations
      t.references :responsible

      t.timestamps
    end

    create_table :hours_packages_pupils, id: false do |t|
      t.references :pupil, :hours_package
    end

    add_index :hours_packages_pupils, [:pupil_id, :hours_package_id]
  end
end
