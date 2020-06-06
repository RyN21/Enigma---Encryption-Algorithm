class Key
  attr_reader :keys, :split_digits

  def initialize
    @keys = {A: 0, B: 0, C: 0, D: 0}
    @split_digits = []
  end

  def random_5digits
    5.times.map do
      rand(9).to_s
    end
  end

  def pair_digits(digits)
    4.times do
      @split_digits << digits[0..1].join
      digits.shift
    end
  end

  def assign_keys
    #possibly call pair digits here
    @keys = @keys.transform_values do |key|
      key = split_digits.shift
    end
  end
end
