#
# Cookbook:: prebuilt_postgresql
# Library:: version
#
# Copyright:: 2018, Hiroshi OTANI

module PrebuiltPostgreSQL
  class Version

    attr_reader :major
    attr_reader :minor
    attr_reader :patch

    def initialize(version)
      @major = 0; @minor = 0; @patch = 0;
      case version.count('.')
      when 1
        @major, @minor = version.split('.').map {|s| s.to_i}
      when 2
        @major, @minor, @patch = version.split('.').map {|s| s.to_i}
      end
    end

    def short
      return [@major, @minor].join('.')
    end

    def long
      return [@major, @minor, @patch].join('.')
    end

    def to_i
      return 10 * @major + @minor
    end
  end
end
