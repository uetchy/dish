class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.datetime :deleted_at

      t.references :user

      t.timestamps
    end
  end
end
