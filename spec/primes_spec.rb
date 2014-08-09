require 'prime' # Ruby prime handling
require 'primes' # Our Sieve class

describe Primes do

  KNOWN_PRIMES = [2,3,5,7,11,13,17,19,23,29]

  specify "Zero" do
    primes = Primes.generate(0)
    expect(primes.length).to eq(0)
  end

  specify "Single" do
    primes = Primes.generate(2)
    expect(primes.length).to eq(1)
    expect(primes.include?(2)).to be(true)
  end

  specify "Prime" do
    cent_list = Primes.generate(100)
    expect(cent_list.length).to eq(25)
    expect(cent_list[24]).to eq(97)
  end

  specify "Basic" do
    primes = Primes.generate(KNOWN_PRIMES[KNOWN_PRIMES.length - 1])
    expect(primes.length).to eq(KNOWN_PRIMES.length)

    primes.each_with_index do |prime, i|
      expect(prime).to eq(KNOWN_PRIMES[i])
    end
  end

  specify "Lots" do
    bound = 10101
    primes = Primes.generate(bound)

    primes.each { |prime| expect(Prime.prime?(prime)).to be(true) }

    primes.each do |prime|
      if is_prime?(prime)
        expect(primes.include?(prime)).to be(true)
      else
        expect(primes.include?(prime)).to be(false)
      end
    end
  end

end

private

# utility methods for tests
def is_prime?(n)
  return false if n < 2

  result = true
  x = Math.sqrt(n)
  i = 2
  while (result && i <= x) do
    result = (0 != n % i)
    i += 1
  end
  return result
end
