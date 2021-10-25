# require 'pry'
require 'csv'

class Gossip

   attr_reader :author , :content
   attr_writer :content

   @@fichier_csv_for_gossips = "./db/gossip.csv"

#initié a chaque création de gossip
  def initialize (author, content)
     @author = author
     @content = content
  end
  #pour enregistrer un gossip dans le CSV
  def save ()
    CSV.open(@@fichier_csv_for_gossips, "ab") do |csv|
      csv << [@author, @content]
    end

  end

  #pour récupérer un array avec tous les gossips
  def self.all
    all_gossips = []
    CSV.read(@@fichier_csv_for_gossips).each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  #pour récupérer un gossip en particuler dans l'array grace à un id
  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id.to_i]
  end

  #pour modifier un gossip
  def self.update(id,content)
    all_gossips = Gossip.all
    all_gossips[id.to_i].content = content

    CSV.open(@@fichier_csv_for_gossips, "w") do |csv_line|
      all_gossips.each do |gossip|
      csv_line << [gossip.author, gossip.content]
      end
    end
  end

end