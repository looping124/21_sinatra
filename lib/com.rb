require 'csv'

class Com 

   attr_reader :author , :content
   attr_writer :content

   @@fichier_csv_for_coms = "./db/coms.csv"

   
  def initialize (author, content)
     @author = author
     @content = content
  end

  def sauvegarde ()
    CSV.open("./db/coms.csv", "a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_coms = []
    CSV.read("./db/coms.csv").each do |csv_line|
      all_coms << Com.new(csv_line[0], csv_line[1])
    end
    puts "voici all_coms"
    print all_coms
    return all_coms
  end


  def self.find(id)
    all_coms = Gossip.all
    return all_coms[id.to_i]
  end

  def self.update(id,content)
    all_coms = Gossip.all
    all_coms[id.to_i].content = content

    CSV.open("./db/coms.csv", "w") do |csv_line|
      all_coms.each do |gossip|
      csv_line << [gossip.author, gossip.content]
      end
    end
  end

end