require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
    end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
     @@all.uniq.length
   end

   def self.reset_all
     @@all = []
   end

   def cats
     Cat.all.select do |cats|
       cats.owner === self
     end
   end

   def dogs
     Dog.all.select do |dogs|
       dogs.owner === self
     end
    end

   def buy_cat(name)
     Cat.new(name, self)
   end

   def buy_dog(new_dog)
     Dog.new(new_dog, self)
   end

   def walk_dogs
     Dog.all.each do |dogs|
       if dogs.owner == self
         dogs.mood = "happy"
     end
   end
end

  def feed_cats
    Cat.all.each do |cats|
      if cats.owner == self
        cats.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.each do |cats|
      if cats.owner == self
        cats.mood = "nervous"
        cats.owner = nil
      end
    end

    Dog.all.each do |dogs|
      if dogs.owner == self
        dogs.mood = "nervous"
        dogs.owner = nil
      end
    end
  end

    def list_pets
      "I have #{self.dogs.length} dog(s), and #{self.cats.count} cat(s)."
    end
 end
