require 'sinatra/base'
require 'faye'
require 'httparty'

class OBSControl < Sinatra::Base
    get '/' do
        puts $FAYE.inspect
        erb :index
    end

    get '/pause' do
	resp = HTTParty.get('http://localhost:8080/ctrl/record/stop?rec=rec&name=eztv&app=eztv')
        sleep(3)
        [200, "OK"]
    end

    get '/start' do
	resp = HTTParty.get('http://localhost:8080/ctrl/record/start?rec=rec&name=eztv&app=eztv')
        sleep(5)
        [200, "OK"]
    end

    get '/disk' do
        out = `df | grep eztv`.split(' ')
        used, cap = out[2].to_i, out[3].to_i
        free = cap - used
        limit = free / 50.0 / 1024.0
        if limit > 60
            [200, "approximately #{(limit / 60).floor} hr #{(limit % 60).floor} min remaining"]
        else
            [200, "approximately #{limit.floor} min remaining"]
        end
    end

    get '/reset' do
        `rm /tmp/*.flv`
        `rm /tmp/*.mp4`
        `umount /home/eztv/drive`
        [200, "OK"]
    end

    get '/finish' do
        `ffmpeg -i /tmp/eztv.flv -c copy -copyts /tmp/eztv.mp4`
        fn = "EZTVRecord-#{Time.now.strftime('%Y-%m-%d-%I-%M-%p')}.mp4"
        `cp /tmp/eztv.mp4 /home/eztv/drive/#{fn}`
        `mv /tmp/eztv.flv /home/eztv/#{fn}.flv`
        `rm /tmp/*.flv`
        `rm /tmp/*.mp4`
        `umount /home/eztv/drive`
        [200, "OK"]
    end

    get '/mount_success' do
        puts "Mounted!"
        $FAYE.publish '/obs/ready', {state: 'mounted'}
        [200, "OK"]
    end
end
