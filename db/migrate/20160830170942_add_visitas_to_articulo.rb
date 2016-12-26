class AddVisitasToArticulo < ActiveRecord::Migration
  def change
    add_column :tbl_Articulo, :visitas, :integer
  end
end
