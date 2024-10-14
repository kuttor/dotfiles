# typed: strict
# frozen_string_literal: true

module Homebrew
  module Tapioca
    module Utils
      # @param class_methods [Boolean] whether to get class methods or instance methods
      # @return the `module` methods that are defined in the given file
      sig {
        params(mod: Module, file_name: String,
               class_methods: T::Boolean).returns(T::Array[T.any(Method, UnboundMethod)])
      }
      def self.methods_from_file(mod, file_name, class_methods: false)
        methods = if class_methods
          mod.methods(false).map { mod.method(_1) }
        else
          mod.instance_methods(false).map { mod.instance_method(_1) }
        end
        methods.select { _1.source_location&.first&.end_with?(file_name) }
      end
    end
  end
end
