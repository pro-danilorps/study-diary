class Display

  def clear
    system('clear')
  end

  def wait_keypress
    puts
    print 'Pressione ENTER para continuar... '
    gets
  end

  def wait_keypress_and_clear
    wait_keypress
    clear
  end

  def welcome
    'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
  end

end