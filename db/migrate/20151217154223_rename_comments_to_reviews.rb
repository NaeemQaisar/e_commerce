class RenameCommentsToReviews < ActiveRecord::Migration
  def up
  	rename_table :comments, :reviews
  end

  def down

  	rename_table :reviews, :comments
  end
end
