class CreateAchievement < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|
      t.string :name, default: nil
      t.text :description, default: nil
      t.string :condition, default: nil

      t.timestamps
    end
  end
end
