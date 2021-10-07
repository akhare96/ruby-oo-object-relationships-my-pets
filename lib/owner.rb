require 'pry'
class Owner

  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets_total = Cat.all + Dog.all
    pets_total.each {|pet| 
    pet.mood = "nervous" 
    pet.owner = nil
    }
  end

  def list_pets
    #"I have #{self.dogs.count} dog#{"s" if self.dogs.count > 1}, and #{self.cats.count} cat#{"s" if self.cats > 1}."
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end