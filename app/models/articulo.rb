class Articulo < ActiveRecord::Base

  self.table_name = 'tbl_Articulo'
  self.primary_key = 'ID_Articulo'

  has_many :recurso, :foreign_key => "ID_Articulo", :dependent => :destroy

  belongs_to :persona, :class_name => "Persona", :foreign_key => "ID_Persona"

end
