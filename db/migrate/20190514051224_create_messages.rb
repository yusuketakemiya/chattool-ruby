class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :roomid
      t.integer :uuid
      t.string :userid
      t.string :username
      t.string :message

      t.timestamps
    end
  end
end
