# typed: strict

# This file contains temporary definitions for fixes that have
# been submitted upstream to https://github.com/sorbet/sorbet.

# Missing constants we use in `linkage_checker.rb`
# https://github.com/sorbet/sorbet/pull/8215
module Fiddle
  # [`TYPE_BOOL`](https://github.com/ruby/fiddle/blob/v1.1.2/ext/fiddle/fiddle.h#L129)
  #
  # C type - bool
  TYPE_BOOL = T.let(T.unsafe(nil).freeze, Integer)

  # [`TYPE_CONST_STRING`](https://github.com/ruby/fiddle/blob/v1.1.2/ext/fiddle/fiddle.h#L128)
  #
  # C type - char\*
  TYPE_CONST_STRING = T.let(T.unsafe(nil).freeze, Integer)
end
