class CreateTiposPublicaciones < ActiveRecord::Migration[4.2]
  def change
    create_table :tipos_publicaciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
