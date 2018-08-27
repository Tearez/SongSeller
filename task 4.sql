/* FOURTH TASK - INNER JOIN */
SELECT composers.name AS Composer, songs.title AS songTitle, songs.duration AS Duration
FROM composers
INNER JOIN song_info ON composers.id = song_info.composer_id
INNER JOIN songs ON songs.id = song_info.song_id
INNER JOIN groups ON groups.id = song_info.group_id
INNER JOIN artists ON artists.group_id = groups.id
WHERE composers.name = artists.name
ORDER BY Composer ASC;

/* FOURTH TASK - LEFT OUTER JOIN */
SELECT composers.name AS Composer_Name, songs.title AS Song_Title
FROM composers
LEFT JOIN songs ON composers.id IN (
	SELECT composer_id
	FROM song_info
	WHERE song_id = songs.id);
