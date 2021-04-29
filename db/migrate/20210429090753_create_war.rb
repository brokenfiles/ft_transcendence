class CreateWar < ActiveRecord::Migration[6.1]
  def change
    create_table :wars do |t|
      t.timestamp :started_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :ended_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :reward, default: 0
      t.datetime :wartime_start
      t.datetime :wartime_end
      t.integer :max_unanswered, default: 10

      t.timestamps
    end
  end
end
