class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :responsibility
      t.float :wage

      t.timestamps
    end
  end
end
