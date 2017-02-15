# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170112155444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts_as_having_has_as", force: :cascade do |t|
    t.string   "haser_type"
    t.integer  "haser_id"
    t.string   "hased_type"
    t.integer  "hased_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acts_as_relating_to_relationships", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "in_relation_to_id"
    t.string   "in_relation_to_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "acts_as_relating_to_roles", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "app_collaborators_access_grants", force: :cascade do |t|
    t.integer  "app_client_id"
    t.string   "code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "resource_owner_id"
    t.integer  "access_token_id"
  end

  create_table "app_collaborators_access_tokens", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "application_type"
    t.integer  "resource_owner_id"
    t.string   "token"
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "app_collaborators_api_service_transactions", force: :cascade do |t|
    t.integer  "api_service_id"
    t.integer  "app_client_id"
    t.string   "result_status"
    t.string   "result"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "app_collaborators_app_clients", force: :cascade do |t|
    t.string   "name"
    t.string   "uuid"
    t.string   "secret"
    t.text     "redirect_uri"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "display_name"
    t.string   "api_key"
  end

  create_table "app_collaborators_app_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "uri"
    t.string   "base_path"
    t.string   "uuid"
    t.string   "secret"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "app_client_type"
    t.integer  "app_client_id"
  end

  create_table "app_collaborators_scopes", force: :cascade do |t|
    t.string   "code"
    t.string   "display_text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bigbee_labs_event_bases", force: :cascade do |t|
    t.string   "system_name"
    t.text     "description"
    t.string   "display"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bigbee_labs_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.jsonb    "details",     default: {}
    t.text     "description"
    t.string   "type"
    t.string   "display"
  end

  add_index "bigbee_labs_events", ["details"], name: "index_bigbee_labs_events_on_details", using: :gin

  create_table "bigbee_labs_events_event_listens", force: :cascade do |t|
    t.integer  "event_id"
    t.jsonb    "details",    default: {}
    t.jsonb    "callback",   default: {}
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "bigbee_labs_events_event_occurrence_bases", force: :cascade do |t|
    t.string   "event_type"
    t.string   "event_id"
    t.string   "type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.jsonb    "details",    default: {}, null: false
  end

  add_index "bigbee_labs_events_event_occurrence_bases", ["details"], name: "index_bigbee_labs_events_event_occurrence_bases_on_details", using: :gin

end
