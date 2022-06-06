class Cult
    attr_accessor :name, :location, :slogan, :minimum_age
    attr_reader :founding_year

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, location, slogan, founding_year, minimum_age=0)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year
        @minimum_age = minimum_age

        self.class.all << self
    end

    def recruit_follower(follower)
        follower.age >= @minimum_age ? BloodOath.new(follower, self) : puts("Sorry youngster, you need to be #{@minimum_age} years old to join.")
    end

    def followers
        BloodOath.all.select {|oath| oath.cult == self }.map(&:follower)
    end

    def cult_population
        followers.count
    end

    def self.find_by_name(name)
        all.find {|cult| cult.name == name }
    end

    def self.find_by_location(location)
        all.select {|cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
        all.select {|cult| cult.founding_year == year }
    end

    def average_age
        followers.map(&:age).sum / cult_population.to_f
    end

    def my_followers_mottos
        puts followers.map(&:life_motto)
    end

    def self.least_popular
        all.min {|cult1, cult2| cult1.cult_population <=> cult2.cult_population}
    end

    def self.most_common_location
        # array of locations (including duplicates)
        a = all.map(&:location)

        h = Hash.new

        # accumulate the locations into a hash,
        # where the keys are the locations, and the values
        # are the counts
        a.each {|location| !h[location].nil? ? h[location] += 1 : h[location] = 1 }

        # max by the values, and return the key
        h.max_by{|location, count| count }[0]
    end
end