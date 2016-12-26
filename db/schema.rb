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

ActiveRecord::Schema.define(version: 20160901203201) do

  create_table "tbl_Articulo", primary_key: "ID_Articulo", force: :cascade do |t|
    t.string  "Titulo",     limit: 50,    null: false
    t.string  "Resumen",    limit: 255,   null: false
    t.text    "Contenido",  limit: 65535, null: false
    t.date    "Fecha",                    null: false
    t.integer "ID_Persona", limit: 4,     null: false
    t.integer "visitas",    limit: 4
  end

  add_index "tbl_Articulo", ["ID_Persona"], name: "tbl_Articulo_ibfk_1", using: :btree

  create_table "tbl_Persona", primary_key: "ID_Persona", force: :cascade do |t|
    t.string "picture",         limit: 255
    t.string "Nombre",          limit: 50,  null: false
    t.string "Apellido1",       limit: 50,  null: false
    t.string "Apellido2",       limit: 50
    t.string "Usuario",         limit: 20,  null: false
    t.string "password_digest", limit: 255, null: false
    t.string "Descripcion",     limit: 255, null: false
  end

  add_index "tbl_Persona", ["Usuario"], name: "Usuario", unique: true, using: :btree

  create_table "tbl_Recurso", primary_key: "ID_Recurso", force: :cascade do |t|
    t.string  "URL",         limit: 255, null: false
    t.integer "ID_Articulo", limit: 4,   null: false
  end

  add_index "tbl_Recurso", ["ID_Articulo"], name: "tbl_Recurso_ibfk_1", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "Titulo",     limit: 255
    t.string   "Resumen",    limit: 255
    t.string   "URL",        limit: 255
    t.integer  "visitas",    limit: 4
    t.date     "Fecha"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "tbl_Articulo", "tbl_Persona", column: "ID_Persona", primary_key: "ID_Persona", name: "tbl_Articulo_ibfk_1"
  add_foreign_key "tbl_Recurso", "tbl_Articulo", column: "ID_Articulo", primary_key: "ID_Articulo", name: "tbl_Recurso_ibfk_1"
end
