/* SIX TASK */
USE song_seller;
DROP PROCEDURE IF EXISTS CursorTask;
DELIMITER $$
CREATE PROCEDURE CursorTask()
BEGIN
DECLARE finished INT;
DECLARE tempGroupName VARCHAR(150);
DECLARE tempSongsCount INT;
DECLARE tempCanHaveAlbum VARCHAR(10);
DECLARE id INT;

DECLARE AlbumCursor CURSOR FOR
SELECT groups.name , COUNT(songs.title)
FROM groups
JOIN songs ON groups.id IN (
	SELECT group_id
    FROM song_info
    WHERE songs.id = song_info.song_id)
GROUP BY groups.id;

DECLARE CONTINUE handler FOR NOT FOUND SET finished =1;

SET finished = 0;
SET id = 0;

DROP TABLE IF EXISTS TempAlbumInfo;
CREATE TEMPORARY TABLE TempAlbumInfo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150),
    count INT,
    possible VARCHAR(10)
) ENGINE = Memory;

OPEN AlbumCursor;
songs_loop: WHILE(finished=0)
DO
FETCH AlbumCursor INTO tempGroupName, tempSongsCount;
IF(finished =0)
THEN
	SET id = id + 1;
ELSE
	LEAVE songs_loop;
END IF;
IF(tempSongsCount>11)
THEN
	SET tempCanHaveAlbum = 'YES';
	INSERT INTO TempAlbumInfo VALUES (id, tempGroupName, tempSongsCount, tempCanHaveAlbum);
ELSE
	SET tempCanHaveAlbum = 'NO';
	INSERT INTO TempAlbumInfo VALUES (id, tempGroupName, tempSongsCount, tempCanHaveAlbum);
 END IF;

 END WHILE;
 CLOSE AlbumCursor;
 SELECT * FROM tempAlbumInfo;
 DROP TABLE tempAlbumInfo;
 END
 $$
 DELIMITER ;
 
CALL CursorTask();