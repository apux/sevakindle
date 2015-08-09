class AddSlugToAutores < ActiveRecord::Migration
  def change
    add_column :autores, :slug, :string
    add_index :autores, :slug, unique: true
  end
end
