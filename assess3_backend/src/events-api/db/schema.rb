# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_15_024427) do

  create_table "events", force: :cascade do |t|
    t.integer "sid"
    t.integer "cid"
    t.string "signature"
    t.string "signature_gen"
    t.string "signature_id"
    t.string "signature_rev"
    t.datetime "timestamp"
    t.integer "unified_event_id"
    t.integer "unified_event_ref"
    t.datetime "unified_ref_time"
    t.integer "priority"
    t.string "class"
    t.integer "status"
    t.integer "src_ip"
    t.integer "dst_ip"
    t.integer "src_port"
    t.integer "dst_port"
    t.integer "icmp_type"
    t.integer "icmp_code"
    t.integer "ip_proto"
    t.integer "ip_ver"
    t.integer "ip_hlen"
    t.integer "ip_tos"
    t.integer "ip_len"
    t.integer "ip_id"
    t.integer "ip_flags"
    t.integer "ip_off"
    t.integer "ip_ttl"
    t.integer "ip_csum"
    t.datetime "last_modified"
    t.integer "last_uid"
    t.string "abuse_queue"
    t.string "abuse_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
