/*Insert items in menu_item table*/
INSERT INTO `truyum`.`menu_item` (`me_id`, `me_name`, `me_price`, `me_active`, `me_date_of_launch`, `me_category`, `me_free_delivery`) VALUES ('1', 'Sandwich', '99.00', 'Yes', '2019-04-23', 'Main Course', 'Yes');
INSERT INTO `truyum`.`menu_item` (`me_id`, `me_name`, `me_price`, `me_active`, `me_date_of_launch`, `me_category`, `me_free_delivery`) VALUES ('2', 'Burger', '129.00', 'Yes', '2019-12-23', 'Main Course', 'No');
INSERT INTO `truyum`.`menu_item` (`me_id`, `me_name`, `me_price`, `me_active`, `me_date_of_launch`, `me_category`, `me_free_delivery`) VALUES ('3', 'Pizza', '149.00', 'Yes', '2020-01-10', 'Main Course', 'No');
INSERT INTO `truyum`.`menu_item` (`me_id`, `me_name`, `me_price`, `me_active`, `me_date_of_launch`, `me_category`, `me_free_delivery`) VALUES ('4', 'French Fries', '57.00', 'No', '2021-02-04', 'Starters', 'Yes');
INSERT INTO `truyum`.`menu_item` (`me_id`, `me_name`, `me_price`, `me_active`, `me_date_of_launch`, `me_category`, `me_free_delivery`) VALUES ('5', 'Chocolate Brownie', '32.00', 'Yes', '2022-02-17', 'Dessert', 'Yes');

/*Insert user*/
INSERT INTO `truyum`.`user` (`us_id`, `us_name`) VALUES ('1', 'Kathy');
INSERT INTO `truyum`.`user` (`us_id`, `us_name`) VALUES ('2', 'Mishika');

/*Query to get all menu item*/
select * from truyum.menu_item;

/*SQL query to get all menu items which after launch date and is active*/
select * from truyum.menu_item where me_active='Yes' and me_date_of_launch>(select curdate());

/*SQL query to get a menu items based on Menu Item Id*/
select * from truyum.menu_item where me_id='1';
user
/*Update SQL menu_items table to update all the columns values based on Menu Item Id*/
update menu_item
set
me_name='Pasta',
me_price='60.00',
me_active='Yes',
me_date_of_launch='2020-07-23',
me_category='Starter',
me_free_delivery='No'
where
me_id='1';

/*Add to cart */
INSERT INTO `truyum`.`cart` (`ct_id`, `ct_us_id`, `ct_me_id`) VALUES ('1', '1', '1');
INSERT INTO `truyum`.`cart` (`ct_id`, `ct_us_id`, `ct_me_id`) VALUES ('2', '1', '3');
INSERT INTO `truyum`.`cart` (`ct_id`, `ct_us_id`, `ct_me_id`) VALUES ('3', '1', '5');

/*SQL query to get all menu items in a particular user’s cart*/
select me_name, me_price, me_active, me_date_of_launch, me_category, me_free_delivery from truyum.menu_item
inner join truyum.cart on ct_me_id=me_id
where ct_us_id=1;

/*SQL query to get the total price of all menu items in a particular user’s cart*/
select sum(me_price) as Total from truyum.menu_item
inner join truyum.cart on ct_me_id=me_id
where ct_us_id=1;

/*SQL query to remove a menu items from Cart based on User Id and Menu Item Id*/
delete from truyum.cart where ct_us_id=1 and ct_me_id=1;
select * from truyum.cart;
