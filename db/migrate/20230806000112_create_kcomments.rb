class CreateKcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :kcomments do |t|
      t.string :content
      t.references :kuser, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
