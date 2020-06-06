class CreateAutores < ActiveRecord::Migration[4.2]
  def change
    create_table :autores do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
