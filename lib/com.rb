require 'csv'

class Com 

   attr_reader :author , :content
   attr_writer :content

   @@fichier_csv_for_coms = "./db/coms.csv"

   
  def initialize (author, content)
    @author = author
    @content = content
  
  end


  #pour enregistrer un gossip
  def sauvegarde (id)
    CSV.open("./db/coms.csv", "a") do |csv|
      csv << [@author, @content, id]
    end
  end

  #pour récupérer tous les commentaires d'un gossip en particulier, s'il y en a et qui ne sont pas vides
  def self.all(id)
    puts id
    all_coms = []
    CSV.read("./db/coms.csv").each do |csv_line|
      if csv_line[2] == id && csv_line[1] != ""
      all_coms << Com.new(csv_line[0], csv_line[1])
      else
      end
    end

    return all_coms
  end


  def self.find(id)
    all_coms = Gossip.all
    return all_coms[id.to_i]
  end


end