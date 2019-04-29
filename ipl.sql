CREATE TABLE IPL
(
ID int,
season INT,
city LONGTEXT,
team1 LONGTEXT,
team2 LONGTEXT,
winner LONGTEXT,
venue LONGTEXT,
PRIMARY KEY(ID)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/matches.csv'
INTO TABLE IPL
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE deliveries
(
ID int,
match_id INT,
team1 LONGTEXT,
team2 LONGTEXT,
batsman LONGTEXT,
bowler LONGTEXT,
total_runs INT,
player_dismissed LONGTEXT,
PRIMARY KEY(ID)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/deliveries2.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE venue(
    ID int auto_increment,
    city varchar(255),
    venue varchar(255),
    PRIMARY KEY (ID)
);

INSERT INTO venue (city,venue)
SELECT city,venue
FROM IPL;

ALTER TABLE IPL
DROP COLUMN venue;

SELECT * from
deliveries d, ipl i
WHERE d.match_id = i.id;

select * from venue;
select * from IPL;
select * from deliveries;

create view Total_Analysis
as
select i.season,i.winner,i.team1,i.team2,d.batsman,d.bowler
from IPL i, deliveries d
where i.id=d.id and d.total_runs is not null
order by season;

select *
from Total_Analysis;

select team1, team2
from IPL;

select count(winner)
from IPL
where winner ='Sunrisers Hyderabad'
order by season;

select count(winner)
from IPL
where winner ='Royal Challengers Bangalore'
order by season;


select count(winner)
from IPL
where winner ='Mumbai Indians'
order by season;


select count(winner)
from IPL
where winner ='Rising Pune Supergiant'
order by season;


select count(winner)
from IPL
where winner ='Gujarat Lions'
order by season;


select count(winner)
from IPL
where winner ='Kolkata Knight Riders'
order by season;


select count(winner)
from IPL
where winner ='Delhi Daredevils'
order by season;

select count(winner)
from IPL
where winner ='Kings XI Punjab'
order by season;

select count(winner)
from IPL
where winner ='Deccan Chargers'
order by season;

select count(winner)
from IPL
where winner ='Chennai Super Kings'
order by season;

select count(winner)
from IPL
where winner ='Rajasthan Royals'
order by season;

select team1
from IPL
order by season;

select count(id)
from IPL
where team1 ='Sunrisers Hyderabad' or team2='Sunrisers Hyderabad'
order by season;

select count(id)
from IPL
where team1 ='Royal Challengers Bangalore' or team2='Royal Challengers Bangalore'
order by season;


select count(id)
from IPL
where team1='Mumbai Indians' or team2='Mumbai Indians'
order by season;


select count(id)
from IPL
where team1='Rising Pune Supergiant' or team2='Rising Pune Supergiant'
order by season;


select count(id)
from IPL
where team1='Gujarat Lions' or team2='Gujarat Lions'
order by season;


select count(id)
from IPL
where team1='Kolkata Knight Riders' or team2='Kolkata Knight Riders'
order by season;


select count(id)
from IPL
where team1='Delhi Daredevils' or team2='Delhi Daredevils'
order by season;

select count(id)
from IPL
where team1='Kings XI Punjab' or team2='Kings XI Punjab'
order by season;

select count(id)
from IPL
where team1='Deccan Chargers' or team2='Deccan Chargers'
order by season;

select count(id)
from IPL
where team1='Chennai Super Kings' or team2='Chennai Super Kings'
order by season;

select count(id)
from IPL
where team1='Rajasthan Royals' or team2='Rajasthan Royals'
order by season;

create table EachTeamWin(
id int,
Team varchar(500),
Total_Match int,
Win int,
primary key (id) );

insert into EachTeamWin
values(1,'Sunrisers Hyderabad',76,42);

insert into EachTeamWin
values(2,'Royal Challengers Banlalore',152,73);

insert into EachTeamWin
values(3,'Mumbai Indians',157,92);

insert into EachTeamWin
values(4,'Gujarat Lions',30,13);

insert into EachTeamWin
values(5,'Kolkata Knigh Riders',148,77);

insert into EachTeamWin
values(6,'Rising Pune Super Giants',16,10);

insert into EachTeamWin
values(7,'Kings XI Punjab',148,70);

insert into EachTeamWin
values(8,'Delhi Daredevil',147,62);

insert into EachTeamWin
values(9,'Chennai SUper Kings',131,79);

insert into EachTeamWin
values(10,'Rajasthan Royals',118,63);

insert into EachTeamWin
values(11,'Deccan Chargers',75,29);

Create View Overall_Detail
as
select *, (Win/Total_Match)*100 as Winning_Percentage, (100-(Win/Total_Match)*100 ) as Lossing_Percentage
from EachTeamWin;

select *
from Overall_Detail;

select * from EachTeamWin;

CREATE INDEX win ON
EachTeamWin(Win);