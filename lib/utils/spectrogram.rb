module Despecable
  class Spectrogram
    def initialize
      @spec = Speculator.new
    end

    def integer(name, options = {})
      _spec(name, :integer, options)
    end

    def string(name, options = {})
      _spec(name, :string, options)
    end

    def boolean(name, options = {})
      _spec(name, :boolean, options)
    end

    def date(name, options = {})
      _spec(name, :date, options)
    end

    def datetime(name, options = {})
      _spec(name, :datetime, options)
    end

    private

    def _spec(name, type, options = {})
      @spec.speculate(name, type, options)
    end
  end
end
