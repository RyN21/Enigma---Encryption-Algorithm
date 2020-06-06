class Key
  attr_reader :keys

  def initialize
    @keys = {A: 0, B: 0, C: 0, D: 0}
    @random_5digits = []
  end

  def random_5digits
    @random_5digits = 5.times.map do
      rand(9)
    end
  end


  # def assign_keys(random_5digits)
  #   keys.each do |key, value|
  #     until dsfasd
  #     end
  #   end
  # end

  # def assign_keys
  #   require "pry"; binding.pry
  #   keys[:A] = assign_keys[0,1]
  #   keys[:A] = assign_keys[0,1]
  #   keys[:A] = assign_keys[0,1]
  #   keys[:A] = assign_keys[0,1]
  # end
end
