# Copyright (c) 2022 Operator
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require_relative 'config/env'
require_relative 'config/config'
require_relative 'lib/godaddy/domain'

@domains.each do |domain|
  puts "Update #{domain} nameserver to Cloudflare"
  dns = CloudflareGodaddy::Godaddy::Domain.new(domain, @GD_KEY, @GD_SECRET, @dns_ns)
  dns.set_ns
end
