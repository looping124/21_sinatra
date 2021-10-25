# require 'pry'
# require 'csv'

class Gossip

   attr_reader :author , :content
   attr_writer :content
  def initialize (author, content)
     @author = author
     @content = content
  end
  def save ()
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end


  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id.to_i]
  end

  def self.update(id,content)
    all_gossips = Gossip.all
    all_gossips[id.to_i].content = content

    CSV.open("db/gossip.csv", "w") do |csv_line|
      all_gossips.each do |gossip|
      csv_line << [gossip.author, gossip.content]
      end
    end
  end

end