class ChangeTypeToMatchTypeInMatch < ActiveRecord::Migration[6.1]
  def change
    rename_column :battles, :type, :match_type
  end
end
