class ChangeTwittersToTweets < ActiveRecord::Migration[6.0]
  def change
  	rename_table :twitters, :tweets
  end
end
