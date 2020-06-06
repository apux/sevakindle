class CreatePublicaciones < ActiveRecord::Migration[4.2]
  def change
    create_table :publicaciones do |t|
      t.string :titulo
      t.text :texto
      t.string :url_original
      t.references :autor, index: true
      t.references :tipo, index: true

      t.timestamps
    end
  end
end
