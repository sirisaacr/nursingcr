module ApplicationHelper

  passphrase = ActiveSupport::KeyGenerator.new("nursing").generate_key("nursingcr")
  @@encryptor = ActiveSupport::MessageEncryptor.new(passphrase)

  def encriptar(numero)
    @@encryptor.encrypt_and_sign(numero)
  end

  def desencriptar(encriptado)
    @@encryptor.decrypt_and_verify(encriptado)
  end

end
