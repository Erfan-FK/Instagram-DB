WITH RECURSIVE suggestions(followed_id, follower_id, depth) AS (
		SELECT followed_id, follower_id, 1
		FROM followers WHERE followed_id = 1000
	UNION
		SELECT followed_id, follower_id, depth + 1
		FROM followers JOIN suggestions
		ON followers.follower_id = suggestions.followed_id
		WHERE depth < 3
)
SELECT DISTINCT users.username FROM users JOIN suggestions
ON users.id = suggestions.followed_id WHERE depth > 1 LIMIT 10;