class BloodOath
    attr_reader :follower, :cult

    @@all = []

    def self.all
        @@all
    end

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @date = Time.now

        self.class.all << self
    end

    def initiation_date
        @date.strftime('%Y-%m-%d')
    end

    def self.first_oath
        all.min{|o1, o2| o1.initiation_date <=> o2.initiation_date }.follower
    end
end