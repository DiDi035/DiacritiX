require 'colorize'

require_relative 'diacriti_x/accentifier'

module DiacritiX
  class << self
    def call(input)
    end
  end

  module Cli
    class << self
      def call(input)
        input = ARGV[0]
        response = Accentifier.call(input)

        if response.success?
          index = response.index
          puts input[0..index-1]+input[index].green+input[index+1..input.length]
        else
          puts response.message.red
        end
      end
    end
  end
end


