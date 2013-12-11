class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|

      t.timestamps
    end
  end
end
