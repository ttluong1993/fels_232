class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :cover
      t.integer :word_number

      t.timestamps
    end
  end
end
