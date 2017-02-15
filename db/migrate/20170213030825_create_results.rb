class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :lesson, foreign_key: true
      t.references :word, foreign_key: true
      t.string :answer
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
