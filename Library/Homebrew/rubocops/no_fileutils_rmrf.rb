# typed: true
# frozen_string_literal: true

module RuboCop
  module Cop
    module Homebrew
      # This cop checks for the use of `FileUtils.rm_f` or `FileUtils.rm_rf` and recommends the non-`f` versions.
      class NoFileutilsRmrf < Base
        extend AutoCorrector

        MSG = "Use `FileUtils.rm` or `FileUtils.rm_f` instead of `FileUtils.rm_rf` or `FileUtils.rm_f`."

        def_node_matcher :fileutils_rm_r_f?, <<~PATTERN
          (send (const {nil? cbase} :FileUtils) {:rm_rf :rm_f} ...)
        PATTERN

        def on_send(node)
          return unless fileutils_rm_r_f?(node)

          add_offense(node) do |corrector|
            new_method = node.method?(:rm_rf) ? "rm_r" : "rm"
            corrector.replace(node.loc.expression, "FileUtils.#{new_method}(#{node.arguments.first.source})")
          end
        end
      end
    end
  end
end
