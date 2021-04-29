class CreateGuild < ActiveRecord::Migration[6.1]
  def change
    create_table :guilds do |t|
      t.string :display_name, default: nil
      t.string :anagram, default: nil, limit: 5
      t.integer :points, default: 0
      t.integer :war_points, default: 0
      t.boolean :open, default: false

      t.timestamps
    end
  end
end
