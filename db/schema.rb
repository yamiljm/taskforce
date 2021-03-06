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

ActiveRecord::Schema.define(version: 20161217225405) do

  create_table "field_definitions", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.string   "validationRegex"
    t.boolean  "required"
    t.integer  "step_definition_id"
    t.string   "errorMessage"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "options"
  end

# Could not dump table "fields" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "step_definitions" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "steps", force: true do |t|
    t.integer  "order"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["task_id"], name: "index_steps_on_task_id"

  create_table "task_definitions", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "step_definitions"
    t.string   "reference"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "task_type"
    t.string   "description"
    t.string   "status"
    t.integer  "currentStep"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_id"
  end

  create_table "workflows", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
