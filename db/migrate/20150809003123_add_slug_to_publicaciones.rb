class AddSlugToPublicaciones < ActiveRecord::Migration[4.2]
  def change
    add_column :publicaciones, :slug, :string
    add_index :publicaciones, :slug, unique: true
  end
end
