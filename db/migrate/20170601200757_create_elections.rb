class CreateElections < ActiveRecord::Migration[5.1]
  def change
    create_table :elections do |t|
      t.string :name
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
