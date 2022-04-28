class OgImagerController < ApplicationController
  # GET /og_imager/dev_to
  # @param {string} title
  # @param {string} avatar
  # @param {string} username
  # @param {string} timestamp
  # @param {array} logos
  # @returns image/png
  def dev_to
    # Get params and set to variable
    # TODO: Retrieve your object instead :p
    @title = params[:title]
    @avatar = params[:avatar]
    @username = params[:username]
    @timestamp = params[:timestamp]
    @logos = params[:logos]

    # Grover.new accepts a URL or inline HTML and optional parameters for Puppeteer
    grover = Grover.new(
      render_to_string
    )

    # Get a screenshot
    png = grover.to_png

    # Render image
    send_data(png, type: 'image/png', disposition: 'inline')
  end
end
