require 'sqlite3'

class StudyItem
  attr_reader :id, :title, :category

  def initialize(id:, title:, category:)
    @id = id
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
    
    # Open a database
    db = SQLite3::Database.open 'study_diary.db'

    # Execute inserts with parameter markers
    db.execute("INSERT INTO study_items (title, category) 
    VALUES ( ?, ?)", [title, category])

    # Close the database
    db.close
  end

  def self.all
    @@study_items = []
    db = SQLite3::Database.open 'study_diary.db'
    db.execute( "select * from study_items" ) do |row|
    new(id: row[0], title: row[1], category: row[2])
    end
    db.close
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
    if @@study_items.empty? 
      puts 'Nenhum item encontrado' 
    else
      puts all
      print 'Qual o id do Item de estudo você quer apagar? '
      id = gets.to_i
      db = SQLite3::Database.open 'study_diary.db'
      db.execute(" delete from study_items where id = #{id}  ")
      db.close
    end
      puts 'Item deletado com sucesso!'
  end

  def self.show
    all
    puts @@study_items
  end
  
end