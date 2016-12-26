class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :Titulo
      t.string :Resumen
      t.string :URL
      t.integer :visitas
      t.date :Fecha

      t.timestamps null: false
    end
  end
end
