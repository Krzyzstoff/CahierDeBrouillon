class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.belongs_to :album, index: true
      t.string :photo
      t.timestamps null: false
    end
  end
end
