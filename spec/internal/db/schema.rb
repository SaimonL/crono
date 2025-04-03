ActiveRecord::Schema.define do
  create_table :crono_jobs do |t|
    t.string    :job_id, null: false
    t.text      :log, limit: 1_073_741_823 # LONGTEXT for MySQL
    t.text      :last_failed_error, limit: 1_073_741_823 # LONGTEXT for MySQL
    t.datetime  :last_performed_at
    t.datetime  :last_failed_at
    t.boolean   :healthy
    t.timestamps null: false
  end

  add_index :crono_jobs, [:job_id], unique: true
  add_index :crono_jobs, [:healthy], unique: false
end
