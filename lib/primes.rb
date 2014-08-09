class Primes

  def self.generate(max_value)
    result = Array.new

    primes = generate_array(max_value)
    primes.length.times do |i|
      result << primes[i]
    end

    return result
  end

  private
  
  # NOTE: this method is obsolete; use generate instead
  def self.generate_array(max_value)

    if max_value >= 2
      # declarations
      s = max_value + 1 # size of array
      f = {} # array of booleans
      s.times do |i|
        f[i] = true
      end

      # get rid of known nonprimes
      f[0] = f[1] = false

      # sieve
      (2..(Math.sqrt(s).to_i+1)).each do |i|
        j=2*i
        while j<s do
          f[j] = false # multiple is not prime
          j += i
        end
      end

      # how many primes are there?
      count = 0
      s.times do |i|
        if (f[i]) # if prime
          count += 1 # bump count
        end
      end

      primes = Array.new

      # move the primes into the result
      j=0
      s.times do |i|
        if (f[i]) # if prime
          primes[j] = i
          j += 1
        end
      end

      return primes

    else
      return []
    end
  end

end