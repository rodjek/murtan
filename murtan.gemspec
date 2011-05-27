Gem::Specification.new do |s|
  s.name = 'murtan'
  s.version = '0.0.1'
  s.homepage = 'https://github.com/rodjek/murtan/'
  s.summary = 'An elegant iptables ruleset generator for a more civilised age'
  s.description = <<-EOS
    An elegant iptables ruleset generator for a more civilised age.
  EOS

  s.files = [
    'lib/murtan.rb',
    'Rakefile',
    'README.md',
    'murtan.gemspec'
  ]

  s.add_dependency 'parslet'
  s.add_development_dependency 'rspec'

  s.authors = ['Tim Sharpe']
  s.email = 'tim@sharpe.id.au'
end
