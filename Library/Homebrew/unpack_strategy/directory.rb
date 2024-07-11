# typed: strict
# frozen_string_literal: true

module UnpackStrategy
  # Strategy for unpacking directories.
  class Directory
    include UnpackStrategy

    sig { override.returns(T::Array[String]) }
    def self.extensions
      []
    end

    sig { override.params(path: Pathname).returns(T::Boolean) }
    def self.can_extract?(path)
      path.directory?
    end

    private

    sig { override.params(unpack_dir: Pathname, basename: Pathname, verbose: T::Boolean).void }
    def extract_to_dir(unpack_dir, basename:, verbose:)
      path.children.each do |child|
        system_command! "cp",
                        args:    ["-pR", (child.directory? && !child.symlink?) ? "#{child}/." : child,
                                  unpack_dir/child.basename],
                        verbose:
      end
    end
  end
end
