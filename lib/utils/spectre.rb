module Despecable
  module Spectre
    def despec(*args, strict: false, &blk)
      ::Despecable::Spectrogram.new.instance_exec(&blk)
      raise ::Despecable::SpectacularError, "despec stop"
    end

    def despec!(*args, &blk)
      ::Despecable::Spectrogram.new.instance_exec(&blk)
      raise ::Despecable::SpectacularError, "despec stop"
    end
  end
end
