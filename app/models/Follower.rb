class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        self.class.all << self
    end

    def cults
        BloodOath.all.select {|oath| oath.follower == self }
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        all.select {|follower| follower.age >= age }
    end
end