create database uptodate;

CREATE TABLE `user_role_id`(
    `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_name` TINYTEXT NOT NULL
);

CREATE TABLE `user_role`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_id` INT NOT NULL
);

CREATE TABLE `post_category_id`(
    `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` TINYTEXT NOT NULL
);

CREATE TABLE `project_rating`(
    `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `project_id` INT NOT NULL,
    `review` INT NOT NULL
);

CREATE TABLE `users`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fname` TEXT NOT NULL,
    `lname` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `username` TEXT NOT NULL,
    `password` MEDIUMTEXT NOT NULL,
    `newsletter` TINYINT(1) NULL
);

CREATE TABLE `user_subscriptions`(
    `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL
);

CREATE TABLE `posts`(
    `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `project_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `title` TEXT NOT NULL,
    `category` TINYTEXT NOT NULL,
    `content` TEXT NOT NULL,
    `date` DATETIME NOT NULL,
    `views` SMALLINT NOT NULL,
    `paid_unpaid` TINYINT(1) NOT NULL
);

CREATE TABLE `projects`(
    `project_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `project_name` TINYTEXT NOT NULL,
    `website` TINYTEXT NOT NULL,
    `description` LONGTEXT NOT NULL,
    `social` LONGTEXT NOT NULL,
    `ceo` TINYTEXT NOT NULL,
    `cto` TINYTEXT NOT NULL,
    `email` TEXT NOT NULL,
    `other_contact` TEXT NOT NULL
);

CREATE TABLE `subscriptions`(
    `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subscription_level` TEXT NOT NULL
);

CREATE TABLE `user_rating`(
    `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL,
    `review` INT NOT NULL
);

CREATE TABLE `post_categories`(
    `post_id` INT UNSIGNED NOT NULL,
    `category_id` INT UNSIGNED NOT NULL
);




CREATE INDEX role_id_index ON user_role (role_id);

CREATE INDEX user_id_index ON user_role (user_id);

CREATE INDEX project_id_index ON projects (project_id);

CREATE INDEX user_id_index ON user_subscriptions (user_id);


ALTER TABLE
    `post_categories` ADD CONSTRAINT `post_categories_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`post_id`);


ALTER TABLE `user_role`
DROP COLUMN `role_id`;

ALTER TABLE `user_role`
ADD COLUMN `role_id` INT UNSIGNED NOT NULL;

ALTER TABLE `user_role`
ADD CONSTRAINT `user_role_role_id_foreign`
FOREIGN KEY (`role_id`) REFERENCES `user_role_id`(`role_id`);



CREATE INDEX user_id_index ON user_rating (user_id);

ALTER TABLE
    `posts` ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user_rating`(`user_id`);

ALTER TABLE `projects` MODIFY COLUMN `project_id` INT UNSIGNED NOT NULL;
ALTER TABLE `project_rating` MODIFY COLUMN `project_id` INT UNSIGNED NOT NULL;
CREATE INDEX project_id_index ON project_rating (project_id);

ALTER TABLE
    `projects` ADD CONSTRAINT `projects_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `project_rating`(`project_id`);

ALTER TABLE
    `user_subscriptions` ADD CONSTRAINT `user_subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE
    `project_rating` ADD CONSTRAINT `project_rating_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`post_id`);

ALTER TABLE
    `post_categories` ADD CONSTRAINT `post_categories_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `post_category_id`(`category_id`);

ALTER TABLE
    `user_rating` ADD CONSTRAINT `user_rating_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`post_id`);
    
    
    
    

INSERT INTO `user_role_id` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Proj_team');



INSERT INTO `post_category_id` (`category_id`, `category_name`) VALUES
(1, 'De-fi'),
(2, 'NFT'),
(3, 'LIQUID STAKING');


INSERT INTO `project_rating` (`post_id`, `project_id`, `review`) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 5);


INSERT INTO `users` (`user_id`, `fname`, `lname`, `email`, `username`, `password`, `newsletter`) VALUES
(1, 'Alex', 'Smith', 'alex@example.com', 'alexsm', 'password1', 1),
(2, 'Emma', 'Racolta', 'emma@example.com', 'emma', 'password2', 0),
(3, 'Max', 'Hategan', 'max@example.com', 'maxwill', 'password3', 1),
(4, 'Sofy', 'Brown', 'sophia@example.com', 'sbrown', 'passwor3d', 1),
(5, 'Liam', 'David', 'liam@example.com', 'livis', 'passwor4d', 0),
(6, 'Oliv', 'Miller', 'olivia@example.com', 'oer', 'passwo5rd', 1),
(7, 'Dani', 'Lane', 'noah@example.com', 'nolson', 'password6', 0),
(8, 'Ava', 'Mani', 'ava@example.com', 'ava', 'password7', 1);

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3);


INSERT INTO `projects` (`project_id`, `project_name`, `website`, `description`, `social`, `ceo`, `cto`, `email`, `other_contact`) VALUES
(1, 'Project 1', 'https://project1.com', 'Description of project 1', 'Social links ', 'Stefan mandachi', 'CTO 1', 'project1@gmail.com', 'Other contact info for project 1'),
(2, 'Project 2', 'https://project2.com', 'Description of project 2', 'Social links', 'Marius Miclea', 'CTO 2', 'project2@gmail.com', 'Other contact info for project 2'),
(3, 'Project 3', 'https://project3.com', 'Description of project 3', 'Social links ', 'Beni mincu', 'Lucian Mincu 3', 'project3@gmail.com', 'Other contact info for project 3');



INSERT INTO `subscriptions` (`subscription_id`, `subscription_level`) VALUES
(1, 'Free'),
(2, 'Premium');


ALTER TABLE `user_subscriptions` DROP PRIMARY KEY;
ALTER TABLE `user_subscriptions` ADD PRIMARY KEY (`user_id`);
ALTER TABLE `user_subscriptions` ADD COLUMN `subscription_id` INT;

INSERT INTO `user_subscriptions` (`user_id`, `subscription_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 1),
(8, 1);

-- erau linkuite tabelul de posts si rating si dependente una de alta si nu puteam adauga postari daca nu aveam rating si nici rating daca nu aveam postari asa ca le-am delinkuit.
ALTER TABLE `posts` DROP FOREIGN KEY `posts_user_id_foreign`;
ALTER TABLE `user_rating` DROP FOREIGN KEY `user_rating_post_id_foreign`;
ALTER TABLE `user_rating` ADD CONSTRAINT `user_rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);


INSERT INTO `posts` (`post_id`, `project_id`, `user_id`, `title`, `category`, `content`, `date`, `views`, `paid_unpaid`) VALUES
(1, 1, 1, 'Midas', 'nft', 'Midas.X.Blockchain™ represents the forefront of the next generation blockchain platforms. Enter the Golden Age.', NOW(), 100, 1),
(2, 2, 2, 'Muliversx', 'defi', 'MultiversX is a distributed blockchain network for next-gen applications. Decentralized via 3,000+ nodes, scalable through sharding, fast, secure & green.t', NOW(), 150, 1),
(3, 3, 1, 'Bhat', 'defi', 'A complete crypto launchpad designed for startups who want to take their cryptocurrency project or NFTs onto MultiversX (ex Elrond) and BNB chain, following all legal regulations and requirements', NOW(), 200, 0);


INSERT INTO `user_rating` (`post_id`, `user_id`, `review`) VALUES
(1, 1, 4),
(2, 2, 5);



INSERT INTO `post_categories` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3);




    