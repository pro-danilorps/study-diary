require_relative 'study_item'
require_relative 'menu'
require_relative 'display'
require_relative 'database'

display = Display.new
menu = Menu.new

display.clear
display.welcome
menu.options
option = gets.to_i


loop do
  display.clear
  case option
  when REGISTER
    StudyItem.register
  when VIEW
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?
  when SEARCH
    StudyItem.search
  when EXIT
    display.clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  when DELETE
    StudyItem.delete
  else
    puts 'Opção inválida'
  end
  display.wait_keypress_and_clear
  menu.options
  option = gets.to_i
end