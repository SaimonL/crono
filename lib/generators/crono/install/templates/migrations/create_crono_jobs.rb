class CreateCronoJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :crono_jobs do |t|
      t.string    :job_id, null: false

      t.text      :log,
                  limit: 1073741823, # LONGTEXT for MySQL
                  comment: 'Stores status of success or error message if any'

      t.text      :last_failed_error,
                  limit: 1073741823, # LONGTEXT for MySQL
                  comment: 'We do not want to lose error message if it ran again and was successful'

      t.datetime  :last_performed_at, comment: 'Last time this job was performed at'
      t.datetime  :last_failed_at, comment: 'Last time this job had an error so we know if it had any at all'
      t.boolean   :healthy, comment: 'Whether or not the job ran successfully'

      t.timestamps null: false
    end

    add_index :crono_jobs, [:job_id], unique: true
    add_index :crono_jobs, [:healthy], unique: false
  end
end
