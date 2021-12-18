# Run this on the wordpress database

CREATE TABLE `wp_twinings` (
  `academy_1` bigint(20) DEFAULT NULL,
  `academy_2` bigint(20) DEFAULT NULL,
  approved boolean,
  PRIMARY KEY (academy_1, academy_2)
)
