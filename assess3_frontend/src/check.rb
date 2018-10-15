#!/usr/local/bin/ruby -w
require "./lib/SecOnion/SecOnion"
require "./lib/SecOnion/SecOnionFile"

#Config
dbHost = "127.0.0.1"
dbUser = "root"
dbPass = ""
dbDatabase = "securityonion_db"
checkTimerSeconds = 5
lastEventFile = "lastEvent.json"
apiHost = "192.168.1.25"
apiPort = '3000'

#Begin Security Onion Integration
secOnion = SecOnion.new(apiHost, apiPort)
secOnionFile = SecOnionFile.new(lastEventFile)

secOnionFile.initLastFile()

begin
    #Connect to DB
    secOnion.dbConnect(dbHost, dbUser, dbPass, dbDatabase)

    #Loop every so often, check DB for updates, and send to REST api, save last event to local FS
    while true do
        puts Time.now

        lastEventData = secOnionFile.readLastFile()
        
        if (secOnion.getLastEventRecord() == "")
            secOnion.setLastEventRecord(lastEventData)
        end

        #Show Last event
        puts 'Last Event: ' + lastEventData['unified_event_id'].to_s
        lastEventId = lastEventData['unified_event_id']
        
        #Get New Events
        eventResult = secOnion.getNewEvents(lastEventId)

        #For Each new event, build JSON, and POST to API
        eventResult.each {
            |eventItem|
            event = secOnion.prepareEvent(eventItem)
            
            secOnion.postEvent(event)
        }

        #Store Last used Event Id
        secOnionFile.writeLastFile(secOnion.getLastEventRecord())
                
        #Hold execution until timer has elapsed
        sleep checkTimerSeconds
    end

rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect

ensure
    secOnion.dbClose()
    
end