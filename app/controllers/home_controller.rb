class HomeController < ApplicationController
  before_action :set_twitter_client

  def update
    text = params.require(:text)
    begin
      @twitter.update(text)
    rescue => e
      error = e
    end
    render plain: error || "Twitter.update"
  end

  helper_method :update

  private

  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = "APIから取得"
      config.consumer_secret     = "同上"
      config.access_token        = "同上"
      config.access_token_secret = "同上"
    end
  end
end
