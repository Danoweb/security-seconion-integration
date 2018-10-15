require_relative "SecOnion"
require "json"

class SecOnionFile
    @lastEventFile = ""

    def initialize(lastEventFile)
        @lastEventFile = lastEventFile
    end

    def initLastFile()
        #Check that local storage file exists in first-run scenarios
        if File.file?(@lastEventFile) == false 
            stub = { 'unified_event_id' => '0' }
            File.open(@lastEventFile, 'w') do |f|
                f.write(stub.to_json)
            end
        end
    end

    def readLastFile()
        lastEventFileHandler = File.read(@lastEventFile)
        lastEventData = JSON.parse(lastEventFileHandler)
        #puts lastEventData
        return lastEventData
    end

    def writeLastFile(lastEventRecord)
        #Write storage object to local FS
        File.open(@lastEventFile, 'w') do |f|
            f.write(lastEventRecord.to_json)
        end
    end
end