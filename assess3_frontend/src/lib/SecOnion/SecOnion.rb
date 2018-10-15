require "mysql2"
require "net/http"

class SecOnion
    @dbConnect = ""
    @eventItem = ""
    @apiHost = ""
    @apiPort = ""
    @apiHeader = ""
    @http = ""
    @lastEventRecord = ""

    def initialize(apiHost, apiPort=80)
        @apiHost = apiHost
        @apiPort = apiPort

        @apiHeader = {'Content-Type': 'application/json'}
        @http = Net::HTTP.new(@apiHost, @apiPort)
        @lastEventRecord = ""
    end

    def dbConnect(dbHost, dbUser, dbPass, dbDatabase)
        @dbConnect = Mysql2::Client.new(:host => dbHost, :username => dbUser, :password => dbPass, :database => dbDatabase)
    end

    def getNewEvents(lastEventId)
        eventQuery = "SELECT * FROM event WHERE unified_event_id > '#{lastEventId}' ORDER BY unified_event_id ASC"
        #puts eventQuery

        return @dbConnect.query(eventQuery)
    end

    def prepareEvent(event)
        #puts 'Last Event Id: ' + event['unified_event_id'].to_s
        eventRecord = Hash.new

        event.each do |key, value|
            #puts "#{key}:#{value}"
            eventRecord[key] = value
        end

        #Log eventId for filesystem later
        @lastEventRecord = eventRecord

        return eventRecord
    end

    def postEvent(postData)
        #Build Request
        request = Net::HTTP::Post.new("/event", @apiHeader)
        event = Hash.new
        event['event'] = postData.to_json
        request.body = event

        #Send Request
        #response = @http.request(request)
        puts request.body
        #return response
    end

    def getLastEventRecord()
        return @lastEventRecord
    end

    def setLastEventRecord(lastEventRecord)
        @lastEventRecord = lastEventRecord
    end

    def dbClose()
        @dbConnect.close if @dbConnect
    end
end