module Despecable
  class Speculator
    def speculate(name, type, options)
      puts "Parameter: #{name}" + requiredness(options)
      puts "Type: #{type}" + arraybility(options)
      puts "Allowed values: #{allowed_values(type, options)}" if options[:in]
      puts "-----"
    end

    def requiredness(options)
      options[:reuqire] ? " (required)" : ""
    end

    def arraybility(options)
      options[:arrayable] ?  " (multiple)" : ""
    end

    def allowed_values(type, options)
      case options[:in]
      when nil then nil
      when Array then options[:in].map{|x| present(x, type)}.join(", ")
      when Range then
        first = present(options[:in].first, type)
        last = present(options[:in].last, type)
        first == last ? first.to_s : "#{first} - #{last}"
      else raise DespecableError, "Wrong type for :in"
      end
    end

    def present(value, type)
      case type
      when :integer then value.to_i
      else value
      end
    end
  end
end
