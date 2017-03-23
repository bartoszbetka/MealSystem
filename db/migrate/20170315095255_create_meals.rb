class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name, :limit => 50, :null => false
      t.decimal :price, :precision => 5, :scale => 2, :null => false
      t.references :order, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
