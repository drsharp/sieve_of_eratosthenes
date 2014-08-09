class Primes

  def initialize(max_value)
    @max_value = max_value
    @is_prime = Array.new(max_value+1, true)
  end

  def self.generate(max_value)
    Primes.new(max_value).sieve
  end

  def sieve
    return [] if @max_value < 2
    result = Array.new
    (2..@is_prime.length).each do |i|
      if (@is_prime[i])
        result << i
        remove_multiples(i)
      end
    end
    result
  end

  private
  def remove_multiples(prime)
    j = 2*prime
    while j < @is_prime.length do
      @is_prime[j] = false
      j += prime
    end
  end

end
