# Copyright (c) 2022 Operator
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

@domains = %w[abcdef.org]
# abcdef.app
#   abcdef.cc
#   abcdef.club
#   abcdef.co
#   abcdef.finance
#   abcdef.io
#   abcdef.live
#   abcdef.me
#   abcdef.online
#   abcdef.org
#   abcdef.store
#   abcdef.vip
# ]

# cloudflare ns list
@dns_c1 = { ns1: 'abcdef.ns.cloudflare.com', ns2: 'adcd.ns.cloudflare.com' }
@dns_c2 = { ns1: 'defghl.ns.cloudflare.com', ns2: 'defg.ns.cloudflare.com' }
@dns_ns = @dns_c1
