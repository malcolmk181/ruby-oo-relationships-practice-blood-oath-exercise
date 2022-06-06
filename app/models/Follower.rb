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

    def oaths
        BloodOath.all.select {|oath| oath.follower == self }
    end

    def cults
        oaths.map(&:cult)
    end

    def join_cult(cult)
        cult.recruit_follower(self)
    end

    def self.of_a_certain_age(age)
        all.select {|follower| follower.age >= age }
    end

    def my_cults_slogans
        puts cults.map(&:slogan)
    end

    def self.most_active
        all.max {|f1, f2| f1.cults.count <=> f2.cults.count }
    end

    def self.top_ten
        all.max(10) {|f1, f2| f1.cults.count <=> f2.cults.count }
    end

    def fellow_cult_members
        lst = []
        cults.each{|cult| lst.push(*cult.followers) }
        lst.delete(self)
        lst.uniq
    end
    
end