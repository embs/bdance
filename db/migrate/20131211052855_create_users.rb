class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, as_relation_superclass: true do |t|
      t.string :rg
      t.string :profession
      t.date :birth
      t.string :cpf
      t.text :phone
      t.string :first_name
      t.string :last_name
      t.string :username

      t.timestamps
    end
  end
end
