module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color, :current_speed
  attr_reader :year, :model
  @@number_of_vehicles = 0

  def initialize(color, year, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def spray_paint(color)
    self.color = color

    puts "The new color of your #{year} #{model} is #{color}"
  end

  def speed_up(speed)
    self.current_speed += speed

    puts "Speeding the #{color} #{year} #{model} " \
         "up to #{current_speed} mph..."
  end

  def brake(speed)
    self.current_speed -= speed

    puts "Slowing down the #{color} #{year} " \
         "#{model} to #{current_speed} mph..."
  end

  def turn_off
    self.brake(self.current_speed) if self.current_speed > 0

    puts "The #{color} #{year} #{model} is now turned off..."
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles"
  end

  def self.calculate_gas_milage(miles_traveled, gas_total)
    puts "Your average gas milage is #{miles_traveled / gas_total} mpg"
  end

  def age
    puts "The #{self.model} is #{calculate_age} years old"
  end

  private

  def calculate_age
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

car = MyCar.new("Gray", 2009, "Jetta")
car.speed_up(150)
car.brake(50)
car.spray_paint("Blue")
car.turn_off
truck = MyTruck.new("white", 2011, "Toyota Tundra")

Vehicle.number_of_vehicles

MyCar.calculate_gas_milage(130, 20)

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

student = Student.new("Daniel", 100)
bill = Student.new("Bill", 70)
puts "Well done!" if student.better_grade_than?(bill)
