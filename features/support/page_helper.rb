Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file}

module PageObjects
      #VARIAVEL GLOBAL
  def mapeando
    #VARIAVEL GLOBAL ||= CLASSE DESEJADA
    #@mapeando ||= MapeandoElementosdPage.new
  end
end
