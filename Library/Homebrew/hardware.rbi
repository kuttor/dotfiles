# typed: strict

module Hardware
  class CPU
    class << self
      include OS::Mac::Hardware::CPU
    end
  end
end
