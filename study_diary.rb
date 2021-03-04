require_relative 'study_item'

REGISTER = 1
VIEW     = 2
SEARCH   = 3
EXIT     = 4

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def clear_and_wait_keypress
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

def search_items
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = StudyItem.all.filter do |item|
    item.include?(term)
  end
  print_items(found_items)
end

clear
puts welcome
option = menu

loop do
  clear
  case option
  when REGISTER
    StudyItem.register
  when VIEW
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?
  when SEARCH
    search_items
  when EXIT
    clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  else
    puts 'Opção inválida'
  end
  clear_and_wait_keypress
  option = menu
end