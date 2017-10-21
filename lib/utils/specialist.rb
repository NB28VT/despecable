module Despecable
  class Specialist
    attr_reader :klass, :spectre

    def initialize(klass)
      @klass = klass
      @spectre = Class.new(klass)

      # Override all methods until Object methods for document behavior
      ancient_traditions.each do |name|
        hallmark_tradition(name)
      end

      # Now provide specific definitions for despec methods to generate docs
      @spectre.prepend(Despecable::Spectre)
    end

    # Override an existing method to evaluate until an error is hit, then stop
    def hallmark_tradition(name)
      @spectre.class_exec(name) do |name|
        define_method(name) do |*args|
          begin
            $stderr.puts "Starting #{name}"
            super(*args)
          rescue
            return if $!.is_a?(SpectacularError)
            $stderr.puts "#{name}: stop!"
            $stderr.puts " > #{$!.message}"
            $stderr.puts " > #{$!.backtrace.first}"
          end
        end
      end
    end

    # Take backtrace up to controller method
    def lineage(action, exception)
      #TODO
      exception.backtrace.take_while()
    end

    def document(action)
      @spectre.new.public_send(action)
    end

    def ancients
      @klass.ancestors.take_while{|ancestor| ancestor != ::Object}
    end

    def ancient_traditions
      ancients.flat_map{|ancestor| ancestor.instance_methods(false)}
    end
  end
end
