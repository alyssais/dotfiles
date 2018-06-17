#!/usr/bin/env ruby

require "pathname"
require "shellwords"

maildir = Pathname.new(Dir.home).join("mail")

maildir.find do |file|
  Find.prune unless file.directory?
  Find.prune if file.basename.fnmatch?("{new,cur,tmp}", File::FNM_EXTGLOB)

  next if file == maildir

  print "#{Shellwords.shellescape(file)} "
end

puts
