# typed: true # rubocop:todo Sorbet/StrictSigil
# frozen_string_literal: true

require "software_spec"

class HeadSoftwareSpec < SoftwareSpec
  def initialize(flags: [])
    super
    @resource.version(Version.new("HEAD"))
  end

  def verify_download_integrity(_filename)
    # no-op
  end
end
