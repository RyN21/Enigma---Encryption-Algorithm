class Key
  attr_reader :assigned
  def initialize
    @assigned = Hash.new(0)
  end
  def random_digit_generator
    5.times.map do
      rand(5)
    end
  end

  def assign_keys
    # require "pry"; binding.pry
  end
end
