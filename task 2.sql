/* SECOND TASK */
SELECT groups.name AS Artist, songs.title AS Song, songs.duration AS Duration
FROM groups
JOIN songs ON groups.id IN (
	SELECT group_id
	FROM song_info
	WHERE song_id = songs.id)
WHERE groups.name LIKE '%Arctic Monkeys%'
ORDER BY songs.title;