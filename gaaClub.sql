CREATE TABLE Club (
	clubID int NOT NULL,
	address VARCHAR(255) NOT NULL,
	name VARCHAR(30)NOT NULL,
	pitch_Size_sqM int NOT NULL,
	county varchar(255) NOT NULL,
	PRIMARY KEY (clubID)
	);

CREATE TABLE Player (
	playerID INTEGER NOT NULL, 
	playerName VARCHAR(255) NOT NULL,
	DOB DATE NOT NULL,
	position VARCHAR(255) NOT NULL CHECK (position IN('Goalkeeper', 'Right Back', 'Full Back', 'Left Back', 'Right Half Back', 'Centre Back', 'Left Half Back',
			'Midfielder', 'Left Half Forward', 'Half Forward', 'Right Half Forward','Left Corner Forward', 'Centre Forward', 'Right Corner Forward')),
	jerseyNum INTEGER,
	club_id INTEGER NOT NULL,
	PRIMARY KEY (playerID),
	FOREIGN KEY (club_id) REFERENCES Club (clubID)
	);

CREATE TABLE Sponsorship (
	sponsID	INTEGER NOT NULL,
	dateJoined DATE NOT NULL,
	sponsorName VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	club_id INTEGER NOT NULL,
	PRIMARY KEY (sponsID),
	FOREIGN KEY (club_id) REFERENCES Club (clubID)
	);

CREATE TABLE Team (
	teamID INTEGER NOT NULL,
	numPlayers INTEGER NOT NULL,
	canPlay TINYINT NOT NULL CHECK(canPlay = 0 OR canPlay = 1), 
	wins INTEGER NOT NULL, 
	losses INTEGER NOT NULL,
	teamName VARCHAR(255) NOT NULL,
	spons_id INTEGER NOT NULL,
	PRIMARY KEY (teamID),
	FOREIGN KEY (spons_id) REFERENCES Sponsorship (sponsID)
	);
    
CREATE TABLE Coach (
	coachID INTEGER NOT NULL,
	coachName VARCHAR(255) NOT NULL,
	DOB DATE NOT NULL,
	email VARCHAR(255) NOT NULL,
	club_id INTEGER NOT NULL,
    team_id INT NOT NULL,
	PRIMARY KEY (coachID),
	FOREIGN KEY (club_id) REFERENCES Club (clubID),
    FOREIGN KEY (team_id) REFERENCES Team (TeamID)
	);

CREATE TABLE Matches (
	matchID INTEGER NOT NULL,
	locations VARCHAR(255) NOT NULL,
	kickOff TIME NOT NULL,
	opposition VARCHAR(255) NOT NULL,
	dateMatch DATE NOT NULL,
	team_id INT NOT NULL,
	PRIMARY KEY (matchID),
	FOREIGN KEY (team_id) REFERENCES Team (teamID)
	);

CREATE TABLE Players_on_Team (
	player_id INTEGER NOT NULL,
	team_id INTEGER NOT NULL,
	PRIMARY KEY (player_id, team_id),
	FOREIGN KEY (player_id) REFERENCES Player (playerID),
	FOREIGN KEY (team_id) REFERENCES Team (teamID)
	);

INSERT INTO Club VALUES(1, '21 Beach St, Skerries', 'Celtic Harps', 10400, 'Dublin' );

INSERT INTO Player VALUES(100, 'Thomas OBrien', '2008-10-27', 'Goalkeeper', 1, 1);
INSERT INTO Player VALUES(101, 'Jake Cook', '2008-09-10', 'Right Back' , 2, 1);
INSERT INTO Player VALUES(102, 'Lee Carr', '2008-06-11', 'Full Back', 3, 1);
INSERT INTO Player VALUES(103, 'Karl Patton', '2008-07-27', 'Left Back', 4, 1);
INSERT INTO Player VALUES(104, 'Stacey Robinson', '2008-01-04', 'Right Half Back', 5, 1);
INSERT INTO Player VALUES(105, 'Milton Stevenson', '2008-01-16', 'Centre Back', 6, 1);
INSERT INTO Player VALUES(106, 'Vicki Brock', '2008-06-16', 'Left Half Back', 7, 1);
INSERT INTO Player VALUES(107, 'Erik Hudson', '2008-07-30', 'Centre Forward', 14, 1);	
INSERT INTO Player VALUES(108, 'Darryl Sherman', '2008-11-28', 'Left Corner Forward', 15, 1);
INSERT INTO Player VALUES(109, 'Penny Tyler', '2008-02-02', 'Right Corner Forward', 13, 1);
INSERT INTO Player VALUES(110, 'Harry Torres', '2008-07-14', 'Right Half Forward', 10, 1);
INSERT INTO Player VALUES(111, 'Darrell Wise', '2008-08-24', 'Half Forward', 11, 1);
INSERT INTO Player VALUES(112, 'Erick Holt', '2008-10-27', 'Left Half Forward', 12, 1);
INSERT INTO Player VALUES(113, 'Amy Rivera', '2008-04-08', 'Midfielder', 8, 1);
INSERT INTO Player VALUES(114, 'Darrell Wise', '2008-04-13', 'Midfielder', 9, 1);

INSERT INTO Player VALUES(115, 'Brent Frazier', '1998-01-27', 'Goalkeeper', 1, 1);
INSERT INTO Player VALUES(116, 'Gordon Ramsey', '1998-10-27', 'Right Back', 2, 1);
INSERT INTO Player VALUES(117, 'Perry Graves', '1998-08-27', 'Full Back', 3, 1);
INSERT INTO Player VALUES(118, 'Darrell Mccoy', '1999-07-27', 'Left Back', 4, 1);
INSERT INTO Player VALUES(119, 'Roland Perkins', '1999-07-27', 'Right Half Back', 5, 1);
INSERT INTO Player VALUES(120, 'Ed Neal', '1999-02-27', 'Centre Back', 6, 1);
INSERT INTO Player VALUES(121, 'Gerard Pope', '1999-05-27', 'Left Half Back', 7, 1);
INSERT INTO Player VALUES(122, 'Wallace Griffin', '1999-05-27', 'Midfielder', 8, 1);
INSERT INTO Player VALUES(123, 'Noel Klein', '1999-10-16', 'Right Half Forward', 10, 1);
INSERT INTO Player VALUES(124, 'Chris Parsons', '1998-11-27', 'Midfielder', 9, 1);
INSERT INTO Player VALUES(125, 'Michael Copeland', '1999-12-25', 'Left Half Forward', 12, 1);
INSERT INTO Player VALUES(126, 'Joseph Banks', '1998-12-01', 'Right Corner Forward', 13, 1);
INSERT INTO Player VALUES(127, 'Dominick Tucker', '1998-06-20', 'Half Forward', 11, 1);
INSERT INTO Player VALUES(128, 'Fred Cohen', '1999-03-02', 'Centre Forward', 14, 1);
INSERT INTO Player VALUES(129, 'Percy Rios', '1999-07-20', 'Left Corner Forward', 15, 1);
INSERT INTO Player VALUES(130, 'Casey Santos', '1999-06-12', 'Goalkeeper', 16, 1);
INSERT INTO Player VALUES(131, 'Timmy Daniel', '1998-05-05', 'Right Back', 17, 1);
INSERT INTO Player VALUES(132, 'Kristopher Houston', '1999-10-27', 'Full Back', 18, 1);

INSERT INTO Player VALUES(133, 'Ron Brewer', '2008-06-13', 'Goalkeeper', 1, 1);
INSERT INTO Player VALUES(134, 'Cedric Brown', '2008-02-08', 'Midfielder', 8, 1);
INSERT INTO Player VALUES(135, 'Joel Lawrence', '2008-11-01', 'Right Half Back', 5, 1);
INSERT INTO Player VALUES(136, 'Randy Rose', '2008-07-15', 'Left Half Back', 7, 1);
INSERT INTO Player VALUES(137, 'Chris Alvarez', '2008-04-13', 'Right Corner Forward', 13, 1);
INSERT INTO Player VALUES(138, 'Alvin Quinn', '2008-08-08', 'Midfielder', 9, 1);
INSERT INTO Player VALUES(139, 'Kyle Lane', '2008-05-13', 'Centre Forward', 14, 1);

INSERT INTO Sponsorship VALUES(1, '2015-05-18', 'DIY Hardware', '71 Rock St, Dublin', 1);
INSERT INTO Sponsorship VALUES(2, '2012-01-04', 'Easy Groceries', '8 Keady Road, Dublin', 1);
INSERT INTO Sponsorship VALUES(3, '2015-05-18', 'Joes Pub', '23 Bach Rd, Dublin', 1);
INSERT INTO Sponsorship VALUES(4, '2015-05-18', 'News Agent', '42 Earlsford, Dublin', 1);

INSERT INTO Team VALUES(10, 15, true, 14, 5, 'U12s Gaelic', 3);
INSERT INTO Team VALUES(11, 15, true, 8, 8, 'U12s Hurling', 2);
INSERT INTO Team VALUES(12, 18, true, 10, 1, '20s Gaelic', 1);

INSERT INTO Coach VALUES(20, 'Karl Evans', '1973-06-13', 'evansKarl@gmail.com', 1, 10);
INSERT INTO Coach VALUES(21, 'George Frank', '1989-01-24', 'george1234@gmail.com', 1, 11);
INSERT INTO Coach VALUES(22, 'Geoffrey Jennings', '1981-12-01', 'Jennings1@gmail.com', 1, 12);

INSERT INTO Matches VALUES(40, 'Balbriggan', '10:00:00', 'Islanders', '2019-11-30', 12);
INSERT INTO Matches VALUES(41, 'Skerries', '11:30:00', 'Celtic Tigers', '2019-12-03', 10);
INSERT INTO Matches VALUES(42, 'Swords', '12:00:00', 'Celtic Tigers', '2019-12-10', 10);
INSERT INTO Matches VALUES(43, 'Skerries', '14:30:00', 'Fingal Runners', '2019-12-11', 11);
INSERT INTO Matches VALUES(44, 'Balbriggan', '09:00:00', 'Islanders', '2019-12-18', 11);

INSERT INTO Players_on_Team VALUES(100, 10);
INSERT INTO Players_on_Team VALUES(101, 10);
INSERT INTO Players_on_Team VALUES(102, 10);
INSERT INTO Players_on_Team VALUES(103, 10);
INSERT INTO Players_on_Team VALUES(104, 10);
INSERT INTO Players_on_Team VALUES(105, 10);
INSERT INTO Players_on_Team VALUES(106, 10);
INSERT INTO Players_on_Team VALUES(107, 10);
INSERT INTO Players_on_Team VALUES(108, 10);
INSERT INTO Players_on_Team VALUES(109, 10);
INSERT INTO Players_on_Team VALUES(110, 10);
INSERT INTO Players_on_Team VALUES(111, 10);
INSERT INTO Players_on_Team VALUES(112, 10);
INSERT INTO Players_on_Team VALUES(113, 10);
INSERT INTO Players_on_Team VALUES(114, 10);

INSERT INTO Players_on_Team VALUES(133, 11);
INSERT INTO Players_on_Team VALUES(134, 11);
INSERT INTO Players_on_Team VALUES(135, 11);
INSERT INTO Players_on_Team VALUES(136, 11);
INSERT INTO Players_on_Team VALUES(137, 11);
INSERT INTO Players_on_Team VALUES(138, 11);
INSERT INTO Players_on_Team VALUES(139, 11);
INSERT INTO Players_on_Team VALUES(101, 11);
INSERT INTO Players_on_Team VALUES(102, 11);
INSERT INTO Players_on_Team VALUES(103, 11);
INSERT INTO Players_on_Team VALUES(105, 11);
INSERT INTO Players_on_Team VALUES(110, 11);
INSERT INTO Players_on_Team VALUES(111, 11);
INSERT INTO Players_on_Team VALUES(112, 11);
INSERT INTO Players_on_Team VALUES(108, 11);

INSERT INTO Players_on_Team VALUES(115, 12);
INSERT INTO Players_on_Team VALUES(116, 12);
INSERT INTO Players_on_Team VALUES(117, 12);
INSERT INTO Players_on_Team VALUES(118, 12);
INSERT INTO Players_on_Team VALUES(119, 12);
INSERT INTO Players_on_Team VALUES(120, 12);
INSERT INTO Players_on_Team VALUES(121, 12);
INSERT INTO Players_on_Team VALUES(122, 12);
INSERT INTO Players_on_Team VALUES(123, 12);
INSERT INTO Players_on_Team VALUES(124, 12);
INSERT INTO Players_on_Team VALUES(125, 12);
INSERT INTO Players_on_Team VALUES(126, 12);
INSERT INTO Players_on_Team VALUES(127, 12);
INSERT INTO Players_on_Team VALUES(128, 12);
INSERT INTO Players_on_Team VALUES(129, 12);
INSERT INTO Players_on_Team VALUES(130, 12);
INSERT INTO Players_on_Team VALUES(131, 12);
INSERT INTO Players_on_Team VALUES(132, 12);

CREATE VIEW Team_Sponsors
AS SELECT sponsorName, address, teamName
FROM sponsorship, Team WHERE sponsorship.sponsID = team.spons_id;

CREATE VIEW Teams
AS Select playerName,position, teamName, coachName
FROM player, players_on_team, team, coach WHERE playerID = players_on_team.player_id AND teamID = players_on_team.team_id AND coach.team_id = teamID;

DELIMITER //
CREATE TRIGGER player_check_below BEFORE UPDATE ON team
FOR EACH ROW
BEGIN
	IF new.numPlayers < 15 THEN
		SET new.canPlay = 0;
	END IF;
END ;

DELIMITER;

DELIMITER //
CREATE TRIGGER player_check_above BEFORE UPDATE ON team
FOR EACH ROW
BEGIN
	IF new.numPlayers > 14 THEN
		SET new.canPlay = 1;
	END IF;
END ;

DELIMITER;


    




	
