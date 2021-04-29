class CreateTournament < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :title, default: nil
      t.string :description, default: nil
      t.integer :price, default: 0
      t.boolean :rated, default: false
      t.boolean :generated, default: true

      t.timestamps
    end
  end
end
