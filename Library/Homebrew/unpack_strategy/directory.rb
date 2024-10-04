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
      path_children = path.children
      return if path_children.empty?

      existing = unpack_dir.children

      # We run a few cp attempts in the following order:
      #
      # 1. Start with `-al` to create hardlinks rather than copying files if the source and
      #    target are on the same filesystem. On macOS, this is the only cp option that can
      #    preserve hardlinks but it is only available since macOS 12.3 (file_cmds-353.100.22).
      # 2. Try `-a` as GNU `cp -a` preserves hardlinks. macOS `cp -a` is identical to `cp -pR`.
      # 3. Fall back on `-pR` to handle the case where GNU `cp -a` failed. This may happen if
      #    installing into a filesystem that doesn't support hardlinks like an exFAT USB drive.
      cp_arg_attempts = ["-a", "-pR"]
      cp_arg_attempts.unshift("-al") if path.stat.dev == unpack_dir.stat.dev

      cp_arg_attempts.each do |arg|
        args = [arg, *path_children, unpack_dir]
        must_succeed = print_stderr = (arg == cp_arg_attempts.last)
        result = system_command("cp", args:, verbose:, must_succeed:, print_stderr:)
        break if result.success?

        FileUtils.rm_r(unpack_dir.children - existing)
      end
    end
  end
end
