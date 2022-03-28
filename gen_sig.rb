require "json"
require "openssl"

json_user_data = JSON.generate({
  :user_id => 10,
  :user_info => {:name => "Mr. Channels"} })
# NB: written as double-escaped JSON!
# => "{\"user_id\":10,\"user_info\":{\"name\":\"Mr. Channels\"}}"

digest = OpenSSL::Digest::SHA256.new

secret = "7ad3773142a6692b25b8"
string_to_sign = "1234.1234:presence-foobar:#{json_user_data}"
puts signature = OpenSSL::HMAC.hexdigest(digest, secret, string_to_sign)
# => afaed3695da2ffd16931f457e338e6c9f2921fa133ce7dac49f529792be6304c
