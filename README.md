
* Set up security onion box with snort IDS
* Snort events go into sguil
* Sguil uses mysql to house snort events
* On the security onion box write a ruby service (linux service) that connects to the sguil mysql db,identify new events, and post them to rails server via REST
* On a different VM, setup rails with basic server, simple model for events, and a controller that takes a REST call to add an event to local database (db type of your choosing)