class AddTournamentToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.belongs_to :tournament, required: false
    end
  end
end
