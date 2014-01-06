class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, as_relation_superclass: true do |t|
      t.string :responsibility
      t.float :wage

      t.timestamps
    end
  end
end
