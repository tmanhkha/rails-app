class AddCategoryIdToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_reference :microposts, :category, foreign_key: true
  end
end
