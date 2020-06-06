class Key
  
  def random_digit_generator
    5.times.map do
      rand(5)
    end
  end

  def assign_keys
    require "pry"; binding.pry
  end
end
