class Jeff

    def initialize
        Jeff.priva 
        pub
        priv
    end

    def pub
        p "in pub."
    end

    private
    def priv 
        p "in priv."
    end
end

class << Jeff
    # private 
    def priva
        p "in priv (eiganclass)"
    end
end

class Jeffrey < Jeff
    def initialize
        super
        p "in Jeffrey"
        pub
        priv
        p "out Jeffrey"
    end
end

# Jeffrey.priv 

x = Jeffrey.new
p "-" * 40
x.pub
# x.priv

p Jeffrey.ancestors