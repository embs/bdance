class CreatePrivateClasses < ActiveRecord::Migration
  def change
    create_table :private_classes do |t|
      t.references :pupil, :hours_package

      t.timestamps
    end

    add_index :private_classes, [:pupil_id, :hours_package_id]
  end
end
