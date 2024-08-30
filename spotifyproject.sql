create database spotify;
use spotify;
CREATE TABLE Users (
    user_id int PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (user_id, username, email, date_of_birth)
VALUES
(1, 'alice_jones', 'alice.jones@example.com', '1988-03-12'),
(2, 'bob_smith', 'bob.smith@example.com', '1995-07-24'),
(3, 'charlie_brown', 'charlie.brown@example.com', '1990-11-05'),
(4, 'diana_prince', 'diana.prince@example.com', '1992-02-17'),
(5, 'edward_cullen', 'edward.cullen@example.com', '1993-06-20'),
(6, 'fiona_apple', 'fiona.apple@example.com', '1985-12-09'),
(7, 'george_clark', 'george.clark@example.com', '1997-04-21'),
(8, 'hannah_white', 'hannah.white@example.com', '1991-09-15'),
(9, 'ian_black', 'ian.black@example.com', '1989-01-30'),
(10, 'jessica_green', 'jessica.green@example.com', '1996-08-11'),
(11, 'kevin_brown', 'kevin.brown@example.com', '1994-10-02'),
(12, 'lisa_miller', 'lisa.miller@example.com', '1993-05-22'),
(13, 'michael_jordan', 'michael.jordan@example.com', '1987-07-13'),
(14, 'natalie_portman', 'natalie.portman@example.com', '1998-11-26'),
(15, 'oliver_stone', 'oliver.stone@example.com', '1992-04-05');

select*from users;

CREATE TABLE Artists (
    artist_id int PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50)
);


INSERT INTO Artists (artist_id, artist_name, genre)
VALUES
(1, 'The Beatles', 'Rock'),
(2, 'Beyoncé', 'Pop'),
(3, 'Drake', 'Hip-Hop'),
(4, 'Adele', 'Soul'),
(5, 'Taylor Swift', 'Country'),
(6, 'Ed Sheeran', 'Pop'),
(7, 'Kendrick Lamar', 'Hip-Hop'),
(8, 'Radiohead', 'Alternative Rock'),
(9, 'Billie Eilish', 'Pop'),
(10, 'Eminem', 'Rap'),
(11, 'Ariana Grande', 'Pop'),
(12, 'Coldplay', 'Alternative Rock'),
(13, 'Bruno Mars', 'Funk'),
(14, 'Kanye West', 'Hip-Hop'),
(15, 'Elton John', 'Pop Rock');

select*from artists;

CREATE TABLE Albums (
    album_id int PRIMARY KEY,
    album_name VARCHAR(100) NOT NULL,
    release_date DATE,
    artist_id int,
    FOREIGN key (artist_id) REFERENCES Artists(artist_id)
);
desc albums;
use spotify;

INSERT INTO Albums (album_id, album_name, release_date, artist_id)
VALUES
(1, 'Abbey Road', '1969-09-26', 1),            
(2, 'Lemonade', '2016-04-23', 2),              
(3, 'Scorpion', '2018-06-29', 3),              
(4, '25', '2015-11-20', 4),                    
(5, '1989', '2014-10-27', 5),                  
(6, 'Divide', '2017-03-03', 6),                
(7, 'DAMN.', '2017-04-14', 7),                 
(8, 'OK Computer', '1997-05-21', 8),           
(9, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29', 9),
(10, 'The Eminem Show', '2002-05-26', 10),    
(11, 'Thank U, Next', '2019-02-08', 11),     
(12, 'A Rush of Blood to the Head', '2002-08-26', 12), 
(13, '24K Magic', '2016-11-18', 13),           
(14, 'The Life of Pablo', '2016-02-14', 14),   
(15, 'Goodbye Yellow Brick Road', '1973-10-05', 15);

select*from albums;


CREATE TABLE Songs (
    song_id int PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    duration INT NOT NULL, -- Duration in seconds
    album_id INT,
   foreign key(album_id) REFERENCES Albums(album_id),
    genre VARCHAR(50)
);

desc songs;
INSERT INTO Songs (song_id, song_name, duration, album_id, genre)
VALUES
(1, 'Come Together', 259, 1, 'Rock'),              
(2, 'Halo', 263, 2, 'Pop'),                         
(3, 'God\'s Plan', 198, 3, 'Hip-Hop'),               
(4, 'Hello', 295, 4, 'Soul'),                       
(5, 'Blank Space', 231, 5, 'Country'),             
(6, 'Shape of You', 233, 6, 'Pop'),                 
(7, 'HUMBLE.', 177, 7, 'Hip-Hop'),                  
(8, 'Paranoid Android', 330, 8, 'Alternative Rock'),
(9, 'Bad Guy', 194, 9, 'Pop'),                      
(10, 'Lose Yourself', 326, 10, 'Rap'),              
(11, '7 Rings', 179, 11, 'Pop'),                    
(12, 'Clocks', 307, 12, 'Alternative Rock'),        
(13, 'Uptown Funk', 269, 13, 'Funk'),             
(14, 'Gold Digger', 207, 14, 'Hip-Hop'),            
(15, 'Rocket Man', 341, 15, 'Pop Rock');      

select*from songs;

CREATE TABLE Playlists (
    playlist_id int PRIMARY KEY,
    playlist_name VARCHAR(100) NOT NULL,
    user_id INT,
    foreign key(user_id) REFERENCES Users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Playlists (playlist_id, playlist_name, user_id, created_at)
VALUES
(1, 'Rock Classics', 1, '2024-08-01 10:00:00'),         
(2, 'Top Hits 2024', 2, '2024-08-01 11:15:00'),        
(3, 'Chill Vibes', 3, '2024-08-02 14:30:00'),            
(4, 'Workout Mix', 4, '2024-08-03 09:45:00'),            
(5, 'Indie Gems', 5, '2024-08-04 16:00:00'),             
(6, 'Pop Favorites', 6, '2024-08-05 12:15:00'),          
(7, 'Hip-Hop Essentials', 7, '2024-08-06 08:30:00'),   
(8, 'Jazz Nights', 8, '2024-08-07 18:00:00'),           
(9, 'Electronic Beats', 9, '2024-08-08 20:15:00'),   
(10, 'Classic Rock', 10, '2024-08-09 15:45:00'),        
(11, 'Summer Hits', 11, '2024-08-10 11:00:00'),          
(12, 'Dinner Party', 12, '2024-08-11 19:30:00'),         
(13, 'Road Trip', 13, '2024-08-12 14:45:00'),            
(14, 'Cozy Winter', 14, '2024-08-13 09:15:00'),        
(15, 'Festival Favorites', 15, '2024-08-14 16:30:00'); 

select*from playlists;

CREATE TABLE PlaylistSongs (
    playlist_id INT,
    foreign key (playlist_id)REFERENCES Playlists(playlist_id),
    
    song_id INT,
  foreign key (song_id) REFERENCES Songs(song_id),
    PRIMARY KEY (playlist_id, song_id)
);


INSERT INTO PlaylistSongs (playlist_id, song_id)
VALUES
(1, 1), 
(1, 8),  
(2, 2), 
(2, 9),  
(3, 3),  
(3, 6),  
(4, 4),  
(4, 7), 
(5, 5),  
(5, 13),
(6, 10), 
(6, 11), 
(7, 7),  
(7, 14), 
(8, 12) ;

select*from PlaylistSongs ;
desc PlaylistSongs;

CREATE TABLE StreamingHistory (
    stream_id int PRIMARY KEY,
    user_id INT,
    foreign key(user_id)  REFERENCES Users(user_id),
    song_id INT,
    foreign key(song_id)REFERENCES Songs(song_id),
    stream_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
desc StreamingHistory;


INSERT INTO StreamingHistory (stream_id, user_id, song_id, stream_time)
VALUES
(1, 1, 1, '2024-08-01 10:05:00'),   
(2, 1, 8, '2024-08-01 10:15:00'),   
(3, 2, 2, '2024-08-01 11:20:00'),   
(4, 2, 9, '2024-08-01 11:30:00'),   
(5, 3, 3, '2024-08-02 14:35:00'),   
(6, 3, 6, '2024-08-02 14:50:00'),  
(7, 4, 4, '2024-08-03 09:50:00'),   
(8, 4, 7, '2024-08-03 10:05:00'),   
(9, 5, 5, '2024-08-04 16:05:00'),   
(10, 5, 13, '2024-08-04 16:20:00'), 
(11, 6, 10, '2024-08-05 12:20:00'), 
(12, 6, 11, '2024-08-05 12:35:00'), 
(13, 7, 7, '2024-08-06 08:35:00'),  
(14, 7, 14, '2024-08-06 08:50:00'), 
(15, 8, 12, '2024-08-07 18:15:00'); 
 select*from StreamingHistory;
 
 #1. List All Users
 USE SPOTIFY;
 select *from users;
 
 #2. To get playlists created by user_id = 1
 
 SELECT playlist_id, playlist_name, created_at
FROM Playlists
WHERE user_id = 1;

#3.To find users born on nov 11, 1990
SELECT * 
FROM Users
WHERE date_of_birth = '1990-11-05';

#4.To find users born on or after January 1, 1990
SELECT * 
FROM Users
WHERE date_of_birth >= '1990-01-01';

#5.To find playlists create after August 10, 2024

SELECT * 
FROM Playlists
WHERE created_at < '2024-08-10';
  
  
  #6.To find songs in the genre 'Pop'
  SELECT * 
FROM Songs
WHERE genre = 'Pop';
 
 
#7.To find songs with a duration between 250 and 300 seconds
SELECT * 
FROM Songs
WHERE duration BETWEEN 250 AND 300;

#8.To find the average duration of all songs
SELECT  AVG(duration) AS average_duration
FROM Songs;

#9.To find the maximum duration of any song
 SELECT MAX(duration) AS max_duration
FROM Songs;

#10.To find the minimum duration of any song
 SELECT MIN(duration) AS min_duration
FROM Songs;

#11.To get the total number of users
SELECT COUNT(*) AS total_users
FROM Users;

#12.to get the total number of songs in the database
SELECT COUNT(*) AS total_songs
FROM Songs;

#13.To get all users sorted alphabetically by their username
SELECT * 
FROM Users
ORDER BY username ASC;  

#14,To find all songs sorted by duration in descending order
SELECT * 
FROM Songs
ORDER BY duration DESC;

#15.To find songs in a specific album (e.g., album_id = 1) sorted alphabetically by song name

SELECT song_id, song_name, duration
FROM Songs
WHERE album_id = 1
ORDER BY song_name ASC;

#16.To count the number of songs in each genre
SELECT genre, COUNT(*) AS num_songs
FROM Songs
GROUP BY genre
ORDER BY num_songs DESC;


 #17.To find the number of users born on each date
 SELECT date_of_birth, COUNT(*) AS num_users
FROM Users
GROUP BY date_of_birth
ORDER BY date_of_birth;

#18.To find the average duration of songs in each genre
SELECT genre, AVG(duration) AS average_duration
FROM Songs
GROUP BY genre
ORDER BY average_duration DESC;

#19.To find the total duration of songs for each genre
SELECT genre, SUM(duration) AS total_duration
FROM Songs
GROUP BY genre
;
use spotify;
#20. to extract the month and year from a date
SELECT 
    EXTRACT(MONTH FROM release_date) AS month, 
    EXTRACT(YEAR FROM release_date) AS year
FROM 
   albums  ;  
#21.To count the number of songs in each album:
SELECT a.album_id, a.album_name, COUNT(s.song_id) AS num_songs
FROM Albums a
JOIN Songs s ON a.album_id = s.album_id
GROUP BY a.album_id, a.album_name
ORDER BY num_songs DESC;

#22.To find the number of streams per song, grouped by date of streaming
SELECT s.song_id, s.song_name, DATE(sh.stream_time) AS stream_date, COUNT(sh.stream_id) AS daily_streams
FROM Songs s
JOIN StreamingHistory sh ON s.song_id = sh.song_id
GROUP BY s.song_id, s.song_name, stream_date
ORDER BY stream_date DESC;

#22.To get a list of all songs along with their respective album names and artist names
SELECT s.song_id, s.song_name, a.album_name, ar.artist_name
FROM Songs s
INNER JOIN Albums a ON s.album_id = a.album_id
INNER JOIN Artists ar ON a.artist_id = ar.artist_id;

#23.To list all playlists along with the username of the user who created each playlist
SELECT p.playlist_id, p.playlist_name, u.username
FROM Playlists p
INNER JOIN Users u ON p.user_id = u.user_id;

#24.This query uses a LEFT JOIN to list all users, including those who haven’t created any playlists
SELECT u.user_id, u.username, p.playlist_name
FROM Users u
LEFT JOIN Playlists p ON u.user_id = p.user_id;

#25.This query lists all artists, including those who haven’t released any albums
SELECT ar.artist_id, ar.artist_name, a.album_name
FROM Artists ar
LEFT JOIN Albums a ON ar.artist_id = a.artist_id;

#26.This query lists all playlists, even if they are not associated with any user
SELECT p.playlist_id, p.playlist_name, u.username
FROM Users u
RIGHT JOIN Playlists p ON u.user_id = p.user_id;

#27.This query lists each artist with their most recent album release
SELECT artist_id, album_name, release_date
FROM Albums a
WHERE release_date = (
    SELECT MAX(release_date)
    FROM Albums
    WHERE artist_id = a.artist_id
);

#28.This query lists songs whose duration is longer than the average duration of all songs
SELECT song_name, duration
FROM Songs
WHERE duration > (SELECT AVG(duration) FROM Songs);





















