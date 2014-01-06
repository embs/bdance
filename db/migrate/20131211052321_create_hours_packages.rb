class CreateHoursPackages < ActiveRecord::Migration
  def change
    create_table :hours_packages do |t|
      t.references :teacher
      t.float :price
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
