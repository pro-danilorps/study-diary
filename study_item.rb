class StudyItem
  attr_reader :id, :title, :category

  @@next_id = 1
  @@study_items = []

  def initialize(title:, category:)
    @id = @@next_id
    @title = title
    @category = category

    @@next_id += 1
    @@study_items << self
  end

  def include?(query)
    title.include?(query) || category.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

  def self.all
    @@study_items
  end

  def self.search(term)
  end

  def self.print
  end

  def self.delete
    puts '==== Lista de items ===='
    # mostrar a lista aqui
    puts 'Qual o id do Item de estudo você quer apagar?'
    id = gets.to_i
    study_item = StudyItem.all.detect do |study_item| 
      study_item.id == id
    end
    StudyItem.all.delete(study_item)
  end
end