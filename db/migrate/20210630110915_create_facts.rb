class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|
      t.references :user, foreign_key: true
      t.string :fact_text
      t.integer :likes

      t.timestamps
    end
  end
end
