require 'rubygems'
require 'faye'
require 'thin'
require_relative 'app'

Faye::WebSocket.load_adapter 'thin'
$FAYE = nil

use Faye::RackAdapter, :mount => '/faye', :timeout => 25 do |faye|
    faye.on(:handshake) {|c| puts "HANDSHAKE WITH #{c}"}
    faye.on(:subscribe) {|c, ch| puts "SUBSCRIBE #{c} to #{ch}"}
    faye.on(:unsubscribe) {|c, ch| puts "UNSUBSCRIBE #{c} from #{ch}"}
    faye.on(:publish) {|c, ch, d| puts "PUBLISH #{d} to #{ch}"}
    $FAYE = faye.get_client
end

run OBSControl
