class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :url
      t.string :titls
      t.text :description
      t.integer :raiting

      t.timestamps null: false
    end
  end
end
