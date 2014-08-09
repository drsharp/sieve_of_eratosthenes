class Primes

  def self.generate(max_value)
    result = Array.new
    return result if max_value < 2

    # declarations
    is_prime = {} # array of primes
    is_prime_size = max_value + 1 # size of array of primes
    is_prime_size.times do |i|
      is_prime[i] = true
    end

    is_prime[0] = is_prime[1] = false

    # sieve
    (2..is_prime_size).each do |i|
      if (is_prime[i])
        result << i
        j = 2*i
        while j < is_prime_size do
          is_prime[j] = false # multiple is not prime
          j += i
        end
      end
    end

    return result
  end

end
