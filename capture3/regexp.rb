module Pattern
    def bracket(outer_pattern)
        if precedence < outer_pattern
            '(' + to_s + ')'
        else
            to_s
        end
    end

    def inspect
        "/#{self}/"
    end
end

class Empty
    include Pattern

    def to_s
        ''
    end

    def precedence
        3
    end
end

class Literal < Struct.new(:character)
    include Pattern

    def to_s
        character
    end

    def precedence
        3
    end
end

class Concatenate < Struct.new(:first, :second)
    include Pattern

    def to_s
        [first, second].map{|pattern| pattern.bracket(precedence)}.join
    end

    def precedence
        1
    end
end

class Choose < Struct.new(:fisrt, :second)
    include Pattern

    def to_s
        [first, second].map{|pattern| pattern.bracket(precedence)}.join('|')
    end

    def precedence
        0
    end
end

class Repeat < Struct.new(:pattern)
    include Pattern

    def to_s
        pattern.bracket(precedence) + '*'
    end

    def precedence
        2
    end
end
