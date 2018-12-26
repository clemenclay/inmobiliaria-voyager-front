-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.3.10-MariaDB-log - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla inmob.blog_posts
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_date` timestamp NULL DEFAULT current_timestamp(),
  `moneda_id` int(11) DEFAULT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.blog_posts: ~2 rows (aproximadamente)
DELETE FROM `blog_posts`;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `status`, `featured`, `created_at`, `updated_at`, `tags`, `published_date`, `moneda_id`, `precio`) VALUES
	(1, 1, 2, 'My First Blog Post', NULL, 'An example blog post', '<p>Matey yardarm topmast broadside nipper weigh anchor jack quarterdeck crow\'s nest rigging. Topgallant lateen sail line avast me gun Pirate Round strike colors bilge rat take a caulk. Jack six pounders spanker doubloon clipper spirits case shot hang the jib boatswain red ensign.</p>\r\n<p>Hornswaggle spanker spyglass Yellow Jack mutiny Arr lugger poop deck keel take a caulk. Quarter fire ship run a shot across the bow sheet log draft scallywag gally port skysail. Lugsail gangway draft pink piracy bilge Buccaneer heave to landlubber or just lubber Pieces of Eight.</p>', '["blog_posts\\\\December2018\\\\gVX2H38jgG7rV9ax1ZlW.png","blog_posts\\\\December2018\\\\FfT8kkLIzMsPE9krx2TZ.png"]', 'my-first-blog-post', 'A test blog post', 'PUBLISHED', 0, '2018-12-19 12:42:56', '2018-12-25 21:32:23', NULL, '2018-12-19 00:00:00', 2, 120000000),
	(2, 1, 1, 'My Second Blog Post', NULL, 'An example blog post', '<p>Matey yardarm topmast broadside nipper weigh anchor jack quarterdeck crow\'s nest rigging. Topgallant lateen sail line avast me gun Pirate Round strike colors bilge rat take a caulk. Jack six pounders spanker doubloon clipper spirits case shot hang the jib boatswain red ensign.</p>\r\n<p>Hornswaggle spanker spyglass Yellow Jack mutiny Arr lugger poop deck keel take a caulk. Quarter fire ship run a shot across the bow sheet log draft scallywag gally port skysail. Lugsail gangway draft pink piracy bilge Buccaneer heave to landlubber or just lubber Pieces of Eight.</p>', NULL, 'my-second-blog-post', 'A test blog post', 'PUBLISHED', 0, '2018-12-19 12:42:56', '2018-12-26 00:01:00', NULL, '2018-05-11 00:00:00', 1, 15000);
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.categories: ~2 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2018-12-19 12:42:57', '2018-12-19 12:42:57'),
	(2, NULL, 1, 'Category 2', 'category-2', '2018-12-19 12:42:57', '2018-12-19 12:42:57');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.data_rows: ~92 rows (aproximadamente)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, NULL, 12),
	(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(23, 4, 'author_id', 'select_dropdown', 'Author', 1, 0, 1, 1, 1, 1, '"{\\"default\\":\\"\\",\\"null\\":\\"\\",\\"options\\":{\\"\\":\\"-- None --\\"},\\"relationship\\":{\\"key\\":\\"id\\",\\"label\\":\\"name\\"}}"', 4),
	(24, 4, 'category_id', 'select_dropdown', 'Category', 0, 0, 1, 1, 1, 1, '"{\\"default\\":\\"\\",\\"null\\":\\"\\",\\"options\\":{\\"\\":\\"-- None --\\"},\\"relationship\\":{\\"key\\":\\"id\\",\\"label\\":\\"name\\"}}"', 2),
	(25, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '""', 1),
	(26, 4, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '""', 5),
	(27, 4, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '""', 6),
	(28, 4, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '""', 8),
	(29, 4, 'image', 'multiple_images', 'Post Image', 0, 1, 1, 1, 1, 1, '"{\\"resize\\":{\\"width\\":\\"1000\\",\\"height\\":\\"null\\"},\\"quality\\":\\"70%\\",\\"upsize\\":true,\\"thumbnails\\":[{\\"name\\":\\"medium\\",\\"scale\\":\\"50%\\"},{\\"name\\":\\"small\\",\\"scale\\":\\"25%\\"},{\\"name\\":\\"cropped\\",\\"crop\\":{\\"width\\":\\"300\\",\\"height\\":\\"250\\"}}]}"', 9),
	(30, 4, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '"{\\"slugify\\":{\\"origin\\":\\"title\\",\\"forceUpdate\\":true},\\"validation\\":{\\"rule\\":\\"unique:blog_posts,slug\\"}}"', 10),
	(31, 4, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '""', 11),
	(32, 4, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"PUBLISHED","DRAFT":"DRAFT","PENDING":"PENDING"}}', 12),
	(33, 4, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '""', 13),
	(34, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '""', 15),
	(35, 4, 'tags', 'text_area', 'Tags', 0, 0, 1, 1, 1, 1, '""', 16),
	(36, 4, 'published_date', 'timestamp', 'Published Date', 0, 1, 1, 1, 1, 1, '"{\\"format\\":\\"%Y-%m-%d\\",\\"validation\\":{\\"rules\\":[\\"required_if:status:PUBLISHED\\",\\"date_format:YYYY-MM-DD\\"]}}"', 17),
	(37, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '""', 1),
	(38, 5, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '"{\\"default\\":\\"\\",\\"null\\":\\"\\",\\"options\\":{\\"\\":\\"-- None --\\"},\\"relationship\\":{\\"key\\":\\"id\\",\\"label\\":\\"name\\"}}"', 2),
	(39, 5, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '"{\\"default\\":1}"', 3),
	(40, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '""', 4),
	(41, 5, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '"{\\"slugify\\":{\\"origin\\":\\"name\\"}}"', 5),
	(42, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '""', 6),
	(43, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '""', 7),
	(44, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '""', 1),
	(45, 6, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '""', 2),
	(46, 6, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '""', 3),
	(47, 6, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '""', 4),
	(48, 6, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '""', 5),
	(49, 6, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '"{\\"slugify\\":{\\"origin\\":\\"title\\"},\\"validation\\":{\\"rule\\":\\"unique:pages,slug\\"}}"', 6),
	(50, 6, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '""', 7),
	(51, 6, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '"{\\"default\\":\\"INACTIVE\\",\\"options\\":{\\"INACTIVE\\":\\"INACTIVE\\",\\"ACTIVE\\":\\"ACTIVE\\"}}"', 9),
	(52, 6, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '""', 10),
	(53, 6, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '""', 11),
	(54, 6, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '""', 12),
	(55, 7, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '""', 1),
	(56, 7, 'mailto', 'text', 'mailto', 1, 1, 1, 1, 1, 1, '""', 2),
	(57, 7, 'hook', 'text', 'hook', 1, 1, 1, 1, 1, 1, '""', 3),
	(58, 7, 'layout', 'text', 'layout', 1, 1, 1, 1, 1, 1, '""', 4),
	(59, 7, 'email_template', 'text', 'email_template', 1, 1, 1, 1, 1, 1, '""', 5),
	(60, 7, 'message_success', 'text', 'message_success', 1, 1, 1, 1, 1, 1, '""', 6),
	(61, 7, 'created_at', 'text', 'created_at', 1, 1, 1, 1, 1, 1, '""', 7),
	(62, 7, 'updated_at', 'text', 'updated_at', 1, 1, 1, 1, 1, 1, '""', 8),
	(63, 9, 'form_id', 'text', 'form_id', 1, 1, 1, 1, 1, 1, '""', 1),
	(64, 9, 'mailto', 'text', 'mailto', 1, 1, 1, 1, 1, 1, '""', 3),
	(65, 9, 'ip_address', 'text', 'ip_address', 1, 1, 1, 1, 1, 1, '""', 4),
	(66, 9, 'created_at', 'text', 'created_at', 1, 1, 1, 1, 1, 1, '""', 5),
	(67, 9, 'updated_at', 'text', 'updated_at', 1, 1, 1, 1, 1, 1, '""', 6),
	(68, 4, 'blog_post_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{"model":"Pvtl\\\\VoyagerBlog\\\\Category","table":"categories","type":"belongsTo","column":"category_id","key":"id","label":"name","pivot_table":"blog_posts","pivot":"0","taggable":"0"}', 3),
	(69, 4, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 7),
	(70, 4, 'featured', 'text', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 14),
	(71, 10, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(72, 10, 'Publicado', 'select_dropdown', 'Publicado', 1, 1, 1, 1, 1, 1, '{"default":"BORRADOR","options":{"PUBLICADO":"PUBLICADO","BORRADOR":"BORRADOR","PENDIENTE":"PENDIENTE"}}', 2),
	(73, 10, 'Titulo', 'rich_text_box', 'Titulo', 1, 1, 1, 1, 1, 1, '{}', 3),
	(74, 10, 'Imagenes', 'multiple_images', 'Imagenes', 1, 1, 1, 1, 1, 1, '"{\\"resize\\":{\\"width\\":\\"1000\\",\\"height\\":\\"null\\"},\\"quality\\":\\"70%\\",\\"upsize\\":true,\\"thumbnails\\":[{\\"name\\":\\"medium\\",\\"scale\\":\\"50%\\"},{\\"name\\":\\"small\\",\\"scale\\":\\"25%\\"},{\\"name\\":\\"cropped\\",\\"crop\\":{\\"width\\":\\"300\\",\\"height\\":\\"250\\"}}]}"', 4),
	(75, 10, 'tipooperacion_id', 'select_dropdown', 'Tipo Operación', 1, 1, 1, 1, 1, 1, '{}', 5),
	(76, 10, 'tipopropiedad_id', 'select_dropdown', 'Tipo Propiedad', 1, 1, 1, 1, 1, 1, '{}', 6),
	(77, 10, 'precio', 'number', 'Precio', 1, 1, 1, 1, 1, 1, '{}', 7),
	(78, 10, 'moneda_id', 'select_dropdown', 'Moneda', 1, 1, 1, 1, 1, 1, '{}', 9),
	(79, 10, 'barrio_propiedad_id', 'select_dropdown', 'Barrio', 1, 1, 1, 1, 1, 1, '{}', 10),
	(80, 10, 'localidad_propiedad_id', 'select_dropdown', 'Localidad', 1, 1, 1, 1, 1, 1, '{}', 11),
	(81, 10, 'provincia_propiedad_id', 'select_dropdown', 'Provincia', 1, 1, 1, 1, 1, 1, '{}', 12),
	(82, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
	(83, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
	(84, 11, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(85, 11, 'simbolo', 'text', 'Simbolo', 1, 1, 1, 1, 1, 1, '{}', 2),
	(86, 11, 'icono', 'image', 'Icono', 1, 1, 1, 1, 1, 1, '{}', 3),
	(87, 11, 'valor', 'number', 'Valor', 1, 1, 1, 1, 1, 1, '{}', 4),
	(88, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(89, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(90, 10, 'propiedad_belongsto_moneda_relationship', 'relationship', 'monedas', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Moneda","table":"monedas","type":"belongsTo","column":"moneda_id","key":"id","label":"simbolo","pivot_table":"blog_posts","pivot":"0","taggable":"0"}', 8),
	(91, 4, 'blog_post_belongsto_moneda_relationship', 'relationship', 'monedas', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Moneda","table":"monedas","type":"belongsTo","column":"moneda_id","key":"id","label":"simbolo","pivot_table":"blog_posts","pivot":"0","taggable":"0"}', 18),
	(92, 4, 'moneda_id', 'text', 'Moneda Id', 0, 1, 1, 1, 1, 1, '{}', 17),
	(93, 4, 'precio', 'number', 'Precio', 1, 1, 1, 1, 1, 1, '{}', 18);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.data_types: ~11 rows (aproximadamente)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-12-19 12:37:04', '2018-12-19 12:37:04'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-12-19 12:37:04', '2018-12-19 12:37:04'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-12-19 12:37:04', '2018-12-19 12:37:04'),
	(4, 'blog_posts', 'blog_posts', 'Blog Post', 'Blog Posts', 'voyager-news', 'Pvtl\\VoyagerFrontend\\BlogPost', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PostController', NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-12-19 12:42:53', '2018-12-25 21:31:21'),
	(5, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'Pvtl\\VoyagerBlog\\Category', NULL, '\\TCG\\Voyager\\Http\\Controllers\\VoyagerBaseController', '', 1, 0, NULL, '2018-12-19 12:42:56', '2018-12-19 12:42:56'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'Pvtl\\VoyagerFrontend\\Page', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PageController', '', 1, 0, NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:03'),
	(7, 'forms', 'forms', 'Form', 'Forms', 'voyager-documentation', 'Pvtl\\VoyagerForms\\Form', NULL, '\\Pvtl\\VoyagerForms\\Http\\Controllers\\FormController', NULL, 1, 0, NULL, '2018-12-19 16:53:17', '2018-12-19 16:53:17'),
	(8, 'inputs', 'inputs', 'Input', 'Inputs', 'voyager-documentation', 'Pvtl\\VoyagerForms\\FormInput', NULL, '\\Pvtl\\VoyagerForms\\Http\\Controllers\\InputController', NULL, 1, 0, NULL, '2018-12-19 16:53:18', '2018-12-19 16:53:18'),
	(9, 'enquiries', 'enquiries', 'Enquiry', 'Enquiries', 'voyager-mail', 'Pvtl\\VoyagerForms\\Enquiry', NULL, '\\Pvtl\\VoyagerForms\\Http\\Controllers\\EnquiryController', NULL, 1, 1, NULL, '2018-12-19 16:53:19', '2018-12-19 16:53:19'),
	(10, 'propiedads', 'propiedads', 'Propiedad', 'Propiedads', NULL, 'App\\Propiedad', NULL, '\\App\\Http\\Controllers\\PropiedadController', NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-12-24 22:21:21', '2018-12-24 23:38:40'),
	(11, 'monedas', 'monedas', 'Moneda', 'Monedas', NULL, 'App\\Moneda', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-12-24 22:28:30', '2018-12-24 22:28:30');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.enquiries
CREATE TABLE IF NOT EXISTS `enquiries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailto` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.enquiries: ~0 rows (aproximadamente)
DELETE FROM `enquiries`;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.forms
CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailto` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `email_template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `message_success` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.forms: ~0 rows (aproximadamente)
DELETE FROM `forms`;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` (`id`, `title`, `mailto`, `hook`, `layout`, `email_template`, `message_success`, `created_at`, `updated_at`) VALUES
	(1, 'Contact Us', 's:0:"";', NULL, 'default', 'default', 'Success! Thanks for your enquiry.', '2018-12-19 16:53:39', '2018-12-19 16:53:39');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.form_inputs
CREATE TABLE IF NOT EXISTS `form_inputs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('text','number','email','text_area','checkbox','select','radio') COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 10000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.form_inputs: ~4 rows (aproximadamente)
DELETE FROM `form_inputs`;
/*!40000 ALTER TABLE `form_inputs` DISABLE KEYS */;
INSERT INTO `form_inputs` (`id`, `form_id`, `label`, `class`, `type`, `options`, `required`, `order`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Name', NULL, 'text', NULL, 1, 10000, '2018-12-19 16:53:40', '2018-12-19 16:53:40'),
	(2, 1, 'Email', NULL, 'email', NULL, 1, 10000, '2018-12-19 16:53:41', '2018-12-19 16:53:41'),
	(3, 1, 'Phone', NULL, 'text', NULL, 1, 10000, '2018-12-19 16:53:43', '2018-12-19 16:53:43'),
	(4, 1, 'Message', NULL, 'text_area', NULL, 1, 10000, '2018-12-19 16:53:45', '2018-12-19 16:53:45');
/*!40000 ALTER TABLE `form_inputs` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.menus: ~3 rows (aproximadamente)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2018-12-19 12:37:05', '2018-12-19 12:37:05'),
	(2, 'primary', '2018-12-19 12:43:03', '2018-12-19 12:43:03'),
	(3, 'social', '2018-12-19 12:43:04', '2018-12-19 12:43:04');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.menu_items: ~28 rows (aproximadamente)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-12-19 12:37:05', '2018-12-19 12:37:05', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2018-12-19 12:37:05', '2018-12-24 15:19:06', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-12-19 12:37:06', '2018-12-19 12:37:06', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-12-19 12:37:06', '2018-12-19 12:37:06', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-12-19 12:37:06', '2018-12-24 15:19:42', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-12-19 12:37:06', '2018-12-24 15:19:06', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-12-19 12:37:06', '2018-12-24 15:19:06', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-12-19 12:37:06', '2018-12-24 15:19:06', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-12-19 12:37:06', '2018-12-24 15:19:07', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2018-12-19 12:37:06', '2018-12-24 15:19:42', 'voyager.settings.index', NULL),
	(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-12-19 12:37:11', '2018-12-24 15:19:07', 'voyager.hooks', NULL),
	(12, NULL, 'Blog', '/blog', '_self', NULL, '#000000', NULL, 3, '2018-12-19 12:42:55', '2018-12-19 12:42:55', NULL, NULL),
	(13, 1, 'Propiedades', '', '_self', 'voyager-company', '#000000', NULL, 5, '2018-12-19 12:42:55', '2018-12-24 15:18:31', NULL, ''),
	(14, 1, 'Posts', '', '_self', 'voyager-home', '#000000', 13, 1, '2018-12-19 12:42:56', '2018-12-24 15:19:01', 'voyager.blog_posts.index', 'null'),
	(15, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 6, '2018-12-19 12:42:56', '2018-12-24 15:19:42', 'voyager.categories.index', NULL),
	(16, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2018-12-19 12:43:01', '2018-12-24 15:19:42', 'voyager.pages.index', NULL),
	(17, 2, 'Home', '/home', '_self', '', NULL, NULL, 1, '2018-12-19 12:43:03', '2018-12-19 12:43:03', NULL, NULL),
	(18, 2, 'About', '/about', '_self', '', NULL, NULL, 2, '2018-12-19 12:43:03', '2018-12-19 12:43:03', NULL, NULL),
	(19, 2, 'Contact', '/contact', '_self', '', NULL, NULL, 3, '2018-12-19 12:43:03', '2018-12-19 12:43:03', NULL, NULL),
	(20, 3, 'Facebook', 'https://www.facebook.com/wearepvtl', '_blank', 'fa-facebook-square', NULL, NULL, 1, '2018-12-19 12:43:04', '2018-12-19 12:43:04', NULL, NULL),
	(21, 3, 'Twitter', 'https://twitter.com/wearepvtl', '_blank', 'fa-twitter-square', NULL, NULL, 2, '2018-12-19 12:43:04', '2018-12-19 12:43:04', NULL, NULL),
	(22, 3, 'Instagram', 'https://www.instagram.com/wearepvtl/', '_blank', 'fa-instagram', NULL, NULL, 3, '2018-12-19 12:43:04', '2018-12-19 12:43:04', NULL, NULL),
	(23, 3, 'Google+', 'https://plus.google.com/100970850483584616344', '_blank', 'fa-google-plus-square', NULL, NULL, 4, '2018-12-19 12:43:04', '2018-12-19 12:43:04', NULL, NULL),
	(24, 3, 'LinkedIn', 'https://www.linkedin.com/company/pivotal-agency', '_blank', 'fa-linkedin', NULL, NULL, 5, '2018-12-19 12:43:04', '2018-12-19 12:43:04', NULL, NULL),
	(25, 2, 'Propiedades', '/propiedades', '_self', NULL, '#000000', NULL, 4, '2018-12-19 15:10:48', '2018-12-24 23:35:39', NULL, ''),
	(26, 1, 'Forms', '', '_self', 'voyager-documentation', NULL, NULL, 8, '2018-12-19 16:53:15', '2018-12-24 15:19:42', 'voyager.forms.index', NULL),
	(27, 1, 'Form Management', '', '_self', 'voyager-documentation', NULL, 26, 1, '2018-12-19 16:53:16', '2018-12-19 16:53:16', 'voyager.forms.index', NULL),
	(28, 1, 'Enquiries', '', '_self', 'voyager-mail', NULL, 26, 2, '2018-12-19 16:53:17', '2018-12-19 16:53:17', 'voyager.enquiries.index', NULL),
	(29, 1, 'Propiedads', '', '_self', NULL, NULL, NULL, 16, '2018-12-24 22:21:23', '2018-12-24 22:21:23', 'voyager.propiedads.index', NULL),
	(30, 1, 'Monedas', '', '_self', NULL, NULL, NULL, 17, '2018-12-24 22:28:30', '2018-12-24 22:28:30', 'voyager.monedas.index', NULL),
	(31, 2, 'propiedads', 'propiedads', '_self', NULL, '#000000', NULL, 5, '2018-12-24 23:35:07', '2018-12-24 23:35:40', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.migrations: ~31 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2018_04_18_000000_create_blog_posts_table', 2),
	(24, '2018_04_18_000000_create_pages_table', 2),
	(25, '2018_04_19_224316_add_fields_to_pages_table', 2),
	(26, '2018_05_09_000000_create_categories_table', 2),
	(27, '2018_05_11_000000_remove_blog_keywords_field', 2),
	(28, '2018_05_11_000001_remove_pages_keywords_field', 2),
	(29, '2018_03_14_230522_create_forms_table', 3),
	(30, '2018_03_14_235919_create_form_inputs_table', 3),
	(31, '2018_03_15_053024_create_enquiries_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.monedas
CREATE TABLE IF NOT EXISTS `monedas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `simbolo` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.monedas: ~2 rows (aproximadamente)
DELETE FROM `monedas`;
/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` (`id`, `simbolo`, `icono`, `valor`, `created_at`, `updated_at`) VALUES
	(1, 'USD', 'monedas\\December2018\\7qBy7U4etr0iCZKFESMi.png', 17, '2018-12-24 22:35:44', '2018-12-24 22:35:44'),
	(2, 'ARS', 'monedas\\December2018\\PQVPb97LjjwzOWXP2UkA.png', 1, '2018-12-24 22:37:18', '2018-12-24 22:37:18');
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.pages: ~3 rows (aproximadamente)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `status`, `created_at`, `updated_at`, `layout`) VALUES
	(1, 1, 'Home', 'This is the excerpt for the Lorem Ipsum Page', '<p>&nbsp;</p>\r\n<h3 class="text-center">This is the body of the lorem ipsum page</h3>\r\n<p class="text-center">This is the body of the lorem ipsum page</p>\r\n<p>&nbsp;</p>', 'pages\\December2018\\Mg0lpN9ZDPvuc0c02Qtz.png', 'home', 'This is the meta description', 'ACTIVE', '2018-12-19 12:43:03', '2018-12-22 15:13:31', NULL),
	(2, 0, 'About', 'This is the excerpt for the Lorem Ipsum Page', '<p><br /></p><h3 class="text-center">This is the body of the lorem ipsum page</h3><p class="text-center">This is the body of the lorem ipsum page</p><p><br /></p>', 'posts/post2.jpg', 'about', 'This is the meta description for about', 'ACTIVE', '2018-12-19 12:43:03', '2018-12-19 12:43:03', NULL),
	(3, 1, 'Contact', 'This is the excerpt for the Lorem Ipsum Page', '<p>{!! forms(1) !!}</p>\r\n<h3 class="text-center">This is the body of the lorem ipsum page</h3>\r\n<p class="text-center">This is the body of the lorem ipsum page</p>\r\n<p>&nbsp;</p>', 'pages\\December2018\\dPQMMpAf1a4ejSd2RYnC.png', 'contact', 'This is the meta description for contact', 'ACTIVE', '2018-12-19 12:43:03', '2018-12-22 15:10:01', NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.permissions: ~72 rows (aproximadamente)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2018-12-19 12:37:06', '2018-12-19 12:37:06'),
	(2, 'browse_bread', NULL, '2018-12-19 12:37:06', '2018-12-19 12:37:06'),
	(3, 'browse_database', NULL, '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(4, 'browse_media', NULL, '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(5, 'browse_compass', NULL, '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(6, 'browse_menus', 'menus', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(7, 'read_menus', 'menus', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(8, 'edit_menus', 'menus', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(9, 'add_menus', 'menus', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(10, 'delete_menus', 'menus', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(11, 'browse_roles', 'roles', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(12, 'read_roles', 'roles', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(13, 'edit_roles', 'roles', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(14, 'add_roles', 'roles', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(15, 'delete_roles', 'roles', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(16, 'browse_users', 'users', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(17, 'read_users', 'users', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(18, 'edit_users', 'users', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(19, 'add_users', 'users', '2018-12-19 12:37:07', '2018-12-19 12:37:07'),
	(20, 'delete_users', 'users', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(21, 'browse_settings', 'settings', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(22, 'read_settings', 'settings', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(23, 'edit_settings', 'settings', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(24, 'add_settings', 'settings', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(25, 'delete_settings', 'settings', '2018-12-19 12:37:08', '2018-12-19 12:37:08'),
	(26, 'browse_hooks', NULL, '2018-12-19 12:37:11', '2018-12-19 12:37:11'),
	(27, 'browse_blog_posts', NULL, '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(28, 'read_blog_posts', NULL, '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(29, 'edit_blog_posts', NULL, '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(30, 'add_blog_posts', NULL, '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(31, 'delete_blog_posts', NULL, '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(32, 'browse_blog_posts', 'blog_posts', '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(33, 'read_blog_posts', 'blog_posts', '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(34, 'edit_blog_posts', 'blog_posts', '2018-12-19 12:42:54', '2018-12-19 12:42:54'),
	(35, 'add_blog_posts', 'blog_posts', '2018-12-19 12:42:55', '2018-12-19 12:42:55'),
	(36, 'delete_blog_posts', 'blog_posts', '2018-12-19 12:42:55', '2018-12-19 12:42:55'),
	(37, 'browse_categories', 'categories', '2018-12-19 12:42:56', '2018-12-19 12:42:56'),
	(38, 'read_categories', 'categories', '2018-12-19 12:42:56', '2018-12-19 12:42:56'),
	(39, 'edit_categories', 'categories', '2018-12-19 12:42:57', '2018-12-19 12:42:57'),
	(40, 'add_categories', 'categories', '2018-12-19 12:42:57', '2018-12-19 12:42:57'),
	(41, 'delete_categories', 'categories', '2018-12-19 12:42:57', '2018-12-19 12:42:57'),
	(42, 'browse_pages', NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(43, 'read_pages', NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(44, 'edit_pages', NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(45, 'add_pages', NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(46, 'delete_pages', NULL, '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(47, 'browse_pages', 'pages', '2018-12-19 12:43:01', '2018-12-19 12:43:01'),
	(48, 'read_pages', 'pages', '2018-12-19 12:43:02', '2018-12-19 12:43:02'),
	(49, 'edit_pages', 'pages', '2018-12-19 12:43:02', '2018-12-19 12:43:02'),
	(50, 'add_pages', 'pages', '2018-12-19 12:43:02', '2018-12-19 12:43:02'),
	(51, 'delete_pages', 'pages', '2018-12-19 12:43:02', '2018-12-19 12:43:02'),
	(52, 'browse_forms', 'forms', '2018-12-19 16:53:27', '2018-12-19 16:53:27'),
	(53, 'edit_forms', 'forms', '2018-12-19 16:53:27', '2018-12-19 16:53:27'),
	(54, 'add_forms', 'forms', '2018-12-19 16:53:28', '2018-12-19 16:53:28'),
	(55, 'delete_forms', 'forms', '2018-12-19 16:53:29', '2018-12-19 16:53:29'),
	(56, 'browse_inputs', 'form_inputs', '2018-12-19 16:53:30', '2018-12-19 16:53:30'),
	(57, 'read_inputs', 'form_inputs', '2018-12-19 16:53:30', '2018-12-19 16:53:30'),
	(58, 'edit_inputs', 'form_inputs', '2018-12-19 16:53:31', '2018-12-19 16:53:31'),
	(59, 'add_inputs', 'form_inputs', '2018-12-19 16:53:32', '2018-12-19 16:53:32'),
	(60, 'delete_inputs', 'form_inputs', '2018-12-19 16:53:32', '2018-12-19 16:53:32'),
	(61, 'browse_enquiries', 'enquiries', '2018-12-19 16:53:33', '2018-12-19 16:53:33'),
	(62, 'read_enquiries', 'enquiries', '2018-12-19 16:53:34', '2018-12-19 16:53:34'),
	(63, 'delete_enquiries', 'enquiries', '2018-12-19 16:53:34', '2018-12-19 16:53:34'),
	(64, 'browse_propiedads', 'propiedads', '2018-12-24 22:21:22', '2018-12-24 22:21:22'),
	(65, 'read_propiedads', 'propiedads', '2018-12-24 22:21:22', '2018-12-24 22:21:22'),
	(66, 'edit_propiedads', 'propiedads', '2018-12-24 22:21:22', '2018-12-24 22:21:22'),
	(67, 'add_propiedads', 'propiedads', '2018-12-24 22:21:22', '2018-12-24 22:21:22'),
	(68, 'delete_propiedads', 'propiedads', '2018-12-24 22:21:23', '2018-12-24 22:21:23'),
	(69, 'browse_monedas', 'monedas', '2018-12-24 22:28:30', '2018-12-24 22:28:30'),
	(70, 'read_monedas', 'monedas', '2018-12-24 22:28:30', '2018-12-24 22:28:30'),
	(71, 'edit_monedas', 'monedas', '2018-12-24 22:28:30', '2018-12-24 22:28:30'),
	(72, 'add_monedas', 'monedas', '2018-12-24 22:28:30', '2018-12-24 22:28:30'),
	(73, 'delete_monedas', 'monedas', '2018-12-24 22:28:30', '2018-12-24 22:28:30');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.permission_role: ~73 rows (aproximadamente)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.propiedads
CREATE TABLE IF NOT EXISTS `propiedads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Publicado` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Imagenes` int(11) NOT NULL,
  `tipooperacion_id` int(11) NOT NULL,
  `tipopropiedad_id` int(11) NOT NULL,
  `precio` double NOT NULL,
  `moneda_id` int(11) NOT NULL,
  `barrio_propiedad_id` int(11) NOT NULL,
  `localidad_propiedad_id` int(11) NOT NULL,
  `provincia_propiedad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.propiedads: ~0 rows (aproximadamente)
DELETE FROM `propiedads`;
/*!40000 ALTER TABLE `propiedads` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedads` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.roles: ~2 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2018-12-19 12:37:06', '2018-12-19 12:37:06'),
	(2, 'user', 'Normal User', '2018-12-19 12:37:06', '2018-12-19 12:37:06');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.settings: ~14 rows (aproximadamente)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', 'settings\\December2018\\uKSlKC79it4Ivbii5Mbd.png', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
	(11, 'forms.default_to_email', 'Default Enquiry To Email', 'voyager.forms@mailinator.com', 'The default email address to send form enquiries to', 'text', 1, 'Forms'),
	(12, 'forms.default_from_email', 'Default Enquiry From Email', 'voyager.forms@mailinator.com', 'The default email address to use as the sender address for form enquiries', 'text', 2, 'Forms'),
	(13, 'admin.google_recaptcha_site_key', 'Google reCAPTCHA Site Key (public)', NULL, 'This key can be found in your Google reCAPTCHA console', 'text', 1, 'Admin'),
	(14, 'admin.google_recaptcha_secret_key', 'Google reCAPTCHA Secret Key', NULL, 'This key can be found in your Google reCAPTCHA console', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.translations: ~0 rows (aproximadamente)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'admin', 'admin@speednova.com', 'users\\December2018\\aWlVYLNZr082QdlQ7cmN.png', NULL, '$2y$10$ZcVO0Wqs8jC0om.bz1jmou1UIm55j.IHjCfxi5WzGh0/tBfU6DNs6', NULL, '{"locale":"es"}', '2018-12-19 12:37:54', '2018-12-19 14:53:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla inmob.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla inmob.user_roles: ~0 rows (aproximadamente)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
