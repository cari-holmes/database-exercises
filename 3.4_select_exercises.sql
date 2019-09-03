USE albums_db;

SELECT * FROM albums WHERE artist='Pink Floyd';

SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT * FROM albums WHERE release_date >= 1990 AND release_date < 2000;

SELECT * FROM albums WHERE sales < 20;

SELECT * FROM albums WHERE genre = 'rock';
SELECT * FROM albums WHERE genre ='Progressive rock';
SELECT * FROM albums WHERE genre = 'Hard rock';
-- Hard rock and Progressive rock are in a different category, we are searching very specifically for 'Rock'