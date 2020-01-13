/*Insert movies in movies table*/
INSERT INTO `moviecruiser`.`movies` (`mo_id`, `mo_title`, `mo_box_office`, `mo_active`, `mo_date_of_launch`, `mo_genre`, `mo_has_teaser`) VALUES ('1', 'Avatar', '2787965087', 'Yes', '2017-03-15', 'Science Fiction', 'Yes ');
INSERT INTO `moviecruiser`.`movies` (`mo_id`, `mo_title`, `mo_box_office`, `mo_active`, `mo_date_of_launch`, `mo_genre`, `mo_has_teaser`) VALUES ('2', 'The Avengers', '1518812988', 'Yes', '2018-12-23', 'SuperHero', 'No');
INSERT INTO `moviecruiser`.`movies` (`mo_id`, `mo_title`, `mo_box_office`, `mo_active`, `mo_date_of_launch`, `mo_genre`, `mo_has_teaser`) VALUES ('3', 'Titanic', '2187463944', 'Yes', '2019-08-21', 'Romance', 'No');
INSERT INTO `moviecruiser`.`movies` (`mo_id`, `mo_title`, `mo_box_office`, `mo_active`, `mo_date_of_launch`, `mo_genre`, `mo_has_teaser`) VALUES ('4', 'Jurassic Wolrd', '1671713208', 'No', '2020-07-02', 'Scienc Fiction', 'Yes');
INSERT INTO `moviecruiser`.`movies` (`mo_id`, `mo_title`, `mo_box_office`, `mo_active`, `mo_date_of_launch`, `mo_genre`, `mo_has_teaser`) VALUES ('5', 'Avengers:End Game', '2750760348', 'Yes', '2022-11-02', 'SuperHero', 'Yes');


/*Insert user*/
INSERT INTO `moviecruiser`.`user` (`us_id`, `us_name`) VALUES ('1', 'Asha');
INSERT INTO `moviecruiser`.`user` (`us_id`, `us_name`) VALUES ('2', 'Usha');



/*Query to get all movies*/
select mo_id, mo_title, mo_box_office, mo_active, mo_date_of_launch, mo_genre, mo_has_teaser from moviecruiser.movies;

/*SQL query to get all movies which after launch date and is active*/
select mo_id, mo_title, mo_box_office, mo_active, mo_date_of_launch, mo_genre, mo_has_teaser from moviecruiser.movies where mo_active='Yes' and mo_date_of_launch>(select curdate());

/*SQL query to get a movies based on Movies Id*/
select mo_id, mo_title, mo_box_office, mo_active, mo_date_of_launch, mo_genre, mo_has_teaser from moviecruiser.movies where mo_id='1';

/*Update SQL movies table to update all the columns values based on Movies Id*/
update movies
set
mo_title='Jumanji',
mo_box_office='1548798258',
mo_active='Yes',
mo_date_of_launch='2020-07-23',
mo_genre='Fantasy',
mo_has_teaser='No'
where
mo_id='1';

/*Add to favorites*/
INSERT INTO `moviecruiser`.`favorites` (`fs_id`, `fs_us_id`, `fs_mo_id`) VALUES ('1', '1', '1');
INSERT INTO `moviecruiser`.`favorites` (`fs_id`, `fs_us_id`, `fs_mo_id`) VALUES ('2', '1', '3');
INSERT INTO `moviecruiser`.`favorites` (`fs_id`, `fs_us_id`, `fs_mo_id`) VALUES ('3', '1', '5');


/*SQL query to get all movies in a particular user’s favorites*/
select mo_title, mo_box_office, mo_active, mo_date_of_launch, mo_genre, mo_has_teaser from  moviecruiser.movies 
inner join  moviecruiser.favorites on fs_mo_id=mo_id
where fs_us_id=1;

/*SQL query to remove a movies from favorites based on User Id and Movies Id*/
delete from  moviecruiser.favorites where fs_us_id=1 and fs_mo_id=1;
select mo_id, mo_title, mo_box_office, mo_active, mo_date_of_launch, mo_genre, mo_has_teaser from  moviecruiser.favorites;

/*SQL query to get the number of favorites in a particular user’s favorites*/
SELECT count(mo_id) as no_of_Favorites FROM moviecruiser.movies
inner join moviecruiser.favorites
on fs_mo_id=mo_id where fs_us_id=1; 
