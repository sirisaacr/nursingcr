class Recurso < ActiveRecord::Base

  mount_uploader :URL , RecursoUploader

  self.table_name = 'tbl_Recurso'
  self.primary_key = 'ID_Recurso'

  belongs_to :articulo, :class_name => "Articulo", :foreign_key => "ID_Articulo"

end
