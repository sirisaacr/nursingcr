class IndexController < ApplicationController
  def welcome

  end

  def logout
    log_out
    redirect_to root_path
  end

  def login
    @persona = Persona.new
  end

  def iniciar_sesion
    if logged_in?
      redirect_to root_path
    else
      @persona = encuentra_usuario params[:index][:Usuario]
      if !@persona.nil?
        if @persona.authenticate(params[:index][:Contrasena])
          log_in @persona
          redirect_to root_path and return
        else
          redirect_to index_login_path
        end # End autenticacion
      else
        redirect_to index_login_path
      end # End usuario existente
    end # End logged_in?
  end



end
