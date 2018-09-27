class CreateVenerations < ActiveRecord::Migration[5.2]
  def change
    create_table :venerations do |t|
      t.references :user, foreign_key: true
      t.text :caption
      t.integer :score

      t.timestamps
    end
  end
end
