-- User
CREATE TABLE `User` (
  `user_username` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_status` varchar(255) NOT NULL,
  PRIMARY KEY (`user_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `User` (`user_name`, `user_status`, `user_username`) values ('ฝ่ายจัดการการเรียน', 'Admin', 'admin1');
insert into `User` (`user_name`, `user_status`, `user_username`) values ('นางสาวเมษิณี ยมนัต', 'Student', 'std_1');
insert into `User` (`user_name`, `user_status`, `user_username`) values ('นางสาวชูครีม ชอบกินชาบู', 'Student', 'std_2');
insert into `User` (`user_name`, `user_status`, `user_username`) values ('นายชนม์สวัสดิ์ นาคนาม', 'Teacher', 't1');
insert into `User` (`user_name`, `user_status`, `user_username`) values ('นายหัสวรรษ เวียงพา', 'Teacher', 't2');
insert into `User` (`user_name`, `user_status`, `user_username`) values ('นายศราวุฒิ พ่อสาร', 'Teacher', 't3');


-- Sended
CREATE TABLE `Sended` (
  `sended_id` int unsigned NOT NULL AUTO_INCREMENT,
  `homework_id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `student_status` varchar(255) NOT NULL DEFAULT 'ส่งแล้ว',
  `teacher_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sended_id`),
  KEY `sended_fk_user` (`user_id`),
  CONSTRAINT `sended_fk_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `Sended` (`homework_id`, `sended_id`, `student_status`, `teacher_status`, `user_id`) values (1, 1, 'ส่งแล้ว', NULL, 'std_1');
insert into `Sended` (`homework_id`, `sended_id`, `student_status`, `teacher_status`, `user_id`) values (2, 2, 'ส่งแล้ว', NULL, 'std_1');
insert into `Sended` (`homework_id`, `sended_id`, `student_status`, `teacher_status`, `user_id`) values (1, 3, 'ส่งแล้ว', NULL, 'std_2');


-- Homework
CREATE TABLE `Homework` (
  `homework_id` int unsigned NOT NULL AUTO_INCREMENT,
  `homework_subject` varchar(255) NOT NULL,
  `homework_title` varchar(255) NOT NULL,
  `homework_user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`homework_id`),
  KEY `hw_fk_user` (`homework_user_id`),
  CONSTRAINT `hw_fk_user` FOREIGN KEY (`homework_user_id`) REFERENCES `User` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `Homework` (`homework_id`, `homework_subject`, `homework_title`, `homework_user_id`) values (1, 'ภาษาอังกฤษ', 'Gramma', 't1');
insert into `Homework` (`homework_id`, `homework_subject`, `homework_title`, `homework_user_id`) values (2, 'การเขียนโปรแกรมคอมพิวเตอร์', 'การใช้ Next js', 't1');
insert into `Homework` (`homework_id`, `homework_subject`, `homework_title`, `homework_user_id`) values (3, 'ภาษาไทย', 'คำที่ใช้ผิดบ่อยๆ', 't2');
