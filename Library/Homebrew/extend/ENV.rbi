# typed: strict

module EnvActivation
  include Superenv
end

# @!visibility private
class Sorbet
  module Private
    module Static
      class ENVClass
        include EnvActivation
      end
    end
  end
end
