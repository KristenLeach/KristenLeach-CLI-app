
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bookworm_buddy/version"

Gem::Specification.new do |spec|
  spec.name          = "bookworm_buddy"
  spec.version       = BookwormBuddy::VERSION
  spec.authors       = ["Kristen Leach"]
  spec.email         = ["kristenleach24@gmail.com"]

  spec.summary       = "Bookworm Buddy scrapes Barnes & Noble's book categories for bestselling books and their descriptions"
  spec.description   = "Bookworm Buddy is a gem that allows you to choose from 50 Barnes & Noble book categories to see the top 20 bestselling books in that category. You can then choose a book from the list to see a short description. Happy reading!"
  spec.homepage      = "https://github.com/KristenLeach/KristenLeach-CLI-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = " Set to 'http://rubygems.org'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  #spec.bindir        = "exe"
  spec.executables   << "bookworm_buddy"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency "nokogiri"
  
end

