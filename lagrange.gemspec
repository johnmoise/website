# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "modified_lagrange"
  spec.version       = "1.0.0"
  spec.authors       = ["John Moïse"]

  spec.summary       = "A minimalist Jekyll theme based on the Lagrange theme by Paul Le"
  spec.license       = "MIT"
  
  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.6"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.3"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
end
