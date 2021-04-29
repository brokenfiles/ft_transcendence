class CreateBattleTable < ActiveRecord::Migration[6.1]
  def change
    create_table :battles do |t|
      t.string :scores, default: nil
      t.boolean :rated, default: false
      t.string :type, default: nil

      t.timestamps
    end
  end
end
