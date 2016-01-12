
require_relative "./lib/build_cleaner"


set :site_url, "http://www.youththerapyservice.co.uk"
set :site_description, "Youth Therapy Service Sheffield"

# For custom domains on github pages
page "CNAME", layout: false

page "/sitemap.xml", layout: false

page "/*", layout: 'page'
page "/articles/*", :layout => "article"
page "/articles/", layout: "page"
page "/", layout: 'layout'

set :url_root, site_url

activate :search_engine_sitemap

activate :breadcrumbs

activate :meta_tags

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-71483613-1' # Replace with your property ID.
  # Tracking in development environment (default = true)
  ga.development = false
end

###
# Helpers
###
require "lib/custom_helpers"
helpers CustomHelpers

require 'bootstrap-sass'

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

activate :directory_indexes

set :relative_links, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :blog do |blog|
  # blog.prefix = "articles"

  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tag/{tag}.html"

  blog.permalink = "articles/{title}.html"
  blog.summary_separator = /SPLIT_SUMMARY_BEFORE_THIS/

  blog.paginate = true
  blog.page_link = "p{num}"
  blog.per_page = 20
end



set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


#
## DEPLOY
#
activate :deploy do |deploy|
  deploy.build_before = true # default: false

  deploy.method = :git
  # Optional Settings
  deploy.remote   = 'github' # remote name or git url, default: origin
  deploy.branch   = 'master' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

# Build-specific configuration
configure :build do

  #See lib/build_cleaner.rb
  activate :build_cleaner


  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Minify HTML on build
  activate :minify_html

  # Or use a different image path
  # set :http_prefix, "/Content/images/"


end
