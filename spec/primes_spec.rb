require 'prime' # Ruby prime handling
require 'primes' # Our Sieve class

describe Primes do

  KNOWN_PRIMES = [2,3,5,7,11,13,17,19,23,29]

  specify "Test 1: Zero" do
    primes = Primes.generate_array(0)
    expect(primes.length).to eq(0)
  end

  specify "Test 2: List Zero" do
    primes = Primes.generate(0)
    expect(primes.length).to eq(0)
  end

  specify "Test 3: Single" do
    primes = Primes.generate_array(2)
    expect(primes.length).to eq(1)
    expect(primes.first).to eq(2)
  end

  specify "Test 4: List Single" do
    primes = Primes.generate(2)
    expect(primes.length).to eq(1)
    expect(primes.include?(2)).to be(true)
  end

  specify "Test 5: Prime" do
    cent_array = Primes.generate_array(100)
    expect(cent_array.length).to eq(25)
    expect(cent_array[24]).to eq(97)
  end

  specify "Test 6: List Prime" do
    cent_list = Primes.generate(100)
    expect(cent_list.length).to eq(25)
    expect(cent_list[24]).to eq(97)
  end

  specify "Test 7: Basic" do
    primes = Primes.generate_array(KNOWN_PRIMES[KNOWN_PRIMES.length - 1])
    expect(primes.length).to eq(KNOWN_PRIMES.length)

    primes.each_with_index do |prime, i|
      expect(prime).to eq(KNOWN_PRIMES[i])
    end
  end

  specify "Test 8: List Basic" do
    primes = Primes.generate(KNOWN_PRIMES[KNOWN_PRIMES.length - 1])
    expect(primes.length).to eq(KNOWN_PRIMES.length)

    primes.each_with_index do |prime, i|
      expect(prime).to eq(KNOWN_PRIMES[i])
    end
  end

  specify "Test 9: Lots" do
    bound = 10101
    primes = Primes.generate_array(bound)

    primes.each { |prime| expect(Prime.prime?(prime)).to be(true) }

    primes.each do |prime|
      if is_prime?(prime)
        expect(contains?(prime, primes)).to be(true)
      else
        expect(contains?(prime, primes)).to be(false)
      end
    end
  end

  specify "Test 10: List Lots" do
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

def contains?(value, primes)
  return !!primes.index(value)
end

