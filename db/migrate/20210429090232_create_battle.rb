class CreateBattle < ActiveRecord::Migration[6.1]
  def change
    create_table :battles do |t|
      t.belongs_to :first_user, class_name: 'User'
      t.belongs_to :second_user, class_name: 'User'
      t.belongs_to :winner, class_name: 'User'

      t.string :scores, default: nil
      t.boolean :rated, default: false
      t.string :type, default: nil

      t.timestamps
    end
  end
end
