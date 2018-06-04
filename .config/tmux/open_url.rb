#!/usr/bin/env ruby
require "cgi"
exec "open", CGI.unescape(ARGV[0]), *ARGV[1..-1]
