class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false

      # t.references :movie, foreign_key: true, null: false, type: :integer
      t.references :schedule, foreign_key: true, null: false, type: :bigint
      t.references :sheet, foreign_key: true, null: false, type: :bigint

      t.string :email, null: false, limit: 255
      t.string :name, null: false, limit: 50

      t.integer :reservation_schedule_id_idx
      t.integer :reservation_sheet_id_idx

      # CREATE TABLE IF NOT EXISTS `railway`.`reservations` (
      #   `id` INT NOT NULL AUTO_INCREMENT,,
      #   `date` DATE NOT NULL,
      #   `schedule_id` INT NOT NULL,
      #   `sheet_id` INT NOT NULL,
      #   `email` VARCHAR(255) NOT NULL COMMENT '予約者メールアドレス',
      #   `name` VARCHAR(50) NOT NULL COMMENT '予約者名',
      #   `created_at` DATETIME NULL DEFAULT NOW(),
      #   `updated_at` DATETIME NULL DEFAULT NOW(),
      #   PRIMARY KEY (`id`),
      #   INDEX `reservation_schedule_id_idx` (`schedule_id` ASC) VISIBLE,
      #   INDEX `reservation_sheet_id_idx` (`sheet_id` ASC) VISIBLE,
      #   UNIQUE INDEX `reservation_schedule_sheet_unique` (`date` ASC, `schedule_id` ASC, `sheet_id` ASC) VISIBLE,
      #   CONSTRAINT `reservation_schedule_id`
      #   FOREIGN KEY (`schedule_id`)
      #   REFERENCES `railway`.`schedules` (`id`)
      #   ON DELETE NO ACTION
      #   ON UPDATE NO ACTION,
      #   CONSTRAINT `reservation_sheet_id`
      #   FOREIGN KEY (`sheet_id`)
      #   REFERENCES `railway`.`sheets` (`id`)
      #   ON DELETE NO ACTION
      #   ON UPDATE NO ACTION)

      t.timestamps
    end

    add_index :reservations, :schedule_id, order: :asc, name: :reservation_schedule_id_idx
    add_index :reservations, :sheet_id, order: :asc, name: :reservation_sheet_id_idx
    add_index :reservations, [:date, :schedule_id, :sheet_id], unique: true, name: :reservation_schedule_sheet_unique
  end
end
