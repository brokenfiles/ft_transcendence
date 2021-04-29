# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_29_130211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "battles", force: :cascade do |t|
    t.bigint "first_user_id"
    t.bigint "second_user_id"
    t.bigint "winner_id"
    t.string "scores"
    t.boolean "rated", default: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_user_id"], name: "index_battles_on_first_user_id"
    t.index ["second_user_id"], name: "index_battles_on_second_user_id"
    t.index ["winner_id"], name: "index_battles_on_winner_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "current_war_id"
    t.string "display_name"
    t.string "anagram", limit: 5
    t.integer "points", default: 0
    t.integer "war_points", default: 0
    t.boolean "open", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["current_war_id"], name: "index_guilds_on_current_war_id"
    t.index ["owner_id"], name: "index_guilds_on_owner_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "winner_id"
    t.bigint "host_id"
    t.string "title"
    t.string "description"
    t.integer "price", default: 0
    t.boolean "rated", default: false
    t.boolean "generated", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_tournaments_on_host_id"
    t.index ["winner_id"], name: "index_tournaments_on_winner_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "guild_id"
    t.string "display_name"
    t.string "role", default: "user"
    t.string "login"
    t.integer "points", default: 0
    t.string "oauth_token"
    t.string "double_auth"
    t.string "guild_rank"
    t.datetime "banned"
    t.string "ban_reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "banned_by_id"
    t.index ["banned_by_id"], name: "index_users_on_banned_by_id"
    t.index ["guild_id"], name: "index_users_on_guild_id"
  end

  create_table "wars", force: :cascade do |t|
    t.bigint "first_guild_id"
    t.bigint "second_guild_id"
    t.datetime "started_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "ended_at", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "reward", default: 0
    t.datetime "wartime_start"
    t.datetime "wartime_end"
    t.integer "max_unanswered", default: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_guild_id"], name: "index_wars_on_first_guild_id"
    t.index ["second_guild_id"], name: "index_wars_on_second_guild_id"
  end

end
