class RenamePublictoPublished < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :public, :published
  end
end
