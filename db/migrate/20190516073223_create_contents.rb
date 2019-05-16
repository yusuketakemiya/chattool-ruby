class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :ctype
      t.binary :content

      t.timestamps
    end
  end
end
