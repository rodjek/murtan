class Lexer
  KEYWORDS = ["return", "drop", "on", "log", "from", "port", "to", "proto", "any", "all", "keep", "no", "state"]
  ACTIONS = ["pass", "block"]
  DIRECTIONS = ["in", "out"]
  ADDRESS_FAMILYS = ["ipv4", "ipv6"]
  PROTOCOLS = ["tcp", "udp", "icmp"]
  
  def tokenize(code)
    # Cleanup code by removing extra line breaks
    code.chomp!
    
    # Current character position we're parsing
    i = 0
    
    # Collection of all parsed tokens in the form [:TOKEN_TYPE, value]
    tokens = []
    
    # This is how to implement a very simple scanner
    # Scan one character at a time until you find something to parse
    while i < code.size
      chunk = code[i..-1]
      
      # Matching standard tokens
      
      if variable = chunk[/\A(\S+\s*)=/, 1]
        tokens << [:VARIABLE_NAME, variable.strip]
        tokens << ["=", "="]
        i += variable.size + 1
      # Matching if, print, method names, etc
      elsif identifier = chunk[/\A([a-z]\w*)/, 1]
        # Keywords are special identifiers tagged with their own name, 'if'
        # will result in an [:IF, "if"] token
        if KEYWORDS.include? identifier
          tokens << [identifier.upcase.to_sym, identifier]
        # Non-keyword identifiers include method and variable names
        elsif ACTIONS.include? identifier
          tokens << [:ACTION, identifier]
        elsif DIRECTIONS.include? identifier
          tokens << [:DIRECTION, identifier]
        elsif ADDRESS_FAMILYS.include? identifier
          tokens << [:AF, identifier]
        elsif PROTOCOLS.include? identifier
          tokens << [:PROTOCOL, identifier]
        else
          tokens << [:IDENTIFIER, identifier]
        end
        # Skip what we just parsed
        i += identifier.size

      elsif ip = chunk[/\A(([0-9]+\.){3}[0-9]+(\/[0-9]+)?)/, 1]
        tokens << [:IPADDRESS, ip]
        i += ip.size
        
      elsif number = chunk[/\A([0-9]+)/, 1]
        tokens << [:NUMBER, number.to_i]
        i += number.size
        
      elsif string = chunk[/\A"(.*?)"/, 1]
        tokens << [:STRING, string]
        i += string.size + 2
    
      # Ignore whitespace
      elsif chunk.match(/\A /)
        i += 1

      # Ignore commas
      elsif chunk.match(/\A,/)
        i += 1

      # Ignore newlines when preceeded by a \
      elsif chunk.match(/\A\\\n/)
        i += 2

      elsif chunk.match(/\A\n/)
        tokens << [:NEWLINE, "\n"]
        i += 1
    
      # We treat all other single characters as a token
      else
        value = chunk[0, 1]
        tokens << [value, value]
        i += 1
      end
    end
    
    tokens
  end
end
