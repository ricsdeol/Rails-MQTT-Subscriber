class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :topic
      t.string :message

      t.timestamps null: false
    end
    add_index :packages, :topic
  end
end
