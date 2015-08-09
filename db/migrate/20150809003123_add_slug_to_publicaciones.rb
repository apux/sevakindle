class AddSlugToPublicaciones < ActiveRecord::Migration
  def change
    add_column :publicaciones, :slug, :string
    add_index :publicaciones, :slug, unique: true
  end
end
