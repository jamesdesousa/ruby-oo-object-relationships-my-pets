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
       cats.owner.name == self.name
     end
   end

   def dogs
     arr = []
     arr = Dog.all.select do |dogs|
       dogs.owner.name == self.name


     end
       arr.sort
   end















end
