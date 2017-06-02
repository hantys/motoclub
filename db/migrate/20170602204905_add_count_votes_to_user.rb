class AddCountVotesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :qnt_votes, :integer, default: 5
  end
end
