class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      # CREATE TABLE IF NOT EXISTS `railway`.`schedules` (
      #   `id` INT NOT NULL AUTO_INCREMENT,
      #   `movie_id` INT NOT NULL,
      #   `start_time` TIME NOT NULL COMMENT '上映開始時刻',
      #   `end_time` TIME NOT NULL COMMENT '上映終了時刻',
      #   `created_at` DATETIME NOT NULL DEFAULT NOW(),
      #   `updated_at` DATETIME NOT NULL DEFAULT NOW(),
      #   PRIMARY KEY (`id`),
      #   INDEX `movie_id_idx` (`movie_id` ASC) VISIBLE,
      #   CONSTRAINT `movie_id`
      #   FOREIGN KEY (`movie_id`)
      #   REFERENCES `railway`.`movies` (`id`)
      #   ON DELETE NO ACTION
      #   ON UPDATE NO ACTION)

      t.references :movie, foreign_key: true, null: false, type: :integer

      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
    add_index :schedules, :movie_id, order: :asc, name: :movie_id_idx
  end
end
