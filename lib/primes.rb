class Primes

  def self.generate(max_value)
    result = Array.new
    return result if max_value < 2

    # declarations
    is_prime = Array.new(&:false) # array of primes, false by default
    is_prime_size = max_value + 1 # size of array of primes
    is_prime_size.times do |i|
      is_prime[i] = true
    end

    sieve(is_prime, result, is_prime_size)

    return result
  end

  private
  def self.sieve(is_prime_array, result_array, is_prime_size)
    (2..is_prime_size).each do |i|
      if (is_prime_array[i])
        result_array << i
        remove_multiples(i, is_prime_array, is_prime_size)
      end
    end
  end

  def self.remove_multiples(prime, is_prime_array, is_prime_size)
    j = 2*prime
    while j < is_prime_size do
      is_prime_array[j] = false
      j += prime
    end
  end

end
