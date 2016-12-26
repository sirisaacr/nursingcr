class Persona < ActiveRecord::Base

  self.table_name = 'tbl_Persona'
  self.primary_key = 'ID_Persona'

  has_secure_password

  has_many :articulo, :foreign_key => "ID_Persona", :dependent => :destroy

end
