# Copyright (c) 2022 Operator
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require_relative 'config/env'
require_relative 'config/config'
require_relative 'lib/cloudflare/dns'

@domains.each do |domain|
  puts "Adding #{domain} to Cloudflare..."
  dns = CloudflareGodaddy::Cloudflare::DNS.new(domain, @CF_API_EMAIL, @CF_API_KEY, @ACCOUNT_ID)
  dns.add_domain
end
