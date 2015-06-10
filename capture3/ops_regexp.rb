require './regexp.rb'

puts('p83')
pattern = Repeat.new(
    Choose.new(
        Concatenate.new(Literal.new('a'), Literal.new('b')),
        Literal.new('a')
    )
)
p pattern

puts('p85')
nfa_design = Empty.new.to_nfa_design
p nfa_design
p nfa_design.accepts?('')
p nfa_design.accepts?('a')
nfa_design = Literal.new('a').to_nfa_design
p nfa_design
p nfa_design.accepts?('')
p nfa_design.accepts?('a')
p nfa_design.accepts?('b')

puts('85')
p Empty.new.matches?('a')
p Literal.new('a').matches?('a')

puts('p87')
pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))
p pattern
p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('abc')

puts('p87')
pattern = Concatenate.new(
    Literal.new('a'),
    Concatenate.new(Literal.new('b'), Literal.new('c'))
)
p pattern
p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('abc')

puts('p89')
pattern = Choose.new(Literal.new('a'), Literal.new('b'))
p pattern
p pattern.matches?('a')
p pattern.matches?('b')
p pattern.matches?('c')
