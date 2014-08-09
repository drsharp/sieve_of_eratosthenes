class Primes

  def self.generate(max_value)
    result = Array.new
    return result if max_value < 2

    # declarations
    s = max_value + 1 # size of array
    is_prime = {}
    s.times do |i|
      is_prime[i] = true
    end

    is_prime[0] = is_prime[1] = false

    # sieve
    (2..(Math.sqrt(s).to_i+1)).each do |i|
      if (is_prime[i])
        j=2*i
        while j<s do
          is_prime[j] = false # multiple is not prime
          j += i
        end
      end
    end

    # move the primes into the result
    s.times do |i|
      if (is_prime[i])
        result << i
      end
    end

    return result
  end

end
