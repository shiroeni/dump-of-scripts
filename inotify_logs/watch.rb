# frozen_string_literal: true

# Send info from the logs of the game server (joined and left users) to Slack-compatible Webhook service
#
# Installation:
#   gem install rb-inotify
# Running:
#   ruby /path/to/script/watch.rb

require 'rb-inotify'
require 'net/http'
require 'uri'
require 'json'

file_path = '/path/to/file'
notifier = INotify::Notifier.new

uri = URI('https://example.com/to_hook')

notifier.watch(file_path, :modify) do
  last_string = `tail -n 1 #{file_path}`

  if last_string.include?('joined') || last_string.include?('left')
    params = { content: last_string }

    post = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
    post.body = params.to_json

    Net::HTTP.start(uri.host, uri.port, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http| 
      http.request post
    end
  end
end

notifier.run
