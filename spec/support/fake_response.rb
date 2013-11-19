##
# FakeResponse
#
# Helpers for faking responses from the API
#
module FakeResponse
  DEFAULT_CONTENT_TYPE = "application/json"
  DEFAULT_URI          = %r{#{AudioVision::URL}}

  #---------------------
  # Takes the filename to respond with,
  # and (optionally) any options to be passed to 
  # +FakeWeb.register_uri+.
  #
  # If no block is given, the registry will not be cleaned
  # by this method.
  #
  # If passed a block, it will clean the registry after
  # the block has been run.
  #
  def mock_response(filename, options={}, &block)
    respond_with(filename, options)

    response = yield
    WebMock.reset!

    response
  end

  #---------------------
  # Register the root with WebMock, and set its 
  # response body to the contents of the requested file.
  def respond_with(filename, options={})
    content_type = options[:content_type] || DEFAULT_CONTENT_TYPE
    uri          = options.delete(:uri) || DEFAULT_URI

    stub_request(:get, uri).to_return(
      {
        :body         => load_fixture(filename),
        :content_type => content_type
      }.merge(options)
    )
  end

  #---------------------
  # Read a fixure file
  def load_fixture(filename)
    return if !filename || filename.empty?

    file = filename == :random ? random_filename : filename
    File.read(File.join FIXTURE_ROOT, file)
  end
end # FakeResponse
