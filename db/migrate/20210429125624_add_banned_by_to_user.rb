class AddBannedByToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.belongs_to :banned_by, class_name: 'User', required: false
    end
  end
end
