# typed: true
# frozen_string_literal: true

module RuboCop
  module Cop
    module Homebrew
      # This cop checks for the use of `FileUtils.rm_rf` and recommends `FileUtils.rm_r`.
      class NoFileutilsRmrf < Base
        extend AutoCorrector

        MSG = "Use `FileUtils.rm_r` instead of `FileUtils.rm_rf`."

        def_node_matcher :fileutils_rm_rf?, <<~PATTERN
          (send (const {nil? cbase} :FileUtils) :rm_rf ...)
        PATTERN

        def on_send(node)
          return unless fileutils_rm_rf?(node)

          add_offense(node) do |corrector|
            corrector.replace(node.loc.expression, "FileUtils.rm_r(#{node.arguments.first.source})")
          end
        end
      end
    end
  end
end
