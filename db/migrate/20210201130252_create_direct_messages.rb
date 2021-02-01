class CreateDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_messages do |t|
      t.references :from, index: true, foreign_key: { to_table: :users }
      t.references :to, index: true, foreign_key: { to_table: :users }
      t.text :body
      t.boolean :seen, default:false
      t.timestamps
    end
  end
end
