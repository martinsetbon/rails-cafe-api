class CreateCafes < ActiveRecord::Migration[7.1]
  def change
    create_table :cafes do |t|
      t.string :title
      t.string :address
      t.string :picture
      t.jsonb :hours #jsonb will give a hash
      t.string :criteria, array: true, default: []

      t.timestamps
    end
  end
end
