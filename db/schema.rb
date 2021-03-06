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

ActiveRecord::Schema.define(version: 20171108214847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "start"
    t.integer "home_id"
    t.integer "away_id"
    t.integer "h_score"
    t.integer "a_score"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "week_id"
    t.index ["week_id"], name: "index_games_on_week_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "join_token"
    t.index ["join_token"], name: "index_leagues_on_join_token", unique: true
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "user_league_id"
    t.bigint "team_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_picks_on_game_id"
    t.index ["team_id"], name: "index_picks_on_team_id"
    t.index ["user_league_id"], name: "index_picks_on_user_league_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "abbreviation"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_leagues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_user_leagues_on_league_id"
    t.index ["user_id"], name: "index_user_leagues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.string "password_digest"
  end

  create_table "weeks", force: :cascade do |t|
    t.bigint "season_id"
    t.integer "number"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_weeks_on_season_id"
  end

  add_foreign_key "picks", "games"
  add_foreign_key "picks", "teams"
  add_foreign_key "picks", "user_leagues"
  add_foreign_key "user_leagues", "leagues"
  add_foreign_key "user_leagues", "users"
  add_foreign_key "weeks", "seasons"
end
