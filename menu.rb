REGISTER = 1
VIEW     = 2
SEARCH   = 3
DELETE   = 4
EXIT     = 5

class Menu
	def options
    puts "[#{REGISTER}] Cadastrar um item para estudar"
    puts "[#{VIEW}] Ver todos os itens cadastrados"
    puts "[#{SEARCH}] Buscar um item de estudo"
    puts "[#{DELETE}] Remover um item de estudo"
    puts "[#{EXIT}] Sair"
    print 'Escolha uma opção: '
  end
end