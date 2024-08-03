class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :user, null: true, foreign_key: true
      t.references :room, null: true, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
