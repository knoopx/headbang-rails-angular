set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  set :http_prefix, "app://headbang"
end

helpers do
  def image_url(path)
    asset_url(path, "images")
  end
end
