class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  $redis = Redis::Namespace.new("line_server", :redis => Redis.new)
end
