module IndexHelper

  def log_in(persona)
    session[:user_id] = persona.ID_Persona
  end

  def current_user
    @current_user ||= Persona.find_by(ID_Persona: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    current_user = nil
  end

  def encuentra_usuario(usuario)
    @persona ||= Persona.where("Usuario = :input", {input: usuario}).first
  end

end
