BreezyPDF.setup do |config|
  # Secret API Key
  #
  # Obtain an API key from https://breezypdf.com
  # Store your API key in a secure location with the rest of your app secrets
  config.secret_api_key = 'SUPER_SECRET'


  # Middleware Path Matchers
  #
  # An array for Regular Expressions which identify which URL's should be
  # intercepted by the Middleware. Defaults to [/\.pdf/], which will match
  # all requests containing a .pdf extension.
  config.middleware_path_matchers = [/\.pdf/]


  # Treat URL's as Private
  #
  # This indicates if the URL requested is protected or unaccessible for the
  # public Internet. Examples of this would be when hosted on localhost (development)
  # URL's which are protected by authentication, or URL's that depend on session/cookie
  # data to display correctly. Default is true.
  #
  # config.treat_urls_as_private = true


  # Upload Assets
  #
  # Express your desire to upload assets within the requested HTML which are not
  # publicly accessible with a FQDN. This might include images, CSS, and
  # JavaScript when running in development mode, or assets which are referenced
  # with relative URL's. If you're able to turn this off, performance will be increased
  # Default is true.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  #
  config.upload_assets = true
  #
  # or, if your assets are only publicly available on production
  # config.upload_assets = Rails.env.development?


  # Asset Selectors
  #
  # Configure what types of assets should be evaluated to be uploaded. Expects an
  # array of string CSS selectors. Default is `[img script link[rel="stylesheet"]]`.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  # Only applicable when `config.upload_assets == true`
  #
  config.asset_selectors = %w(img script link[rel="stylesheet"])


  # Asset path matchers
  #
  # Determine which attribute path's to replace with an uploaded version of the asset.
  # Expects a hash of attr: Regexp values. Default is `{ href: /^\/\w+/, src: /^\/\w+/}`
  # which matches all relative paths.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  # Only applicable when `config.upload_assets == true`
  #
  # config.asset_path_matchers = {
  #   href: %r{^\/\w+},
  #   src:  %r{^\/\w+}
  # }

  # Asset Cache
  #
  # Cache asset URL's to prevent re-uploading of assets. Assets are cached based on asset_path,
  # so fingerprinting or digests are recommended before turning on. The default cache store is
  # a null store, which won't actually store anything. An in-memory store is also provided, but
  # this store won't share values across threads. Alternatively, use an external store which
  # implements a `fetch(key, opts={}, &blk) API, such as the Rails.cache.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  # Only applicable when `config.upload_assets == true`
  #
  # config.asset_cache = BreezyPDF::Cache::Null.new
  #
  # or
  #
  # config.asset_cache = BreezyPDF::Cache::InMemory.new
  #
  # or
  #
  # config.asset_cache = Rails.cache


  # Extract Metadata
  #
  # BreezyPDF supports specifying how a page should be rendered through meta tags within
  # the HTML to be rendered. Visit https://docs.breezypdf.com for metadata information. Default is
  # true.
  #
  # Only applicable when `treat_urls_as_private == true`
  # config.extract_metadata = true


  # Threads
  #
  # Specify the maximum number of Threads to use when uploading assets. This speeds up the
  # uploading of assets by doing them concurrently. Default is 1.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  # Only applicable when `config.upload_assets == true`
  #
  # config.threads = 1
  #
  # or
  #
  # config.theads = Concurrent.processor_count


  # Filter Elements
  #
  # Remove certain elements from the HTML which shouldn't be included in the PDF, such as
  # a navigation or footer elements. Default is false.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  #
  # config.filter_elements = false


  # Filter Elements Selectors
  #
  # CSS selectors to configure which element you'd like to remove. Expects an array of of
  # CSS selectors. Default is `[.breezy-pdf-remove]`.
  #
  # Only applicable when `config.treat_urls_as_private == true`
  #
  # config.filter_elements_selectors = %w[.breezy-pdf-remove]

  # Logger
  #
  # Configure the logger, if you're into that sort of thing.
  #
  # config.logger = Logger.new(STDOUT).tap { |logger| logger.level = Logger::FATAL }

  # Default Meta Data
  #
  # Define default meta data which will be included with every render. Extracted metadata
  # will override these values. Visit https://docs.breezypdf.com for metadata information.
  #
  # config.default_metadata = {
  #   width:  23.4,
  #   height: 33.1
  # }
end