require "bundler"
Bundler.setup

require "dry-validation"
require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path(".", __dir__))
loader.setup