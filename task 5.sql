/* FIFTH TASK */
SELECT composers.name AS Composer, Count(songs.id) AS Songs
FROM composers
JOIN song_info ON composers.id = song_info.composer_id
JOIN songs ON song_info.song_id = songs.id
GROUP BY composers.name
ORDER BY songs DESC;