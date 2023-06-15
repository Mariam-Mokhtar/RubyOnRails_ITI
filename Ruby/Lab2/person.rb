module PersonModule
    require 'date'
    #Class Person
    class Person
      #Variable instance 
      attr_accessor :fname, :lname, :birth_date, :age
      
      #Contructor
      def initialize()
        @fname = ""
        @lname = ""
        @birth_date = Date.today
        @age = 0
      end
  
      #Instance method get person data from user
      def getData()
        puts "Enter Your First Name: "
        @fname = gets.chomp
        puts "Enter Your Last Name: "
        @lname = gets.chomp
        puts "Enter Your Birth Date (yyyy-mm-dd): "
        @birth_date = Date.parse(gets.chomp)
        @age = self.calculate_age
      end
  
      #Calculate age in years, month, days
      def calculate_age()
        today = Date.today
        years = today.year - birth_date.year
        months = today.month - birth_date.month
        days = today.day - birth_date.day
      
        # Adjust for negative months and days
        if months < 0 || (months == 0 && days < 0)
          years -= 1
          months += 12
        end
      
        if days < 0
          months -= 1
          days += Date.new(today.year, today.month, 0).day
        end
      
        [years, months, days]
      end
  
      #Welcome Method
      def sendWelcomeMessage()
        puts "Welcome #{fname} #{lname}"
        puts "Your age is #{age[0]} years, #{age[1]} months, #{age[2]} days"
      end
    end
  end
  

  person = PersonModule::Person.new()
  person.getData()
  person.sendWelcomeMessage()