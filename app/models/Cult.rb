class Cult
    attr_accessor :name, :location, :slogan
    attr_reader :founding_year

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, location, slogan, founding_year)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year

        self.class.all << self
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def members
        BloodOath.all.select {|oath| oath.cult == self }
    end

    def cult_population
        cult_members.count
    end

    def self.find_by_name(name)
        all.find {|cult| cult.name == name }
    end

    def self.find_by_location(location)
        all.select {|cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
        all.select {|cult| cult.year == year }
    end
end