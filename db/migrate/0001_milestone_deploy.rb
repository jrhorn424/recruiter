class MilestoneDeploy < ActiveRecord::Migration
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", id: false, force: true do |t|
    t.integer "subject_id"
    t.integer "experiment_id"
  end

  add_index "assignments", ["experiment_id"], name: "index_assignments_on_experiment_id", using: :btree
  add_index "assignments", ["subject_id"], name: "index_assignments_on_subject_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_experiments", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "experiment_id"
  end

  add_index "categories_experiments", ["category_id"], name: "index_categories_experiments_on_category_id", using: :btree
  add_index "categories_experiments", ["experiment_id"], name: "index_categories_experiments_on_experiment_id", using: :btree

  create_table "class_years", id: false, force: true do |t|
    t.integer  "year"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "ethnicities", id: false, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiments", force: true do |t|
    t.string   "name",                        null: false
    t.string   "description"
    t.string   "type"
    t.boolean  "finished",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiments", ["name"], name: "index_experiments_on_name", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "labs", force: true do |t|
    t.string   "location",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labs", ["location"], name: "index_labs_on_location", unique: true, using: :btree

  create_table "majors", id: false, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "professions", id: false, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "secondary_email"
    t.string   "first_name",      limit: 30
    t.string   "last_name",       limit: 30
    t.string   "phone",           limit: 14
    t.string   "gender",          limit: 1
    t.integer  "total_years",     limit: 2
    t.integer  "year_started"
    t.decimal  "current_gpa",                precision: 3, scale: 2
    t.integer  "years_resident",  limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "birth_year"
    t.string   "profession"
    t.string   "major"
    t.string   "ethnicity"
    t.integer  "class_year"
  end

  add_index "profiles", ["secondary_email"], name: "index_profiles_on_secondary_email", unique: true, using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "registrations", id: false, force: true do |t|
    t.integer "subject_id"
    t.integer "session_id"
    t.boolean "participated"
    t.boolean "shown_up"
  end

  add_index "registrations", ["session_id"], name: "index_registrations_on_session_id", using: :btree
  add_index "registrations", ["subject_id"], name: "index_registrations_on_subject_id", using: :btree

  create_table "sessions", force: true do |t|
    t.datetime "start_time",                            null: false
    t.datetime "end_time",                              null: false
    t.integer  "registered_subjects"
    t.integer  "required_subjects"
    t.integer  "lab_id"
    t.boolean  "finished",              default: false, null: false
    t.datetime "registration_deadline",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experiment_id",                         null: false
    t.time     "duration"
  end

  add_index "sessions", ["lab_id"], name: "index_sessions_on_lab_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 30
    t.string   "type"
    t.boolean  "suspended",                         default: false, null: false
    t.boolean  "active",                            default: true,  null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_sessions", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "session_id"
  end

  add_index "users_sessions", ["session_id"], name: "index_users_sessions_on_session_id", using: :btree
  add_index "users_sessions", ["user_id"], name: "index_users_sessions_on_user_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
