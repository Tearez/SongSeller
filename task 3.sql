/* THIRD TASK */
SELECT groups.name AS Artist, COUNT(songs.id) AS songs, SUM(songs.duration) AS total_duration
FROM groups
JOIN songs ON groups.id IN (
	SELECT group_id
	FROM song_info
	WHERE song_id = songs.id)
GROUP by groups.name
HAVING songs > 1
ORDER BY songs DESC;