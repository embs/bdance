class CreateHoraries < ActiveRecord::Migration
  def change
    create_table :horaries do |t|
      t.string :day
      t.datetime :start
      t.datetime :end
      t.references :group, index: true
      t.references :hours_package, index: true

      t.timestamps
    end
  end
end
