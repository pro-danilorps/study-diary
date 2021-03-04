class StudyItem
  attr_reader :id, :title, :category

  @@study_items = []

  def initialize(title:, category:)

    @title = title
    @category = category

    @@study_items << self
  end

  def include?(query)
    title.downcase.include?(query.downcase) || category.downcase.include?(query.downcase)
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

  def self.search
    if all.empty? 
      puts 'Nenhum item encontrado' 
    else
      print 'Digite uma palavra para procurar: '
      term = gets.chomp
      found_items = all.filter do |item|
        item.include?(term)
      end
      puts found_items
    end
  end

  def self.delete
    if all.empty? 
      puts 'Nenhum item encontrado' 
    else
      puts all
      print 'Qual o id do Item de estudo você quer apagar? '
      id = gets.to_i
      study_item = all.detect do |study_item| 
        study_item.id == id
      end
      all.delete(study_item)
    end 
  end

end