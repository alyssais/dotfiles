#!/usr/bin/env ruby
# shebang used to trigger syntax highlighting in some editors

require 'shellwords'

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
	_pry_.run_command Pry.history.to_a.last
end

def require_external_gem(name)

	if defined? Bundler

		dir = Bundler.with_clean_env do
			`echo #{name.shellescape} | ruby -e \
				'puts Gem::Specification.find_by_name(STDIN.read.chomp).gem_dir' 2> /dev/null`.chomp
		end

		$: << File.join(dir, "lib")

	end

	require name
end

require_external_gem "hirb"

# Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
Hirb::View.instance_eval do
	def enable_output_method
		@output_method = true
		@old_print = Pry.config.print
		Pry.config.print = proc do |*args|
			Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
		end
	end

	def disable_output_method
		Pry.config.print = @old_print
		@output_method = nil
	end
end
