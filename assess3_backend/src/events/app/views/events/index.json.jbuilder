json.array!(@events) do |event|
  json.extract! event, :id, :sid, :cid, :signature, :signature_gen, :signature_id, :signature_rev, :timestamp, :unified_event_id, :unified_event_ref, :unified_ref_time, :priority, :class, :status, :src_ip, :dst_ip, :src_port, :dst_port, :icmp_type, :icmp_code, :ip_proto, :ip_ver, :ip_ver, :ip_hlen, :ip_tos, :ip_len, :ip_id, :ip_flags, :ip_off, :ip_ttl, :ip_csum, :last_modified, :last_uid, :abuse_queue, :abuse_sent
  json.url event_url(event, format: :json)
end
