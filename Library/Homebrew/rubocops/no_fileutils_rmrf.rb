# typed: true
# frozen_string_literal: true

module RuboCop
  module Cop
    module Homebrew
      # This cop checks for the use of `FileUtils.rm_f`, `FileUtils.rm_rf`, or `{FileUtils,Pathname}.rmtree`
      # and recommends the safer versions.
      class NoFileutilsRmrf < Base
        extend AutoCorrector

        MSG = "Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`."

        def_node_matcher :self_rm_r_f_tree?, <<~PATTERN
          (send (self) {:rm_rf :rm_f :rmtree} ...)
        PATTERN

        def_node_matcher :plain_rm_r_f_tree?, <<~PATTERN
          (send nil? {:rm_rf :rm_f :rmtree} ...)
        PATTERN

        def on_send(node)
          return if neither_rm_rf_nor_rmtree?(node)

          add_offense(node) do |corrector|
            new_method = if node.method?(:rm_rf) || node.method?(:rmtree)
              "rm_r"
            else
              "rm"
            end

            corrector.replace(node.loc.expression, "#{new_method}(#{node.arguments.first.source})")
          end
        end

        def neither_rm_rf_nor_rmtree?(node)
          !self_rm_r_f_tree?(node) && !plain_rm_r_f_tree?(node)
        end
      end
    end
  end
end
