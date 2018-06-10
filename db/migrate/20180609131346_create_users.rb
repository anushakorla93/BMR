class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :gender
      t.float :weight
      t.float :height
      t.float :age
      t.string :intake

      t.timestamps
    end
  end
end
