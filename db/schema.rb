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

ActiveRecord::Schema.define(version: 20141218203704) do

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "todo_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["todo_id"], name: "index_comments_on_todo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: true do |t|
    t.string   "action"
    t.integer  "user_id"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "detail"
  end

  add_index "events", ["project_id"], name: "index_events_on_project_id"
  add_index "events", ["trackable_id", "trackable_type"], name: "index_events_on_trackable_id_and_trackable_type"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "memberships", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "important"
    t.datetime "complete_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "complete_user_id"
    t.integer  "comments_count",   default: 0, null: false
  end

  add_index "todos", ["complete_user_id"], name: "index_todos_on_complete_user_id"
  add_index "todos", ["project_id"], name: "index_todos_on_project_id"
  add_index "todos", ["user_id"], name: "index_todos_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "username"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_team_id"
  end

  add_index "users", ["current_team_id"], name: "index_users_on_current_team_id"

end
