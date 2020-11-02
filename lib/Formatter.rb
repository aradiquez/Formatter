require "Formatter/version"

module Formatter
  class << self
    def cast(value, format = '')
      case format
      when '$'
        monetize(value.to_f)
      when '%'
        percentagize(value.to_f)
      when '#'
        numeralize(value.to_f)
      else
        "#{value}"
      end
    end

    private

    def monetize(value)
      "$#{round(value)}"
    end

    def percentagize(value)
      percentage = (value > 1 ? value : value*100)
      "#{round(percentage)}%"
    end

    def numeralize(value)
      round(value)
    end

    def round(number)
      (number).round(2)
    end
  end
end
