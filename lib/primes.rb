class Primes

  def self.generate(max_value)
    return [] if max_value < 2

    # declarations
    is_prime = Array.new(&:false) # array of primes, false by default
    is_prime_size = max_value + 1 # size of array of primes
    is_prime_size.times do |i|
      is_prime[i] = true
    end

    return sieve(is_prime, is_prime_size)
  end

  private
  def self.sieve(is_prime_array, is_prime_size)
    result = Array.new
    (2..is_prime_size).each do |i|
      if (is_prime_array[i])
        result << i
        remove_multiples(i, is_prime_array, is_prime_size)
      end
    end
    result
  end

  def self.remove_multiples(prime, is_prime_array, is_prime_size)
    j = 2*prime
    while j < is_prime_size do
      is_prime_array[j] = false
      j += prime
    end
  end

end
