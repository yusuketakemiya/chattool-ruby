class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :roomid
      t.integer :contentid
      t.string :userid
      t.string :username

      t.timestamps
    end
  end
end
