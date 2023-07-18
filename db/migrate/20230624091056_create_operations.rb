class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.integer :amount
      t.datetime :odate
      t.string :description
      t.boolean :spend, default: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
