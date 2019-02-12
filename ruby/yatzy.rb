class Yatzy
  def self.chance(dice)
    dice.sum
  end

  def self.yatzy(dice)
    (1..6).each { |number| return 50 if dice.all?(number) }
    0
  end

  def self.ones(dice)
    dice.count(1)
  end

  def self.twos(dice)
    dice.count(2) * 2
  end

  def self.threes(dice)
    dice.count(3) * 3
  end

  def self.fours(dice)
    dice.count(4) * 4
  end

  def self.fives(dice)
    dice.count(5) * 5
  end

  def self.sixes(dice)
    dice.count(6) * 6
  end

  def self.one_pair(dice)
    6.downto(1).each { |number| return number * 2 if dice.count(number) >= 2 }
    0
  end

  def self.two_pair(dice)
    6.downto(1).inject(0) { |score, number| dice.count(number) >= 2 ? score + number * 2 : score }
  end

  def self.three_of_a_kind(dice)
    6.downto(1).each { |number| return number * 3 if dice.count(number) >= 3 }
    0
  end

  def self.four_of_a_kind(dice)
    6.downto(1).each { |number| return number * 4 if dice.count(number) >= 4 }
    0
  end

  def self.small_straight(dice)
    dice.sort == (1..5).to_a ? 15 : 0
  end

  def self.large_straight(dice)
    dice.sort == (2..6).to_a ? 20 : 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end
