# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.create(
	sid:0,
	cid:0,
	signature:"",
	signature_gen:"",
	signature_id:"",
	signature_rev:"",
	timestamp:"0000-00-00 00:00:00",
	unified_event_id:0,
	unified_event_ref:0,
	unified_ref_time:"0000-00-00 00:00:00",
	priority:1,
	eclass:"",
	status:0,
	src_ip:0,
	dst_ip:0,
	src_port:0,
	dst_port:0,
	icmp_type:0,
	icmp_code:0,
	ip_proto:0,
	ip_ver:0,
	ip_hlen:0,
	ip_tos:0,
	ip_len:0,
	ip_id:0,
	ip_flags:0,
	ip_off:0,
	ip_ttl:0,
	ip_csum:0,
	last_modified:"0000-00-00 00:00:00",
	last_uid:0,
	abuse_queue:"",
	abuse_sent:"")

