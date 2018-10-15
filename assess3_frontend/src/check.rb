require "json"
require "mysql2"

#Config
dbHost = "localhost"
dbUser = ""
dbPass = ""
dbDatabase = "securityonion_db"
dbTable = "event"
checkTimerSeconds = 5
lastEventFile = "lastEvent.json"
lastEventId = 0

#Check that local storage file exists in first-run scenarios
if File.file?(lastEventFile) == false 
    stub = { 'unified_event_id' => '0' }
    File.open(lastEventFile, 'w') do |f|
        f.write(stub.to_json)
    end
end

#Connect to DB
begin
    dbConnect = Mysql2::Client.new(:host => dbHost, :username => dbUser, :password => dbPass, :database => dbDatabase)

    #Loop every so often, check DB for updates, and send to REST api, save last event to local FS
    while true do
        puts Time.now

        #TODO: Check local FS for last used ID
        lastEventFileHandler = File.read(lastEventFile)
        lastEventData = JSON.parse(lastEventFileHandler)
        #Show Last event
        puts 'Last Event: ' + lastEventData['unified_event_id']
        lastEventId = lastEventData['unified_event_id']
        
        eventQuery = "SELECT * FROM event WHERE unified_event_id > #{lastEventId} ORDER BY unified_event_id ASC"
        puts eventQuery

        eventResult = dbConnect.query(eventQuery)

        rs.each_hash {
            |e| puts e['unified_event_id']
        }
        
        #Hold execution until timer has elapsed
        sleep checkTimerSeconds
    end

rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect

ensure
    dbConnect.close if dbConnect
end



