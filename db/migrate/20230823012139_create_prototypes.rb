class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      # prototypesテーブル
      t.string :title,         null: false
      t.text   :catch_copy,    null: false
      t.text   :concept,       null: false
      t.references :user,      null: false, foreign_key: true 

      t.timestamps
    end
  end
end

# class AddUserIdToPrototypes < ActiveRecord::Migration[6.0]
#   def change
#     add_column :prototypes, :user_id, :integer
#   end
# end