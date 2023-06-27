-- View to merge caption_tags table and photo_tags table
CREATE VIEW tags AS(
	SELECT id, created_at, user_id, post_id, 
	'photo_tag' AS type FROM photo_tags
	UNION ALL
	SELECT id, created_at, user_id, post_id, 
	'caption_tag' AS type FROM caption_tags
);

-- Get the most popular users
SELECT username, COUNT(*) 
FROM users JOIN tags ON users.id = tags.user_id 
GROUP BY username ORDER BY COUNT(*) DESC;