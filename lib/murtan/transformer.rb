require 'parslet'

module Murtan
  class Transformer < Parslet::Transform
    rule(:str => simple(:x)) { String.new(x) }
  end
end
