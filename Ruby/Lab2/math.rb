class MATH
    def calc(num1, num2, operator)
      unless num1.is_a?(Numeric) && num2.is_a?(Numeric)
        raise "Please enter valid numbers"
      end
  
      case operator
      when "+"
        result = num1 + num2
      when "-"
        result = num1 - num2
      when "*"
        result = num1 * num2
      when "/"
        if num2 != 0
          result = num1.to_f / num2
        else
          raise "Error! Divide by 0"
        end
      else
        raise "Unsupported operation. Please enter a valid operator."
      end
  
      puts "The result of #{num1} #{operator} #{num2} = #{result}"
    end
  end
  
  operation1 = MATH.new
  operation1.calc(2, 3, "+")
  operation1.calc(2, 3, "*")
  operation1.calc(5, 3, "-")
  operation1.calc(2, 0, "/")
  operation1.calc("m", 3, "+")
  