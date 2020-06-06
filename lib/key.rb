class Key
  attr_reader :keys, :digits

  def initialize
    @keys = {A: 0, B: 0, C: 0, D: 0}
    @digits = []
  end

  def random_5digits
    5.times.map do
      rand(9).to_s
    end
  end

  def pair_digits(digit)
    4.times do
      @digits << digit[0..1].join
      digit.shift
    end
  end

  # def assign_keys(digits)
  #   keys.each do |key|
  #     key = digits[0..1].join
  #     digits.shift
  #   end
  # end
end
