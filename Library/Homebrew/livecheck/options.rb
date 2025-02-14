# typed: strict
# frozen_string_literal: true

module Homebrew
  module Livecheck
    # Options to modify livecheck's behavior. These primarily come from
    # `livecheck` blocks but they can also be set by livecheck at runtime.
    #
    # Option values use a `nil` default to indicate that the value has not been
    # set.
    class Options < T::Struct
      # Whether to use brewed curl.
      prop :homebrew_curl, T.nilable(T::Boolean)

      # Form data to use when making a `POST` request.
      prop :post_form, T.nilable(T::Hash[Symbol, String])

      # JSON data to use when making a `POST` request.
      prop :post_json, T.nilable(T::Hash[Symbol, String])

      # Returns a `Hash` of options that are provided as arguments to `url`.
      sig { returns(T::Hash[Symbol, T.untyped]) }
      def url_options
        {
          homebrew_curl:,
          post_form:,
          post_json:,
        }
      end

      # Returns a `Hash` of all instance variables, using `String` keys.
      sig { returns(T::Hash[String, T.untyped]) }
      def to_hash = serialize

      # Returns a `Hash` of all instance variables, using `Symbol` keys.
      sig { returns(T::Hash[Symbol, T.untyped]) }
      def to_h = serialize.transform_keys(&:to_sym)

      # Returns a new object formed by merging `other` values with a copy of
      # `self`.
      #
      # `nil` values are removed from `other` before merging if it is an
      # `Options` object, as these are unitiailized values. This ensures that
      # existing values in `self` aren't unexpectedly overwritten with defaults.
      sig { params(other: T.any(Options, T::Hash[Symbol, T.untyped])).returns(Options) }
      def merge(other)
        return dup if other.empty?

        this_hash = to_h
        other_hash = other.is_a?(Options) ? other.to_h : other
        return dup if this_hash == other_hash

        new_options = this_hash.merge(other_hash)
        Options.new(**new_options)
      end

      sig { params(other: T.untyped).returns(T::Boolean) }
      def ==(other)
        instance_of?(other.class) &&
          @homebrew_curl == other.homebrew_curl &&
          @post_form == other.post_form &&
          @post_json == other.post_json
      end
      alias eql? ==

      # Whether the object has only default values.
      sig { returns(T::Boolean) }
      def empty? = serialize.empty?

      # Whether the object has any non-default values.
      sig { returns(T::Boolean) }
      def present? = !empty?
    end
  end
end
