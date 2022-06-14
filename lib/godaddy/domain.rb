# Copyright (c) 2022 Operator
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require 'uri'
require 'time'
require 'json'
require 'net/http'

# module CloudflareGodaddy
module CloudflareGodaddy
  # module Cloudflare
  module Godaddy
    # class DNS
    class Domain
      def initialize(domain, gd_key, gd_secret, dns_ns)
        @domain = domain
        @gd_key = gd_key
        @gd_secret = gd_secret
        @dns_ns = dns_ns
      end

      def set_ns
        uri = URI("https://api.godaddy.com/api/v1/domains/#{@domain}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Patch.new(uri.request_uri)
        # request = Net::HTTP::Get.new(uri.request_uri)
        request.add_field('Authorization', "sso-key #{@gd_key}:#{@gd_secret}")
        request.add_field('Content-Type', 'application/json')
        request.add_field('Accept', 'application/json')
        request.body = {
          locked: true,
          nameServers: [
            @dns_ns[:ns1],
            @dns_ns[:ns2]
          ],
          renewAuto: true,
          # subaccountId: 'string',
          exposeWhois: true,
          consent: {
            agreedAt: Time.now.utc.iso8601.to_s,
            agreedBy: 'ops',
            agreementKeys: [
              'EXPOSE_WHOIS'
            ]
          }
        }.to_json
        http.request(request)
      end
    end
  end
end
