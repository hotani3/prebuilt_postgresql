#
# Cookbook:: prebuilt_postgresql
# Library:: version
#
# Copyright:: 2018, Hiroshi OTANI

module PrebuiltPostgreSQL
  # Class to manipulate the platform or PostgreSQL version
  class Version
    attr_reader :major
    attr_reader :minor
    attr_reader :patch

    def initialize(version)
      @major = @minor = @patch = 0
      case version.count('.')
      when 1
        @major, @minor = version.split('.').map(&:to_i)
      when 2
        @major, @minor, @patch = version.split('.').map(&:to_i)
      end
    end

    def short
      [@major, @minor].join('.')
    end

    def long
      [@major, @minor, @patch].join('.')
    end

    def to_i
      10 * @major + @minor
    end
  end
end
