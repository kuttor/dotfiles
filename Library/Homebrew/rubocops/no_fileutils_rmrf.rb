# typed: true
# frozen_string_literal: true

module RuboCop
  module Cop
    module Homebrew
      # This cop checks for the use of `FileUtils.rm_f`, `FileUtils.rm_rf`, or `{FileUtils,instance}.rmtree`
      # and recommends the safer versions.
      class NoFileutilsRmrf < Base
        extend AutoCorrector

        MSG = "Use `rm` or `rm_r` instead of `rm_rf`, `rm_f`, or `rmtree`."

        def_node_matcher :fileutils_rm_r_f_tree?, <<~PATTERN
          (send (const {nil? cbase} :FileUtils) {:rm_rf :rm_f :rmtree} ...)
        PATTERN

        def_node_matcher :instance_rmtree?, <<~PATTERN
          (send (lvar ...) :rmtree ...)
        PATTERN

        def_node_matcher :self_rm_r_f_tree?, <<~PATTERN
          (send (self) {:rm_rf :rm_f :rmtree} ...)
        PATTERN

        def_node_matcher :plain_rm_r_f_tree?, <<~PATTERN
          (send nil? {:rm_rf :rm_f :rmtree} ...)
        PATTERN

        def on_send(node)
          return if neither_rm_rf_nor_rmtree?(node)

          add_offense(node) do |corrector|
            class_name = "FileUtils." if fileutils_rm_r_f_tree?(node) || instance_rmtree?(node)
            new_method = if node.method?(:rm_rf) || node.method?(:rmtree)
              "rm_r"
            else
              "rm"
            end

            args = if instance_rmtree?(node)
              node.receiver.source
            else
              node.arguments.first.source
            end

            corrector.replace(node.loc.expression, "#{class_name}#{new_method}(#{args})")
          end
        end

        def neither_rm_rf_nor_rmtree?(node)
          !self_rm_r_f_tree?(node) && !plain_rm_r_f_tree?(node) &&
            !fileutils_rm_r_f_tree?(node) && !instance_rmtree?(node)
        end
      end
    end
  end
end
