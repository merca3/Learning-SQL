CREATE TABLE AppUser ( 
UserID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Username VARCHAR (50) NOT NULL, 
Email VARCHAR (50) NOT NULL, 
Password VARCHAR (255) NOT NULL, 
User_Avatar VARCHAR (max) NOT NULL, 
Ext_Login VARCHAR (50), 
Is_Blocked BIT NOT NULL) 

CREATE TABLE Role ( 
RoleID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Role_Name VARCHAR (20) NOT NULL) 

CREATE TABLE Genre ( 
GenreID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Genre_Name VARCHAR (50) NOT NULL) 

CREATE TABLE Link ( 
LinkID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Uri VARCHAR (255) NOT NULL, 
Source_Name VARCHAR (255)) 

CREATE TABLE UserRole ( 
RoleID INT NOT NULL, 
UserID INT NOT NULL, 
PRIMARY KEY CLUSTERED ( RoleID, UserID ), 
FOREIGN KEY ( RoleID ) REFERENCES [Role] ( RoleID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE, 
FOREIGN KEY ( UserID ) REFERENCES [AppUser] ( UserID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE) 

CREATE TABLE List ( 
ListID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
List_Name VARCHAR(50) NOT NULL, 
Is_Public BIT NOT NULL, 
UserID INT NOT NULL FOREIGN KEY REFERENCES AppUser(UserID)) 

CREATE TABLE Movie ( 
MovieID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Movie_Name VARCHAR (255) NOT NULL, 
Movie_Description TEXT NOT NULL, 
Director VARCHAR (255) NOT NULL, 
Year INT NOT NULL, 
Actors TEXT, 
Poster VARCHAR (max) NOT NULL,  
Thumbnail VARCHAR (max) NOT NULL,  
Rating FLOAT NULL, 
Region VARCHAR(50) NULL,  
LinkID INT FOREIGN KEY REFERENCES Link(LinkID)) 

CREATE TABLE Review ( 
ReviewID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Review_Text TEXT NOT NULL, 
Rating FLOAT NULL, 
Created_On DATETIME NOT NULL, 
UserID INT NOT NULL FOREIGN KEY REFERENCES AppUser(UserID), 
MovieID INT NOT NULL FOREIGN KEY REFERENCES Movie(MovieID)) 

CREATE TABLE UserMovie ( 
MovieID INT NOT NULL, 
UserID INT NOT NULL, 
Is_Watched BIT NOT NULL,
PRIMARY KEY CLUSTERED ( MovieID, UserID ), 
FOREIGN KEY ( MovieID ) REFERENCES [Movie] ( MovieID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE, 
FOREIGN KEY ( UserID ) REFERENCES [AppUser] ( UserID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE) 

CREATE TABLE MovieList ( 
MovieID INT NOT NULL, 
ListID INT NOT NULL, 
PRIMARY KEY CLUSTERED ( MovieID, ListID ), 
FOREIGN KEY ( MovieID ) REFERENCES [Movie] ( MovieID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE, 
FOREIGN KEY ( ListID ) REFERENCES [List] ( ListID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE) 

CREATE TABLE MovieGenre ( 
MovieID INT NOT NULL, 
GenreID INT NOT NULL, 
PRIMARY KEY CLUSTERED ( MovieID, GenreID ), 
FOREIGN KEY ( MovieID ) REFERENCES [Movie] ( MovieID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE, 
FOREIGN KEY ( GenreID ) REFERENCES [Genre] ( GenreID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE) 

CREATE TABLE GenreList ( 
ListID INT NOT NULL, 
GenreID INT NOT NULL, 
PRIMARY KEY CLUSTERED ( ListID, GenreID ), 
FOREIGN KEY ( ListID ) REFERENCES [List] ( ListID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE, 
FOREIGN KEY ( GenreID ) REFERENCES [Genre] ( GenreID ) ON UPDATE  NO ACTION  ON DELETE  CASCADE) 

CREATE TABLE Comment ( 
CommentID INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
Comment_Text TEXT NOT NULL, 
Created_On DATETIME NOT NULL, 
UserID INT NOT NULL FOREIGN KEY REFERENCES AppUser(UserID), 
ReviewID INT NOT NULL FOREIGN KEY REFERENCES Review(ReviewID)) 

-- Script for Genre table
INSERT INTO Genre VALUES ('Thriller'), ('Comedy'), ('Horror'), ('Crime'), ('Drama'), ('Romance'), 
('Action'), ('Adventure'), ('Animation'), ('Fantasy'), ('Sci-Fi'), ('Documentary') 

-- Script for AppUser table
-- User avatar images are hosted on the internet and stored in database as link. 
INSERT INTO AppUser VALUES  
('Alfred', 'abedlington0@yahoo.com', 'IQj8NcG7sP8', 'https://robohash.org/sitquoeius.png?size=50x50&set=set1', 'google', 0), 
('Riva', 'rperillo1@slideshare.net', 'mmqXoM', 'https://robohash.org/doloresnemoconsequuntur.png?size=50x50&set=set1', 'google', 0), 
('Allie', 'apauel2@dedecms.com', 'ywqoy18', 'https://robohash.org/doloribusdictarepellendus.png?size=50x50&set=set1', 'google', 0), 
('Gilberta', 'gstackbridge3@engadget.com', 'qDnFBFE', 'https://robohash.org/possimusdebitiscupiditate.png?size=50x50&set=set1', 'google', 0), 
('Hugues', 'harlett4@t-online.de', 'o5M5DTpK', 'https://robohash.org/sedquiat.png?size=50x50&set=set1', 'facebook', 0), 
('Catherine', 'cburleton5@bigcartel.com', 'eSKDK6sGanG', 'https://robohash.org/auterrorqui.png?size=50x50&set=set1', 'facebook', 0), 
('Maurise', 'mdupre6@facebook.com', 'CRpcF9', 'https://robohash.org/utquasiautem.png?size=50x50&set=set1', 'facebook', 1), 
('Dame', 'dhearons7@nifty.com', '8vjazP0iaiQ', 'https://robohash.org/istemodinihil.png?size=50x50&set=set1', 'facebook', 1), 
('Betti', 'bscutter8@dot.gov', 'QTVKlN', 'https://robohash.org/etquoaspernatur.png?size=50x50&set=set1', 'facebook', 0), 
('Lauretta', 'ledmund9@google.ca', 'PQOsSvOOn', 'https://robohash.org/undeautemqui.png?size=50x50&set=set1', 'facebook', 0), 
('Chance', 'cbortolussia@abc.net.au', 'sISJJem05E6', 'https://robohash.org/aliquidvoluptatevoluptatem.png?size=50x50&set=set1', 'facebook', 0), 
('Shae', 'sraikesb@tmall.com', 'Gb3C4uDf8', 'https://robohash.org/hicsimiliquevitae.png?size=50x50&set=set1', 'facebook', 0), 
('Marty', 'mrosenbladc@squidoo.com', 'JrSBRkbp', 'https://robohash.org/consecteturvelquidem.png?size=50x50&set=set1', 'facebook', 0), 
('Celestine', 'cpesseltd@jigsy.com', 't6xoAL', 'https://robohash.org/namutest.png?size=50x50&set=set1', 'facebook', 0), 
('Rosabel', 'rflanne@pbs.org', '9VNsrp', 'https://robohash.org/aliquamadipisciquod.png?size=50x50&set=set1', 'facebook', 0), 
('Gerhard', 'gleyf@squidoo.com', 'rGAK5cVr5', 'https://robohash.org/reprehenderitvoluptatumincidunt.png?size=50x50&set=set1', 'facebook', 0), 
('Piggy', 'pdriuttig@hibu.com', 'ndd88pZoix', 'https://robohash.org/eareiciendisquis.png?size=50x50&set=set1', 'google', 0), 
('Garv', 'gtohillh@cornell.edu', 'RaeOqmr9gX1t', 'https://robohash.org/quasiquiculpa.png?size=50x50&set=set1', 'google', 0), 
('Katharyn', 'klamasi@trellian.com', 'mHSQZT0BN', 'https://robohash.org/quaefugain.png?size=50x50&set=set1', 'google', 0), 
('Dael', 'dtynewellj@edublogs.org', 'X3KysMXt2q', 'https://robohash.org/veroilloexcepturi.png?size=50x50&set=set1', 'google', 0), 
('Beverlee', 'bovizek@earthlink.net', 'TQ2cm7Udrd0t', 'https://robohash.org/suscipitenimab.png?size=50x50&set=set1', 'google', 0), 
('Ramsey', 'ragnolol@cargocollective.com', 'OFNIp0fRMcU', 'https://robohash.org/utharumerror.png?size=50x50&set=set1', 'google', 0), 
('Orelle', 'omishawm@microsoft.com', 'OQNcGlv2Tn', 'https://robohash.org/ettotamdolorem.png?size=50x50&set=set1', 'google', 1), 
('Luise', 'lshermen@trellian.com', 'Vez04lXYRYy', 'https://robohash.org/quasinobisqui.png?size=50x50&set=set1', 'google', 1), 
('Darrel', 'dgoffo@shareasale.com', '2FK9FB8p9Xq', 'https://robohash.org/dictavoluptasdolorem.png?size=50x50&set=set1', 'google', 0), 
('Caesar', 'cdonsonp@t.co', 'h6o2B8N', 'https://robohash.org/delectusdoloremvoluptates.png?size=50x50&set=set1', 'google', 0), 
('Barri', 'bwoolstenholmesq@studiopress.com', 'uwCZoanyDYO1', 'https://robohash.org/ineiusullam.png?size=50x50&set=set1', null, 0), 
('Onfre', 'otanfieldr@nsw.gov.au', 'myyfc1', 'https://robohash.org/voluptatemenimrerum.png?size=50x50&set=set1', null, 0), 
('Benny', 'bpanchins@w3.org', 'YQ7oc6fYt', 'https://robohash.org/repellatquasieaque.png?size=50x50&set=set1', null, 0), 
('Padraic', 'pweicht@mysql.com', 'c0Dl96Llx', 'https://robohash.org/ututveniam.png?size=50x50&set=set1', null, 0); 

-- Script for Role table
INSERT INTO Role VALUES ('user'), ('guest'), ('admin'); 

-- Script for UserRole table
-- Separate inserts for every role, some user have both admin and user roles at the same time. 
-- Insert admins
INSERT INTO UserRole VALUES (3, 1), (3, 2), (3, 3);
-- Insert users
INSERT INTO UserRole VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12), 
(1, 13), (1, 14), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20), (1, 22), (1, 23), (1, 24), (1, 26), (1, 27), (1, 28), (1, 30);
-- Insert guests
INSERT INTO UserRole VALUES (2, 15), (2, 21), (2, 25), (2, 29);

-- Script for List table
INSERT INTO List (List_Name, Is_Public, UserID) VALUES ('Best dramas', 1, 1), ('10 Great Movies', 1, 1), ('My favourites', 1, 1), 
('Best action movies', 1, 4), ('Great movies', 1, 5), ('Best action movies', 1, 6), ('Best action movies', 1, 7), 
('Movies Favored By Quentin Tarantino', 1, 9),('Great movies', 1, 9), ('10 Great Movies', 1, 10), ('Best', 1, 11), ('To watch', 1, 12), 
('Top 20', 1, 13), ('Best', 1, 14),('To watch', 1, 15), ('The 20 Best Thriller Movies of All Time', 1, 16), 
('Movies of all times', 0, 17), ('Best dramas', 0, 18), ('Best dramas', 0, 19),  ('Comedy', 0, 20), ('To watch', 0, 21), ('My favourites', 0, 22), 
('Best action movies', 0, 23), ('To watch', 1, 24), ('Great movies', 1, 18), ('My favourites', 1, 26), ('To watch', 1, 27), ('Best', 1, 28), 
('Best dramas', 1, 27), ('Loved movies', 1, 27) 

-- Script for GenreList table
INSERT INTO GenreList VALUES (1, 5), (1, 6), (1, 10), (2, 2), (2, 6), (2, 7), (2, 11), (3, 1), 
(3, 3), (3, 4), (3, 12), (4, 1), (4, 7), (4, 8), (5, 9), (5, 10), (5, 5), (6, 7), (6, 8), 
(7, 7), (7, 8), (8, 1), (8, 7), (8, 11), (9, 2), (9, 6), (9, 8), (10, 7), (11, 5), (11, 6), 
(12, 3), (13, 9), (13, 10), (14, 1), (15, 10), (16, 7), (17, 3), (17, 4), (18, 12), (18, 11), (19, 12), 
(20, 1), (20, 7), (21, 8), (22, 10), (23, 3), (23, 4), (24, 2), (24, 7), (25, 10), (26, 9), (26, 8), (27, 5), (27, 6), 
(28, 10), (28, 4), (29, 10), (29, 1), (29, 7), (30, 11), (30, 7), (30, 9)

-- Script for Link table
INSERT INTO Link VALUES
('https://www.justwatch.com/in/movie/avatar', 'justwatch.com'),
('https://www.justwatch.com/in/movie/spider-man-no-way-home', 'justwatch.com'),
('https://www.justwatch.com/in/movie/the-ghost-2022', 'justwatch.com'),
('https://www.kinogo.biz/in/tv-show/1899', 'kinogo.biz'), 
('https://www.kinogo.biz/in/movie/black-adam', 'kinogo.biz'),
('https://www.solarmovie.com/in/movie/bullet-train', 'SolarMovie.com'),
('https://www.justwatch.com/in/tv-show/wednesday', 'justwatch.com'),
('https://www.azmovies.com/in/tv-show/normal-people', 'AZmovies'),
('https://www.kinogo.biz/in/tv-show/house-of-the-dragon', 'kinogo.biz'),
('https://www.kinogo.bizm/in/tv-show/dexter', 'kinogo.biz'), 
('https://www.justwatch.com/in/tv-show/sherlock', 'justwatch.com'), 
('https://www.azmovies.com/in/tv-show/paperhouse', 'AZmovies'), 
('https://www.azmovies.com/in/tv-show/how-i-met-your-mother', 'AZmovies'), 
('https://www.kinogo.com/in/movie/doctor-g', 'kinogo.biz'), 
('https://www.azmovies.com/in/tv-show/she-hulk,', 'AZmovies'),  
('https://www.justwatch.com/in/tv-show/broken-but-beautiful', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/doctor-strange-2016', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/venom-2018', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/morbius', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/top-gun-maverick', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/jurassic-world-dominion', 'justwatch.com'), 
('https://www.justwatch.com/in/tv-show/manifest', 'justwatch.com'), 
('https://www.justwatch.com/in/tv-show/pagan-peak', 'justwatch.com'), 
('https://www.justwatch.com/in/tv-show/modern-family', 'justwatch.com'), 
('https://www.justwatch.com/in/tv-show/the-walking-dead', 'justwatch.com'), 
('https://www.justwatch.com/in/tv-show/elite', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/john-wick', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/deadpool', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/iron-man', 'justwatch.com'), 
('https://www.justwatch.com/in/movie/thor-ragnarok', 'justwatch.com'); 

-- Script for Movie table
INSERT INTO Movie VALUES
('Avatar', 'In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.', 'James Cameron', 2009, 'Sam Worthington, Sigourney Weaver ', 'image/jpeg;base64,/9j/4A1', 'image/jpeg;base64,/9j/4Av2' ,7.8, 'USA', 1),  
('Spider man no way home', 'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero.', 'Jon Watts', 2021, 'Tom Holland, Zendaya', 'image/jpeg;base64,/9j/4A3', 'image/jpeg;base64,/9j/4A4', 8.3, 'USA', 2),  
('The Gost', 'An ex-Interpol officer wreaks havoc and sends shock waves across the global underworld but goes missing in action, only to remerge years later, for his beloved family.', 'Praveen Sattaru', 2022, 'Gul Panag', 'image/jpeg;base64,/9j/4A5', 'image/jpeg;base64,/9j/4A6', 5.1, 'UK', 3),  
('1899', 'Passengers on an immigrant ship traveling to the new continent get caught in a mysterious riddle when they find a second vessel adrift on the open sea', 'Yann Gael', 2022, 'Emily Beecham, Isabella Wei', 'image/jpeg;base64,/9j/4A7', 'image/jpeg;base64,/9j/4A8', 7.1, 'UK', 4),  
('Black Adam', 'Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.', 'Jaume Collet-Serra', 2022, 'Dwayne Johnson', 'image/jpeg;base64,/9j/4A9', 'image/jpeg;base64,/9j/4A10', 6.7, 'USA', 5),  
('Bullet train', 'Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone off the rails.', 'David Leitch', 2022, 'Brad Pitt, Joey King', 'image/jpeg;base64,/9j/4A11', 'image/jpeg;base64,/9j/4A12', 7.3,'Estonia', 6),  
('Wednesday', 'Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers', 'Jenna Ortega', 2022, 'Gwendoline Christie', 'image/jpeg;base64,/9j/4A13', 'image/jpeg;base64,/9j/4A14', 8.5, 'UK', 7),  
('Normal people', 'Marianne and Connell weave in and out of each others lives in this exploration of power and the desire to love and be loved.', 'Daisy Edgar-Jones', 2020, 'Paul Mescal', 'image/jpeg;base64,/9j/4A15', 'image/jpeg;base64,/9j/4A16', 8.4, 'USA', 8),  
('House of the Dragon', 'The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke.', 'Matt Smith', 2020, 'Olivia Cooke', 'image/jpeg;base64,/9j/4A17', 'image/jpeg;base64,/9j/4A18', 6.8,'UK', 9),  
('Dexter', 'Dexter Morgan, a blood spatter pattern analyst for the Miami Metro Police also leads a secret life as a serial killer, hunting down criminals who have slipped through the cracks of justice.', 'John Carl', 2006, 'Geoff Pierson', 'image/jpeg;base64,/9j/4A19', 'image/jpeg;base64,/9j/4A20', 8.7,'USA', 10), 
('Sherlock', 'A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.', 'Rupert Graves', 2010, 'Louise Brealey, Molly Hooper', 'image/jpeg;base64,/9j/4A21', 'image/jpeg;base64,/9j/4A22', 8.1, 'UK', NULL), 
('Money Heist', 'An unusual group of robbers attempt to carry out the most perfect robbery in Spanish history - stealing 2.4 billion euros from the Royal Mint of Spain.', 'Jaime Lorente', 2017, 'Esther Acebo', 'image/jpeg;base64,/9j/4A23', 'image/jpeg;base64,/9j/4A24', 5.3, 'Europe', 12), 
('How I Met Your Mother', 'A father recounts to his children - through a series of flashbacks - the journey he and his four best friends took leading up to him meeting their mother.', 'Jason Segel', 2005, 'Cobie Smulders, Robin Scherbatsky', 'image/jpeg;base64,/9j/4A25', 'image/jpeg;base64,/9j/4A26', 7.7, 'Estonia', 13), 
('Doctor G', 'We try to add new providers constantly but we couldnt find an offer for Doctor G online. Please come back again soon to check if theres something new.', 'Anubhuti Kashyap', 2018, 'Sheeba Chaddha, Shobha Gupta', 'image/jpeg;base64,/9j/4A27', 'image/jpeg;base64,/9j/4A28', 7.5, 'India', 14), 
('She-Hulk: Attorney at Law', 'Jennifer Walters navigates the complicated life of a single, 30-something attorney who also happens to be a green 6-foot-7-inch superpowered hulk.', 'Steven Spielberg', 2015, 'Tatiana Maslany, Jennifer Walters',  'image/jpeg;base64,/9j/4A29', 'image/jpeg;base64,/9j/4A30', 5.2, 'USA', NULL), 
('Broken But Beautiful', 'Broken is Veer and Sameeras story where their hearts were left broken and damaged after they lost their love. Destiny has brought love in to their lives again, will they give it a second chance', 'Steven Spielberg', 2018, 'Taniya Kalra', 'image/jpeg;base64,/9j/4A31', 'image/jpeg;base64,/9j/4A32', 8.6, 'Lithuania', 16), 
('Doctor Strange' ,'After his career is destroyed, a brilliant but arrogant surgeon gets a new...', 'Scott Derrickson', 2016, 'CBenedict Cumberbatch, Chiwetel Ejiofor ', 'image/jpeg;base64,/9j/B23', 'image/jpeg;base64,/9j/B24', 7.5 ,'Latvia', 17), 
('Venom', 'Investigative journalist Eddie Brock attempts a comeback following a...', 'Ruben Fleischer', 2018 , 'Tom Hardy, Michelle Williams', 'image/jpeg;base64,/9j/B25', 'image/jpeg;base64,/9j/B26', 6.6, 'USA', 18), 
('Morbius', 'Dangerously ill with a rare blood disorder, and determined to save...', ' Daniel Espinosa ', 2022 , 'Jared Leto, Matt Smith', 'image/jpeg;base64,/9j/B27', 'image/jpeg;base64,/9j/B28', 5.5, 'USA', 19), 
('Top Gun: Maverick' ,'After more than thirty years of service as one of the Navy’s top aviators...', 'Joseph Kosinski', 2022, 'Tom Cruise, Matt Smith', 'image/jpeg;base64,/9j/B29', 'image/jpeg;base64,/9j/B30', 8.4 ,'USA', 20), 
('Jurassic World Dominion', 'Four years after the destruction of Isla Nublar, Biosyn operatives attempt to track down ...', 'Colin Trevorrow', 2022 , 'Chris Pratt, Bryce Dallas Howard', 'image/jpeg;base64,/9j/B31', 'image/jpeg;base64,/9j/B32', 5.7 ,'USA', 21), 
('Manifest', 'After landing from a turbulent but routine flight, the crew', 'Holly Taylor ', 2018 , 'Melissa Roxburgh, Josh Dallas', 'image/jpeg;base64,/9j/B5', 'image/jpeg;base64,/9j/B6', 7.1, 'France', 22), 
('Pagan Peak', 'When a gruesomely staged body is found at the German-Austrian border...', 'Dominic Marcus Singer ', 2019, 'Julia Jentsch, Nicholas Ofczarek', 'image/jpeg;base64,/9j/B7', 'image/jpeg;base64,/9j/B8', 8.0, 'USA', NULL), 
('Modern Family', 'The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family.', 'Ty Burrell ', 2009, 'Ed ONeill, Sofia Vergara', 'image/jpeg;base64,/9j/B9', 'image/jpeg;base64,/9j/B10', 8.5, 'USA', 24), 
('The Walking Dead' ,'Sheriff deputy Rick Grimes awakens from a coma to find a...', 'Josh McDermitt ', 2010, 'Norman Reedus, Melissa McBride', 'image/jpeg;base64,/9j/B11', 'image/jpeg;base64,/9j/B12', 8.1, 'Latvia', 25), 
('Elite', 'When three working class kids enroll in the most exclusive school...', 'Valentina Zenere', 2018, 'Manu Ríos, Carla Díaz', 'image/jpeg;base64,/9j/B13', 'image/jpeg;base64,/9j/B14', 7.3,'Spain', 26), 
('John Wick', 'Ex-hitman John Wick comes out of retirement to track down...', 'Chad Stahelski', 2014, 'Keanu Reeves, Michael Nyqvist', 'image/jpeg;base64,/9j/B15', 'image/jpeg;base64,/9j/B16', 7.4,'USA', 27), 
('Deadpool', 'The origin story of former Special Forces operative turned mercenary...', 'Tim Miller', 2016, 'Ryan Reynolds, Morena Baccarin', 'image/jpeg;base64,/9j/B17', 'image/jpeg;base64,/9j/B18', 8.0, 'Latvia', 28), 
('Iron Man', 'After being held captive in an Afghan cave, billionaire engineer...', 'Jon Favreau', 2008, 'Robert Downey Jr, Terrence Howard', 'image/jpeg;base64,/9j/B19', 'image/jpeg;base64,/9j/B20', 7.9, 'USA', 29), 
('Thor: Ragnarok', 'Thor is imprisoned on the other side of the universe and finds ...', 'Taika Waititi', 2017, 'Chris Hemsworth, Tom Hiddleston', 'image/jpeg;base64,/9j/B21', 'image/jpeg;base64,/9j/B22', 7.9, 'USA', 30 ); 

-- Script for UserMovie table
-- no user 15, 21, 25, 29
INSERT INTO UserMovie VALUES 
(1, 1, 1), (1, 3, 1), (2, 3, 1), (16, 3, 0), (19, 3, 1), (27, 3, 1), (11, 3, 0), (1, 2, 1), (11, 2, 0), (17, 2, 1), (23, 2, 0), (24, 2, 0), (27, 2, 1), (4, 4, 1), (9, 4, 1), (18, 4, 0), (30, 4, 1), (3, 5, 1), 
(5, 5, 0), (22, 5, 0), (28, 5, 1), (30, 5, 1), (3, 6, 0), (7, 6, 0), (13, 6, 1), (19, 6, 0), (28, 6, 1), (12, 7, 0), (16, 7, 1), (8, 8, 1), (9, 8, 0), (14, 8, 1), (26, 8, 0), (14, 9, 0), (27, 9, 1), (3, 10, 1), 
(5, 10, 0), (24, 10, 1), (1, 11, 1), (8, 11, 1), (23, 11, 0), (3, 12, 1), (20, 12, 1), (29, 12, 0), (7, 13, 0), (17, 13, 1), (10, 14, 1), (19, 14, 1), (26, 14, 0), (24, 16, 0), (29, 16, 1), (5, 18, 1), (15, 18, 0), (25, 18, 0), 
(1, 19, 1), (17, 19, 1), (14, 20, 1), (27, 20, 0), (30, 20, 1), (1, 22, 1), (12, 22, 1), (25, 22, 0), (4, 23, 0), (15, 23, 0), (19, 23, 1), (27, 23, 1), (13, 24, 1), (19, 24, 0), (25, 24, 0), (29, 24, 1), (6, 26, 1), (9, 27, 0), 
(2, 27, 0), (5, 27, 1), (13, 27, 1), (18, 27, 0), (25, 27, 0), (30, 27, 1), (2, 28, 1), (7, 28, 1), (11, 28, 0), (14, 28, 1), (17, 28, 0), (21, 28, 0), (29, 28, 1), (4, 30, 1), (12, 30, 1), (16, 30, 0), (21, 30, 0), (30, 30, 1)

-- Script for MovieGenre table
INSERT INTO MovieGenre VALUES (1, 7), (1, 11), (2, 2), (2, 7), (2, 8), (3, 4), (4, 3), (5, 2), 
(5, 7), (5, 11), (6, 1), (6, 7), (7, 2), (7, 10), (8, 5), (8, 6), (9, 10), (10, 3), (11, 4), 
(12, 7), (13, 2), (14, 12), (15, 2), (15, 8), (16, 5), (16, 6), (17, 7), (17, 10), (18, 3), (19, 3), 
(20, 7), (20, 8), (21, 11), (23, 12), (24, 12), (25, 3), (25, 11), (27, 7), (27, 8), (28, 2), (28, 7), 
(28, 8), (28, 11), (29, 2), (29, 7), (29, 11), (30, 2), (30, 10), (30, 11)

-- Script for MovieList table
INSERT INTO MovieList VALUES (1, 1), (2, 1), (4, 1), (9, 1), (17, 1), (21, 1), (29, 1), (3, 2), 
(10, 2), (12, 3), (16, 3), (12, 5), (22, 5), (5, 6), (25, 6), (22, 7), (29, 8), (12, 8), (10, 9), 
(12, 10), (13, 11), (14, 12), (15, 13), (16, 15), (16, 16), (16, 17), (17, 18), (18, 19), (19, 20), (20, 21), 
(21, 22), (22, 23), (23, 24), (25, 26), (26, 26), (27, 28), (28, 28), (28, 29), (29, 29), (13, 29), (27, 30), (30, 30)

-- Script for Review table
INSERT INTO Review VALUES 
('Great movie of all times...', 8.1, '10-24-2020', 1, 30), 
('Actors are very talanted and movie has been in the top 20...', 8.7, '06-01-2021', 2, 29), 
('Film director had idea of this film 8 years and did grat work...', 8.6, '11-25-2021', 1, 29), 
('The complicated life of a modern-day first generation Indian American...', 3.3, '09-08-2020', 4, 27), 
('A love triangle between one girl and two brothers. A story about first love, first heartbreak...', 3.7, '11-28-2020', 5, 26), 
('Dedicated student, dutiful daughter and loyal girlfriend to her high school sweetheart...', 6.1, '07-25-2021', 6, 25), 
('mysterious and brooding rebel who makes her question all she thought she knew about herself...', 6.1, '07-25-2021', 7, 25), 
('The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur...', 8.1, '01-05-2021', 8, 23), 
('Munna, is an unworthy, power-hungry heir who will stop at nothing to inherit his fathers legacy...', 5.4, '07-16-2020', 9, 22), 
('It snowballs into a game of ambition, power and greed that threatens the fabric of this lawless city...', 5.1, '02-12-2021', 3, 30), 
('The series follows Hanuman and his transformation from a mighty warrior to a god and how Hanuman became', 7.5, '01-11-2021', 3, 20), 
('their world is turned upside down when...', 8.1, '07-19-2020', 10, 19), 
('A 30,000 Crore crime nexus is being ruled by the unattainable...', 7.1, '08-10-2020', 10, 14), 
('Supernatural mystery that affected her family 25 years ago...', 8.5, '03-13-2020', 14, 14), 
('all while navigating her new relationships...', 9.0, '11-07-2020', 15, 30), 
('their world is turned upside down when...', 8.1, '07-19-2020', 15, 19),
('All while a very ancient evil awakens in the farthest north...', 9.1, '06-23-2021', 16, 15), 
('that stands between the realms of men and icy horrors beyond...', 7.7, '01-26-2020', 17, 14), 
('new realities become clear, a deeper mystery unfolds and some of the returned...', 7.1, '05-04-2020', 13, 13), 
('realize they may be meant for something greater than they ever thought possible...', 8.8, '01-13-2020', 3, 12), 
('unique mission, but becomes torn between following orders and protecting an alien civilization...', 6.8, '04-20-2021', 20, 3), 
('Ellie Sattler investigates a genetically engineered swarm of giant insects...', 7.8, '09-15-2021', 21, 10), 
('When he asks for help from Doctor Strange the stakes become even more dangerous...', 8.4, '10-20-2021', 22, 9), 
('When some random blah blahs become even more dangerous.', 8.2, '10-20-2021', 20, 9),
('all with connected, yet conflicting, objectives—on the worlds fastest train...', 7.1, '06-26-2021', 23, 8), 
('ogether they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late...', 7.8, '06-04-2021', 24, 7), 
('30-something attorney who also happens to be a green 6-foot-7-inch superpowered...', 5.1, '10-31-2021', 25, 6), 
('when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status...', 5.2, '12-31-2020', 26, 5), 
('down corrupt superheroes with no more than blue-collar grit and a willingness to fight dirty...', 7.0, '09-07-2020', 27, 4), 
('town uncovers a mystery involving secret experiments...', 4.5, '06-28-2021', 28, 3), 
('supernatural forces, and one strange little girl...', 7.9, '01-19-2021', 28, 2), 
('both familiar and new, as they confront the long-feared re-emergence of evil to Middle-earth...', 5.3, '02-17-2021', 30, 1),
('some random blah blah to Middle-earth...', 6.4, '02-17-2021', 25, 1); 

-- Script for Comment table
INSERT INTO Comment VALUES   
('My favourite movie', '10-24-2020', 1, 30),   
('Agree, that this movie is interesting', '06-01-2021', 2, 29),   
('I watched it three times!', '11-25-2021', 1, 29),   
('Waste of time', '09-08-2020', 4, 27),   
('I do not like it', '11-28-2020', 5, 26),   
('Good movie', '07-25-2021', 6, 25),   
('Will watch it again', '07-25-2021', 7, 25),   
('Recommend to everyone', '01-05-2021', 8, 23),   
('Boring', '07-16-2020', 9, 22),   
('Actors are amazing', '02-12-2021', 3, 30),   
('Great movie', '01-11-2021', 3, 20),   
('Great', '07-19-2020', 10, 19),   
('Like it', '08-10-2020', 10, 14),   
('My top 10 movie', '03-13-2020', 14, 14),   
('Will watch it next time', '11-07-2020', 15, 30),   
('Finally could watch it', '07-19-2020', 15, 19),  
('Better to see in cinema', '06-23-2021', 16, 15),   
('Lovely movie', '01-26-2020', 17, 14),   
('Good movie for family', '05-04-2020', 13, 13),   
('Interesting scenario', '01-13-2020', 3, 12),   
('Favorite movie for weekend', '04-20-2021', 1, 3),   
('This movie inspired me', '09-15-2021', 21, 10),   
('it motivates', '10-20-2021', 22, 9),   
('.good movie with good actors', '10-20-2021', 20, 9),  
('Nice one', '06-26-2021', 23, 8),   
('I didnt like it', '06-04-2021', 24, 7),   
('sould be for kids', '10-31-2021', 25, 6),   
('will share it with friends', '12-31-2020', 26, 5),   
('good to see once', '09-07-2020', 27, 4),   
('nothing to see',  '06-28-2021', 28, 3),   
('could not watch till the end', '01-19-2021', 28, 2),   
('should have more adventures', '02-17-2021', 3, 1),  
('Fantastic movie', '02-17-2021', 25, 1); 


SELECT * FROM MovieGenre
SELECT * FROM GenreList
SELECT * FROM MovieList
SELECT * FROM UserMovie
SELECT * FROM UserRole
SELECT * FROM Role
SELECT * FROM Genre
SELECT * FROM List
SELECT * FROM Comment
SELECT * FROM Review
SELECT * FROM Movie
SELECT * FROM Link
SELECT * FROM AppUser

-- 1. Get a list of newest Movies with release year not later than 2020 for every Genre. 
-- Within each Genre Movies should be sorted by latest added using MovieID. 
SELECT Genre.Genre_Name, NewMovies.MovieID, NewMovies.Movie_Name FROM ((Genre  
LEFT JOIN MovieGenre 
ON Genre.GenreID = MovieGenre.GenreID) 
LEFT JOIN (SELECT * FROM Movie WHERE Movie.Year >= 2020) NewMovies 
ON MovieGenre.MovieID = NewMovies.MovieID) 
ORDER BY Genre.Genre_Name ASC, NewMovies.MovieID DESC 

-- 2. Get TOP10 Movies by Rating 
SELECT TOP 10 * 
FROM Movie 
ORDER BY Rating DESC 

-- 3. Get TOP10 most reviewed Movies 
SELECT TOP 5 MostReviewed.MovieID, Movie.Movie_Name, MostReviewed.Reviews FROM (( 
SELECT MovieID, COUNT(ReviewID) AS Reviews FROM Review 
GROUP BY MovieID) MostReviewed 
INNER JOIN Movie 
ON MostReviewed.MovieID = Movie.MovieID) 
ORDER BY MostReviewed.Reviews DESC 

-- 4. Get TOP10 most commented Reviews and their authors
SELECT DISTINCT TOP 10 MostCommented.ReviewID, MostCommented.Comments, AppUser.Username AS ReviewAuthor FROM ( 
SELECT ReviewID, COUNT(CommentID) AS Comments FROM Comment 
GROUP BY ReviewID) MostCommented 
JOIN Review
ON MostCommented.ReviewID = Review.UserID
JOIN AppUser
ON Review.UserID = AppUser.UserID
ORDER BY MostCommented.Comments DESC

-- 5. Get 10 least watched Movies tagged by users
SELECT TOP 10 Movie.Movie_Name, MostWatched.WatchAmount FROM ((
SELECT MovieID, COUNT(Is_Watched) AS WatchAmount FROM UserMovie
GROUP BY MovieID) MostWatched
INNER JOIN Movie
ON MostWatched.MovieID = Movie.MovieID)
ORDER BY MostWatched.WatchAmount ASC

-- 6. Get all Movies of User with UserID = 2 
SELECT UserMovie.MovieID, Movie.Movie_Name FROM UserMovie 
INNER JOIN Movie 
ON UserMovie.MovieID = Movie.MovieID 
WHERE UserMovie.UserID = 2 

-- 7. Get all Lists and all Movies of these Lists by UserID = 1
SELECT List.List_Name, List.Is_Public, MovieList.MovieID, Movie.Movie_Name FROM ((List 
LEFT JOIN MovieList 
ON List.ListID = MovieList.ListID) 
JOIN Movie 
ON MovieList.MovieID = Movie.MovieID) 
WHERE List.UserID = 1 

-- 8. Get all Users which have more than one list added 
SELECT List.UserID, AppUser.Username, COUNT(List.UserID) AS ListAmount 
FROM (List INNER JOIN AppUser ON List.UserID = AppUser.UserID) 
GROUP BY AppUser.Username, List.UserID 
HAVING COUNT(List.UserID)>1 

-- 9. Get a list of all Drama movies
SELECT Genre.Genre_Name, MovieGenre.MovieID, Movie.Movie_Name 
FROM ((MovieGenre INNER JOIN Genre 
ON MovieGenre.GenreID = Genre.GenreID) 
LEFT JOIN Movie 
ON Movie.MovieID = MovieGenre.MovieID) 
WHERE Genre.Genre_Name = 'Drama' 

-- 10. Get a list of all Reviews for movie called "Thor: Ragnarok". 
-- Report should display all fields of the Review table and the Username of the Review author. 
-- Reviews must be ordered by creation date starting with the latest. 
SELECT Review.ReviewID, Review.Review_Text, Review.Rating, Review.Created_On, AppUser.Username FROM ((Review  
LEFT JOIN Movie 
ON Review.MovieID = Movie.MovieID) 
INNER JOIN AppUser 
ON Review.UserID = AppUser.UserID) 
WHERE Movie.Movie_Name = 'Thor: Ragnarok' 
ORDER BY Review.Created_On DESC 

-- 11. Get a list of all Comments for Review Id = 3 of User with Username 'Alfred'
SELECT Review.ReviewID, Review.Review_Text, Review.Created_On, AppUser.Username FROM ((Comment  
LEFT JOIN Review 
ON Review.ReviewID = Comment.ReviewID) 
INNER JOIN AppUser 
ON Comment.UserID = AppUser.UserID) 
WHERE Review.ReviewID = 3 AND AppUser.Username = 'Alfred' 

-- 12. Create a report containing Username and Email of Users whose accounts were blocked: 
SELECT Username, Email FROM AppUser  
WHERE Is_Blocked = 1 

-- 13. Create a View to represent a list of Movies filmed in Baltics: 
CREATE VIEW [BALTIC GEMS] AS
SELECT MovieID, Movie_Name, Year, SUBSTRING('Movie_Description', 1, 20) Short_Description 
FROM Movie 
WHERE Region = 'Latvia' OR Region = 'Estonia' OR Region = 'Lithuania'

SELECT * FROM [BALTIC GEMS] 

-- 14. Get Movie lists created by Admin user: 
SELECT List.ListID, List.List_Name, List.Is_Public FROM ((List 
INNER JOIN UserRole 
ON List.UserID = UserRole.UserID) 
LEFT JOIN Role 
ON UserRole.RoleID = Role.RoleID) 
WHERE Role.Role_Name = 'admin' 


-- Drop tables scripts
DROP TABLE MovieGenre 
DROP TABLE GenreList 
DROP TABLE MovieList 
DROP TABLE UserMovie 
DROP TABLE UserRole 
DROP TABLE Role 
DROP TABLE Genre 
DROP TABLE List 
DROP TABLE Comment 
DROP TABLE Review 
DROP TABLE Movie 
DROP TABLE Link 
DROP TABLE AppUser 