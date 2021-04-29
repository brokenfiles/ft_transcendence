class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :guild

      t.string :display_name, default: nil
      t.string :role, default: "user"
      t.string :login, default: nil
      t.integer :points, default: 0
      t.string :oauth_token, default: nil
      t.string :double_auth, default: nil
      t.string :guild_rank, default: nil
      t.timestamp :banned, default: nil
      t.string :ban_reason, default: nil

      t.timestamps
    end
  end
end
