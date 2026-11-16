CREATE DATABASE ipl;

CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    home_city VARCHAR(50),
    home_ground VARCHAR(150),
    founded_year INT
);

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    team_id INT,
    role VARCHAR(50),
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50),
    nationality VARCHAR(50),
    age INT,
    auction_price_lakh NUMERIC(10,1),

    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);
DROP TABLE players;
CREATE TABLE players(
player_id SERIAL PRIMARY KEY,
player_name VARCHAR(50),
team_id INT,
role  VARCHAR(50),
batting_style  VARCHAR(50),
bowling_style  VARCHAR(50),
nationality  VARCHAR(50),
age INT,
auction_price_lakh NUMERIC
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    season INT,
    match_date DATE,
    city VARCHAR(50),
    venue VARCHAR(150),
    team1_id INT,
    team2_id INT,
    toss_winner_team_id INT,
    toss_decision VARCHAR(10),
    winner_team_id INT,
    loser_team_id INT,
    result_type VARCHAR(20),
    result_margin INT,
    team1_score INT,
    team2_score INT,
    player_of_match_id INT,
    team1_sixes INT,
    team2_sixes INT,
    team1_fours INT,
    team2_fours INT,

    FOREIGN KEY (team1_id) REFERENCES teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES teams(team_id),
    FOREIGN KEY (toss_winner_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (loser_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (player_of_match_id) REFERENCES players(player_id)
);




COPY teams
FROM '/Users/Shared/postgres_import/IPL_Teams.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    ENCODING 'UTF8'
);

COPY players
FROM '/Users/Shared/postgres_import/IPL_Players.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    ENCODING 'UTF8'
);



COPY matches
FROM '/Users/Shared/postgres_import/IPL_Matches.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    ENCODING 'UTF8'
);

SELECT * FROM teams;
SELECT * FROM players ;
SELECT * FROM matches ;


SELECT * FROM players
ORDER BY player_name ASC;




-- QUESTION 1: Display all players from the Players table.

SELECT * FROM players ;

-- QUESTION 2: Display only player_name, role, and nationality.

SELECT player_name , role, nationality FROM players ;

-- QUESTION 3: Find all players whose role is Batsman.


SELECT * FROM players 
WHERE role = 'Batsman';

-- QUESTION 4: Find all players older than 30 years.

SELECT * FROM players 
WHERE age>30;

-- QUESTION 5: Find players with an auction price greater than ₹100 lakh.

SELECT * FROM players 
WHERE auction_price_lakh >100;

-- QUESTION 6: Find all unique nationalities in the Players table.

SELECT DISTINCT nationality FROM players;

-- QUESTION 7: Find players who are Bowler and younger than 30.

SELECT * FROM players 
WHERE role ='Bowler' AND age>30;

-- QUESTION 8: Find players who are either Batsman or Wicketkeeper.

SELECT * FROM players 
WHERE role ='Bowler' OR role = 'Wicketkeeper';

-- QUESTION 9: Find the 10 most expensive players.

SELECT * FROM players 
ORDER BY auction_price_lakh DESC
LIMIT 10;

-- QUESTION 10: Find the 10 youngest players.

SELECT * FROM players 
ORDER BY age ASC
LIMIT 10;

-- QUESTION 11: Count the total number of players.

SELECT COUNT(player_name)
FROM players;

-- QUESTION 12: Find the average auction price of all players.

SELECT AVG(auction_price_lakh)
FROM players;

-- QUESTION 13: Find the highest auction price.

SELECT MAX(auction_price_lakh) AS highest_auc_price
FROM players;

--OR

SELECT auction_price_lakh AS highest_auc_price 
FROM players
ORDER BY auction_price_lakh DESC
LIMIT 1 ;

-- QUESTION 14: Find the lowest auction price.

SELECT MIN(auction_price_lakh) AS MIN_auc_price
FROM players;

--OR

SELECT auction_price_lakh AS LOWEST_auc_price 
FROM players
ORDER BY auction_price_lakh ASC
LIMIT 1 ;


-- QUESTION 15: Find the average age of all players.


SELECT AVG(age)
FROM players;




-- QUESTION 16: Count the number of players in each role.

-- QUESTION 17: Count players from each nationality.

-- QUESTION 18: Find the average auction price for each role.

-- QUESTION 19: Find the average age of players for each nationality.

-- QUESTION 20: Find roles whose average auction price is greater than ₹100 lakh.

-- QUESTION 21: Count the total number of matches in each season.

-- QUESTION 22: Find the highest team1_score in each season.

-- QUESTION 23: Find the average team1_score for each season.

-- QUESTION 24: Find the number of matches played in each city.

-- QUESTION 25: Find cities that hosted more than 50 matches.

-- QUESTION 26: JOIN Players and Teams and display each player's name with their team name.

-- QUESTION 27: Find the total number of players belonging to each team.

-- QUESTION 28: Find the average auction price of players for each team.

-- QUESTION 29: Find the highest auction price in each team.

-- QUESTION 30: Display each match with the names of Team 1 and Team 2 instead of their IDs.

-- QUESTION 31: Display each match ID along with the winning team's name.

-- QUESTION 32: Find the total number of matches won by each team.

-- QUESTION 33: Find the total number of tosses won by each team.

-- QUESTION 34: Display the name of the Player of the Match for every match.

-- QUESTION 35: Find the top 10 players with the most Player of the Match awards.
