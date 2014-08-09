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
      j=2*i
      while j<s do
        is_prime[j] = false # multiple is not prime
        j += i
      end
    end

    # how many primes are there?
    count = 0
    s.times do |i|
      if (is_prime[i])
        count += 1 # bump count
      end
    end

    primes = Array.new

    # move the primes into the result
    j=0
    s.times do |i|
      if (is_prime[i])
        primes[j] = i
        j += 1
      end
    end

    primes.length.times do |i|
      result << primes[i]
    end

    return result
  end

end
