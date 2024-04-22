module Helper
  def tirar_foto(nome_arquivo, resultado)
    caminho_arquivo = "reports/screenshots/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(foto)
    attach(File.open(foto, 'rb'), 'image/png')
  end
end
