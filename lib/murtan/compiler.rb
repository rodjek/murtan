module Murtan
  class Compiler
    def parser
      Murtan::Parser.new
    end

    def transformer
      Murtan::Transformer.new
    end

    def compile(source)
      ast = transformer.apply(parser.parse(source))
      ast.compile
    end
  end
end
