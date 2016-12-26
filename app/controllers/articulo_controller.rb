class ArticuloController < ApplicationController

  def show
    @articulo = Articulo.find_by(ID_Articulo: desencriptar(params[:titulo]))
    if @articulo == nil
      redirect_to root_path
    else
      @persona = Persona.find_by(ID_Persona: @articulo.ID_Persona)
      if @persona == nil
        redirect_to root_path
      else
        Articulo.transaction do
          @articulo.visitas = @articulo.visitas + 1
          if !@articulo.save
            redirect_to root_path
          end
        end
      end
    end
  end

  def new
    if logged_in?
      @articulo = Articulo.new
    else
      redirect_to root_path
    end
  end

  def create
    @articulo = Articulo.new
      @articulo.Titulo = params[:articulo][:Titulo]
      @articulo.Resumen = params[:articulo][:Resumen]
      @articulo.Contenido = params[:articulo][:Contenido]
      @articulo.ID_Persona = current_user.ID_Persona
      @articulo.visitas = 0
      @articulo.Fecha = Date.today
    if @articulo.save
      params[:articulo][:file].each do |imagen|
        @recurso = Recurso.new
          @recurso.ID_Articulo = @articulo.ID_Articulo
          @recurso.URL = imagen
          @recurso.save
      end
    end
    redirect_to articulo_new_path
  end

  def all
    if params[:filtro] != nil
      @articulos = Articulo.where("Contenido LIKE '%#{params[:filtro]}%' OR Resumen LIKE '%#{params[:filtro]}%'  OR Titulo LIKE '%#{params[:filtro]}%'").order('Fecha DESC')
    else
      @articulos = Articulo.order('Fecha DESC').all
    end
  end

  def delete
    if logged_in?
      @articulo = Articulo.find_by(ID_Articulo: desencriptar(params[:titulo]))
      if @articulo != nil
        Articulo.transaction do
          @articulo.destroy
        end
      end
      redirect_to articulo_all_path
    else
      redirect_to root_path
    end
  end


end
