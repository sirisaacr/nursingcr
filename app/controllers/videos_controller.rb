class VideosController < ApplicationController
  def new
  end

  def create
    @video = Video.new
      @video.Titulo = params[:articulo][:Titulo]
      @video.Resumen = params[:articulo][:Resumen]
      @video.URL = params[:articulo][:URL].gsub('watch?v=', 'embed/')
      @video.visitas = 0
      @video.Fecha = Date.today
    if @video.save
      redirect_to video_all_path
    else
      redirect_to video_new_path
    end
  end

  def show
  end

  def all
    if params[:filtro] != nil
      @videos = Video.where("Resumen LIKE '%#{params[:filtro]}%'  OR Titulo LIKE '%#{params[:filtro]}%'").order('Fecha DESC')
    else
      @videos = Video.order('Fecha DESC').all
    end
  end

  def delete
    if logged_in?
      @video = Video.find(desencriptar(params[:titulo]))
      if @video != nil
        Video.transaction do
          @video.destroy
        end
      end
      redirect_to video_all_path
    else
      redirect_to root_path
    end
  end
end
