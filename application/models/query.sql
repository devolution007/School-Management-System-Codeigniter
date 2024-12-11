ALTER TABLE `online_courses` ADD `html5_video` VARCHAR(255) NULL AFTER `video_id`;
ALTER TABLE `sch_settings` CHANGE `assessments_marks` `assessments_marks` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL;
ALTER TABLE `sch_settings` ADD `result_setting` TINYINT(11) NOT NULL DEFAULT '0' AFTER `offline_bank_payment_instruction`;
ALTER TABLE `sch_settings` CHANGE `result_setting` `result_setting` VARCHAR(255) NULL;

ALTER TABLE `subject_teacher` ADD `student_exam_info` INT(11) NOT NULL DEFAULT '0' AFTER `staff_id`;
ALTER TABLE `student_behaviour` ADD `comments` TEXT NULL AFTER `remarks`;
ALTER TABLE `grade_settings` ADD `class_id` INT(11) NULL AFTER `id`;
