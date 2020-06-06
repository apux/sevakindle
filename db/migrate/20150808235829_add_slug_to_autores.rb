class AddSlugToAutores < ActiveRecord::Migration[4.2]
  def change
    add_column :autores, :slug, :string
    add_index :autores, :slug, unique: true
  end
end
