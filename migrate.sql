CREATE TABLE `jobs` (
  `id` serial PRIMARY KEY,
  `owner` bigint unsigned NOT NULL,
  `status` ENUM ('draft', 'active', 'expired') NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255),
  `min_salary` int,
  `max_salary` int,
  `minimum_education` int,
  `urgent` bool DEFAULT false,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT (now())
);

CREATE TABLE `job_advances` (
  `job_id` bigint unsigned NOT NULL,
  `advance` varchar(255) NOT NULL,
  `is_required` bool DEFAULT false
);

CREATE TABLE `companies` (
  `id` serial PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255),
  `location` varchar(255) NOT NULL
);

CREATE TABLE `users` (
  `id` serial PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `resume` varchar(255),
  `phone_number` varchar(255) NOT NULL,
  `education_tier` int,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
);

CREATE TABLE `user_advances` (
  `user_id` bigint unsigned NOT NULL,
  `advance` varchar(255) NOT NULL
);

CREATE TABLE `applications` (
  `status` ENUM ('created', 'rejected', 'waiting_for_interview', 'interview_rejected', 'interview_accepted', 'offer_rejected', 'done') NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL
);

CREATE TABLE `advances` (
  `name` varchar(255) PRIMARY KEY,
  `description` varchar(255)
);

CREATE TABLE `job_categories` (
  `name` varchar(255) PRIMARY KEY
);

CREATE TABLE `company_categories` (
  `name` varchar(255) PRIMARY KEY
);

CREATE TABLE `cities` (
  `name` varchar(255) PRIMARY KEY
);

CREATE INDEX `job_advances_index_0` ON `job_advances` (`job_id`);

CREATE INDEX `users_index_1` ON `users` (`email`);

CREATE INDEX `users_index_2` ON `users` (`city`);

CREATE INDEX `user_advances_index_3` ON `user_advances` (`user_id`);

ALTER TABLE `companies` ADD FOREIGN KEY (`category`) REFERENCES `company_categories` (`name`);

ALTER TABLE `companies` ADD FOREIGN KEY (`location`) REFERENCES `cities` (`name`);

ALTER TABLE `jobs` ADD FOREIGN KEY (`owner`) REFERENCES `companies` (`id`);

ALTER TABLE `jobs` ADD FOREIGN KEY (`category`) REFERENCES `job_categories` (`name`);

ALTER TABLE `users` ADD FOREIGN KEY (`city`) REFERENCES `cities` (`name`);

ALTER TABLE `applications` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `applications` ADD FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`);

ALTER TABLE `user_advances` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_advances` ADD FOREIGN KEY (`advance`) REFERENCES `advances` (`name`);

ALTER TABLE `job_advances` ADD FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`);

ALTER TABLE `job_advances` ADD FOREIGN KEY (`advance`) REFERENCES `advances` (`name`);
