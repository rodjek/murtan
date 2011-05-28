Gem::Specification.new do |s|
  s.name = 'murtan'
  s.version = '0.0.1'
  s.homepage = 'https://github.com/rodjek/murtan/'
  s.summary = 'An elegant iptables ruleset generator for a more civilised age'
  s.description = <<-EOS
    An elegant iptables ruleset generator for a more civilised age.
  EOS

  s.files = [
    'murtan.gemspec',
    'Rakefile',
    'README.md',
    'lib/murtan.rb',
    'lib/murtan/ast.rb',
    'lib/murtan/compiler.rb',
    'lib/murtan/parser.rb',
    'lib/murtan/transformer.rb',
    'spec/spec_helper.rb',
    'spec/murtan/parser_spec.rb',
    'spec/murtan/transformer_spec.rb'
  ]

  s.add_dependency 'parslet'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'flexmock'

  s.authors = ['Tim Sharpe']
  s.email = 'tim@sharpe.id.au'
end
