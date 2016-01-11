class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.float :price
      t.float :cahiercard
    	t.date :date
    	t.text :description
    	t.string :affiche
      t.timestamps null: false
    end
  end
end
