class Primes

  def initialize(max_value)
    @is_prime = Array.new(&:false) # array of primes, false by default
    @is_prime_size = max_value + 1 # size of array of primes
    @is_prime_size.times {|i| @is_prime[i] = true }
  end

  def self.generate(max_value)
    return [] if max_value < 2
    primes = Primes.new(max_value)
    return primes.sieve
  end

  def sieve
    result = Array.new
    (2..@is_prime_size).each do |i|
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
    while j < @is_prime_size do
      @is_prime[j] = false
      j += prime
    end
  end

end
