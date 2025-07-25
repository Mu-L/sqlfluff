CREATE TABLE `foo` (
  b VARCHAR(255) BINARY,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `foo` (
  b VARCHAR(255) BINARY,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=`utf8mb4` COLLATE=`utf8mb4_unicode_ci`;

CREATE TABLE `foo` (
  b VARCHAR(255) BINARY,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8mb4' COLLATE='utf8mb4_unicode_ci';

CREATE TABLE `foo` (
  b VARCHAR(255) BINARY,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET="utf8mb4" COLLATE="utf8mb4_unicode_ci";

create table `tickets` (
    `id` serial primary key,
    `material_number` varchar(255) default null,
    `material_name` varchar(255) default null,
    `date_created` date not null default (current_date),
    `date_closed` date default null
);

create table _ (a int);

create table y LIKE x;

CREATE TABLE `messages_daily_stats` (
    `id` int(20) NOT NULL AUTO_INCREMENT,
    `optional` int(20) NOT NULL,
    `test` int(11) GENERATED ALWAYS AS (case when `optional` = 1 then `id` else NULL end) STORED INVISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE t1 (
    i INT VISIBLE,
    j DATE INVISIBLE
) ENGINE = InnoDB;
