# Copyright (c) 2022 Operator
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require 'uri'
require 'json'
require 'net/http'

# module CloudflareGodaddy
module CloudflareGodaddy
  # module Cloudflare
  module Cloudflare
    # class DNS
    class DNS
      def initialize(domain, cf_api_email, cf_api_key, account_id)
        @domain = domain
        @cf_api_email = cf_api_email
        @cf_api_key = cf_api_key
        @account_id = account_id
      end

      def add_domain
        uri = URI('https://api.cloudflare.com/client/v4/zones')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(uri.request_uri)
        request.add_field('X-Auth-Email', @cf_api_email)
        request.add_field('X-Auth-Key', @cf_api_key)
        request.add_field('Content-Type', 'application/json')
        request.body = { account: { id: @account_id }, name: @domain, jump_start: true }.to_json
        http.request(request).body
      end
    end
  end
end
