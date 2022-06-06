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
        date.strftime('%Y-%m-%d')
    end
end