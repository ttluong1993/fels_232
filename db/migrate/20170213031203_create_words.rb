class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :japanese
      t.string :vietnamese
      t.references :category, foreign_key: true
      t.string :sample_answers

      t.timestamps
    end
    add_index :words, [:japanese, :vietnamese], unique:true
  end
end
