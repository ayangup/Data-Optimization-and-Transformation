-- This statement checks if the data base called RestaurantDB exists or not, if it exists then the database gets dropped/removed.
DROP DATABASE IF EXISTS RestaurantDB;

-- This statement creates the database called RestaurantDB
CREATE DATABASE RestaurantDB;

-- This statement uses or selects RestaurantDB database to perform operations on.
USE RestaurantDB;

-- SECTION 2

-- This makes sure that the tables are dropped before creating it to prevent errors if the table already exists.
DROP TABLE IF EXISTS Customer_Review;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS Cuisine_Type;
DROP TABLE IF EXISTS Location;

/** Creates the table called Location, this table consists of attributes with specific data type like VARCHAR, INT 
and constraints like if it is UNIQUE, NOT NULL, AUTO_INCREMENT, CHECK etc. Some of the attributes are also assigned as 
keys like Primary and Foreign keys */

CREATE TABLE Location(
	location_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    city VARCHAR(100) NOT NULL,
    neighborhood VARCHAR(100) NOT NULL,
    zip_code VARCHAR(100) NOT NULL CHECK(LENGTH(zip_code) = 6)
);

/** Creates the table called Cuisine_Type this table consists of attributes with specific data type like VARCHAR, INT 
and constraints like if it is UNIQUE, NOT NULL, AUTO_INCREMENT etc. Some of the attributes are also assigned as 
keys like Primary and Foreign keys */

CREATE TABLE Cuisine_Type(
	type_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    type_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

/** Creates the table called Restaurant, this table consists of attributes with specific data type like VARCHAR, INT 
and constraints like if it is UNIQUE, NOT NULL, AUTO_INCREMENT, CHECK etc. Some of the attributes are also assigned as 
keys like Primary and Foreign keys */

CREATE TABLE Restaurant(
	restaurant_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    name VARCHAR(100) NOT NULL,
    online_order VARCHAR(100) NOT NULL,
    book_table VARCHAR(100) NOT NULL,
    approx_cost INT NOT NULL CHECK (approx_cost > 0),
    location_id INT NOT NULL,
    type_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (type_id) REFERENCES Cuisine_Type(type_id)
);

/** Creates the table called Customer_Review, this table consists of attributes with specific data type like 
VARCHAR, INT, FLOAT and constraints like if it is UNIQUE, NOT NULL, AUTO_INCREMENT, CHECK etc. Some of the 
attributes are also assigned as keys like Primary and Foreign keys */

CREATE TABLE Customer_Review(
	review_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    restaurant_id INT NOT NULL,
    rating FLOAT CHECK (rating BETWEEN 0.0 AND 5.0),
    votes INT CHECK (votes >= 0),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Inserts data into the table Location
INSERT INTO Location(city, neighborhood, zip_code) VALUES
('New York', 'Manhattan', '100001'),
('Los Angeles', 'Downtown', '900012'),
('Chicago', 'Loop', '606001'),
('San Francisco', 'Mission District', '941102'),
('Houston', 'Midtown', '770022'),
('Miami', 'South Beach', '331392'),
('Seattle', 'Capitol Hill', '981022'),
('Boston', 'Back Bay', '021162'),
('Denver', 'LoDo', '802022'),
('Austin', 'Downtown', '787012'),
('Atlanta', 'Buckhead', '303052'),
('Dallas', 'Deep Ellum', '752262'),
('Las Vegas', 'The Strip', '891092'),
('San Diego', 'Gaslamp Quarter', '921012'),
('Philadelphia', 'Center City', '191022'),
('Phoenix', 'Downtown', '850042'),
('San Antonio', 'River Walk', '782052'),
('San Jose', 'Downtown', '951132'),
('Jacksonville', 'Southbank', '322022'),
('Fort Worth', 'Cultural District', '761072'),
('Columbus', 'Short North', '432152'),
('Charlotte', 'Uptown', '282022'),
('Indianapolis', 'Downtown', '462042'),
('San Francisco', 'North Beach', '941332'),
('Seattle', 'Belltown', '981212'),
('Denver', 'Highlands', '802112'),
('Washington', 'Georgetown', '200072'),
('Boston', 'Beacon Hill', '021082'),
('El Paso', 'Downtown', '799012'),
('Nashville', 'Downtown', '372032'),
('Oklahoma City', 'Bricktown', '731042'),
('Las Vegas', 'Downtown', '891012'),
('Portland', 'Pearl District', '972092'),
('Detroit', 'Midtown', '482012'),
('Memphis', 'Downtown', '381032'),
('Louisville', 'Downtown', '402022'),
('Milwaukee', 'Third Ward', '532022'),
('Albuquerque', 'Downtown', '871042'),
('Tucson', 'Downtown', '857012'),
('Fresno', 'Downtown', '937212'),
('Sacramento', 'Midtown', '958142'),
('Kansas City', 'Power & Light', '641062'),
('Long Beach', 'Downtown', '908022'),
('Mesa', 'Downtown', '852012'),
('Virginia Beach', 'Oceanfront', '234512'),
('Atlanta', 'Midtown', '303082'),
('Colorado Springs', 'Downtown', '809032'),
('Raleigh', 'Downtown', '276012'),
('Omaha', 'Old Market', '681022'),
('Miami', 'Wynwood', '331272'),
('Oakland', 'Downtown', '946122'),
('Minneapolis', 'North Loop', '554012'),
('Tulsa', 'Blue Dome', '741032'),
('Cleveland', 'Downtown', '441132'),
('Wichita', 'Downtown', '672022'),
('Arlington', 'Downtown', '760102'),
('New Orleans', 'French Quarter', '701122'),
('Bakersfield', 'Downtown', '933012'),
('Tampa', 'Downtown', '336022'),
('Honolulu', 'Waikiki', '968152'),
('Anaheim', 'Downtown', '928052'),
('Santa Ana', 'Downtown', '927012'),
('Corpus Christi', 'Downtown', '784012'),
('Riverside', 'Downtown', '925012'),
('Lexington', 'Downtown', '405072'),
('Stockton', 'Downtown', '952022'),
('Henderson', 'Downtown', '890022'),
('Saint Paul', 'Downtown', '551022'),
('Cincinnati', 'Over-the-Rhine', '452022'),
('Greensboro', 'Downtown', '274012'),
('Pittsburgh', 'Downtown', '152222'),
('St. Louis', 'Downtown', '631022'),
('Lincoln', 'Haymarket', '685082'),
('Anchorage', 'Downtown', '995012'),
('Plano', 'Downtown', '750742'),
('Orlando', 'Downtown', '328012'),
('Irvine', 'Business District', '926182'),
('Newark', 'Downtown', '071022'),
('Durham', 'Downtown', '277012'),
('Chula Vista', 'Downtown', '919102'),
('Toledo', 'Downtown', '436042'),
('Fort Wayne', 'Downtown', '468022'),
('St. Petersburg', 'Downtown', '337012'),
('Laredo', 'Downtown', '780402'),
('Jersey City', 'Downtown', '073022'),
('Madison', 'Downtown', '537032'),
('Chandler', 'Downtown', '852252'),
('Buffalo', 'Downtown', '142032'),
('Lubbock', 'Downtown', '794012'),
('Scottsdale', 'Downtown', '852512'),
('Reno', 'Downtown', '895012'),
('Glendale', 'Downtown', '853012'),
('Gilbert', 'Downtown', '852342'),
('Winston-Salem', 'Downtown', '271012'),
('North Las Vegas', 'Downtown', '890302'),
('Norfolk', 'Downtown', '235102'),
('Chesapeake', 'Downtown', '233202'),
('Garland', 'Downtown', '750402'),
('Irving', 'Downtown', '750382'),
('Hialeah', 'Downtown', '330122'),
('Fremont', 'Downtown', '945382'),
('Boise', 'Downtown', '837022'),
('Richmond', 'Downtown', '232192'),
('Baton Rouge', 'Downtown', '708022'),
('Spokane', 'Downtown', '992012'),
('Des Moines', 'Downtown', '503092');

-- Inserts data into the table Cuisine_Type
INSERT INTO Cuisine_Type(type_name, description) VALUES
('Italian', 'Traditional Italian cuisine'),
('Mexican', 'Spicy and flavorful dishes'),
('Indian', 'Richly spiced traditional dishes'),
('Chinese', 'Authentic Chinese flavors'),
('Japanese', 'Sushi, Ramen, and more'),
('French', 'Elegant French cuisine'),
('Mediterranean', 'Fresh and healthy meals'),
('Thai', 'Spicy and aromatic dishes'),
('Korean', 'BBQ and traditional Korean dishes'),
('Vietnamese', 'Pho, Banh Mi, and more'),
('American', 'Classic American comfort food'),
('Greek', 'Authentic Greek dishes'),
('Spanish', 'Tapas and traditional Spanish food'),
('Brazilian', 'Grilled meats and Brazilian specialties'),
('Caribbean', 'Tropical flavors and seafood'),
('Lebanese', 'Middle Eastern flavors and mezze'),
('Turkish', 'Rich Ottoman cuisine traditions'),
('Russian', 'Hearty Eastern European dishes'),
('German', 'Bratwurst, pretzels and beer'),
('British', 'Traditional pub fare'),
('Irish', 'Hearty stews and seafood'),
('Scottish', 'Whisky and haggis'),
('Welsh', 'Cheese and lamb specialties'),
('Polish', 'Pierogi and hearty soups'),
('Hungarian', 'Goulash and paprika-spiced dishes'),
('Czech', 'Beer and dumplings'),
('Austrian', 'Wiener schnitzel and pastries'),
('Swiss', 'Fondue and chocolate'),
('Belgian', 'Mussels and waffles'),
('Dutch', 'Cheese and pancakes'),
('Scandinavian', 'Smorgasbord and seafood'),
('Portuguese', 'Bacalhau and custard tarts'),
('Moroccan', 'Tagine and couscous'),
('Egyptian', 'Ful medames and koshari'),
('Ethiopian', 'Injera and spicy stews'),
('South African', 'Braai and bobotie'),
('Australian', 'Meat pies and seafood'),
('New Zealand', 'Lamb and seafood'),
('Argentinian', 'Asado and empanadas'),
('Peruvian', 'Ceviche and potatoes'),
('Chilean', 'Seafood and wine'),
('Colombian', 'Arepas and bandeja paisa'),
('Venezuelan', 'Arepas and tequeños'),
('Ecuadorian', 'Ceviche and llapingachos'),
('Bolivian', 'Salteñas and silpancho'),
('Paraguayan', 'Chipa and sopa paraguaya'),
('Uruguayan', 'Asado and chivito'),
('Cuban', 'Ropa vieja and mojitos'),
('Dominican', 'Mangú and sancocho'),
('Puerto Rican', 'Mofongo and lechón'),
('Jamaican', 'Jerk chicken and patties'),
('Haitian', 'Griot and soup joumou'),
('Bahamian', 'Conch and johnnycake'),
('Barbadian', 'Flying fish and cou-cou'),
('Trinidadian', 'Doubles and roti'),
('Guyanese', 'Pepperpot and roti'),
('Surinamese', 'Pom and roti'),
('Belizean', 'Rice and beans and stew chicken'),
('Costa Rican', 'Gallo pinto and casado'),
('Panamanian', 'Sancocho and hojaldras'),
('Nicaraguan', 'Gallo pinto and nacatamal'),
('Honduran', 'Baleadas and sopa de caracol'),
('Salvadoran', 'Pupusas and yuca frita'),
('Guatemalan', 'Pepián and tamales'),
('Canadian', 'Poutine and maple syrup'),
('Alaskan', 'Salmon and king crab'),
('Hawaiian', 'Poke and kalua pig'),
('Cajun', 'Gumbo and jambalaya'),
('Creole', 'Red beans and rice'),
('Southern', 'Fried chicken and biscuits'),
('Tex-Mex', 'Fajitas and queso'),
('Southwestern', 'Chili and cornbread'),
('Californian', 'Avocado and fresh produce'),
('Pacific Northwest', 'Salmon and berries'),
('Midwestern', 'Casseroles and hotdish'),
('New England', 'Clam chowder and lobster'),
('Pennsylvania Dutch', 'Shoofly pie and scrapple'),
('Amish', 'Homestyle comfort food'),
('Soul Food', 'Collard greens and cornbread'),
('Jewish', 'Matzo ball soup and latkes'),
('Kosher', 'Dietary law-compliant cuisine'),
('Vegetarian', 'Plant-based dishes'),
('Vegan', 'No animal products'),
('Gluten-Free', 'No gluten ingredients'),
('Paleo', 'Caveman-style diet'),
('Keto', 'Low-carb, high-fat'),
('Low-Carb', 'Reduced carbohydrate'),
('Low-Fat', 'Reduced fat content'),
('Organic', 'Certified organic ingredients'),
('Farm-to-Table', 'Locally sourced ingredients'),
('Fusion', 'Combination of cuisines'),
('Molecular Gastronomy', 'Scientific cooking techniques'),
('Haute Cuisine', 'High-end gourmet dining'),
('Bistro', 'Casual French-style eatery'),
('Brasserie', 'French-style brewery restaurant'),
('Steakhouse', 'Premium cuts of beef'),
('Seafood', 'Fresh ocean catches'),
('Barbecue', 'Slow-cooked smoked meats'),
('Diner', 'Classic American comfort food'),
('Gastropub', 'High-end pub fare'),
('Tapas', 'Spanish-style small plates'),
('Izakaya', 'Japanese-style pub food'),
('Ramen', 'Japanese noodle soup'),
('Sushi', 'Japanese raw fish dishes'),
('Dim Sum', 'Chinese small plates'),
('Street Food', 'Casual quick-service fare');

-- Inserts data into the table Restaurant
INSERT INTO Restaurant(name, online_order, book_table, approx_cost, location_id, type_id) VALUES
('Jalsa', 'Yes', 'Yes', 800, 1, 1),
('Spice Elephant', 'Yes', 'No', 800, 2, 2),
('San Churro Cafe', 'Yes', 'No', 800, 3, 3),
('Addhuri Udupi Bhojana', 'No', 'No', 300, 4, 4),
('Grand Village', 'No', 'No', 600, 5, 5),
('Timepass Dinner', 'Yes', 'No', 600, 6, 6),
('Rosewood International Hotel - Bar & Restaurant', 'No', 'No', 800, 7, 7),
('Onesta', 'Yes', 'Yes', 600, 8, 8),
('Penthouse Cafe', 'Yes', 'No', 700, 9, 9),
('Smacznego', 'Yes', 'No', 550, 10, 10),
('Village Café', 'Yes', 'No', 500, 11, 11),
('Cafe Shuffle', 'Yes', 'Yes', 600, 12, 12),
('The Coffee Shack', 'Yes', 'Yes', 500, 13, 13),
('Caf-Eleven', 'No', 'No', 450, 14, 14),
('San Churro Cafe', 'Yes', 'No', 800, 15, 15),
('Cafe Vivacity', 'Yes', 'No', 650, 16, 16),
('Catch-up-ino', 'Yes', 'No', 800, 17, 17),
('Kirthi''s Biryani', 'Yes', 'No', 700, 18, 18),
('T3H Cafe', 'No', 'No', 300, 19, 19),
('360 Atoms Restaurant And Cafe', 'Yes', 'No', 400, 20, 20),
('The Vintage Cafe', 'Yes', 'No', 400, 21, 21),
('Woodee Pizza', 'Yes', 'No', 500, 22, 22),
('Cafe Coffee Day', 'No', 'No', 900, 23, 23),
('My Tea House', 'Yes', 'No', 600, 24, 24),
('Hide Out Cafe', 'No', 'No', 300, 25, 25),
('CAFE NOVA', 'No', 'No', 600, 26, 26),
('Coffee Tindi', 'Yes', 'No', 200, 27, 27),
('Sea Green Cafe', 'No', 'No', 500, 28, 28),
('Cuppa', 'No', 'No', 550, 29, 29),
('Srinathji''s Cafe', 'No', 'No', 550, 30, 30),
('Redberrys', 'Yes', 'No', 600, 31, 31),
('Foodiction', 'Yes', 'No', 500, 32, 32),
('Sweet Truth', 'Yes', 'No', 500, 33, 33),
('Ovenstory Pizza', 'Yes', 'No', 750, 34, 34),
('Faasos', 'Yes', 'No', 500, 35, 35),
('Behrouz Biryani', 'Yes', 'No', 650, 36, 36),
('Fast And Fresh', 'Yes', 'No', 400, 37, 37),
('Szechuan Dragon', 'Yes', 'No', 600, 38, 38),
('Empire Restaurant', 'Yes', 'No', 750, 39, 39),
('Maruthi Davangere Benne Dosa', 'Yes', 'No', 150, 40, 40),
('Chaatimes', 'Yes', 'No', 200, 41, 41),
('Havyaka Mess', 'No', 'No', 300, 42, 42),
('McDonald''s', 'Yes', 'No', 500, 43, 43),
('Domino''s Pizza', 'Yes', 'No', 800, 44, 44),
('Onesta', 'Yes', 'Yes', 600, 45, 45),
('Hotboxit', 'No', 'No', 400, 46, 46),
('Kitchen Garden', 'Yes', 'No', 300, 47, 47),
('Recipe', 'Yes', 'No', 450, 48, 48),
('Beijing Bites', 'Yes', 'No', 850, 49, 49),
('Tasty Bytes', 'Yes', 'No', 300, 50, 50),
('Petoo', 'No', 'No', 450, 51, 51),
('Shree Cool Point', 'Yes', 'No', 150, 52, 52),
('Corner House Ice Cream', 'No', 'No', 400, 53, 53),
('Biryanis And More', 'Yes', 'No', 750, 54, 54),
('Roving Feast', 'No', 'No', 450, 55, 55),
('FreshMenu', 'Yes', 'No', 450, 56, 56),
('Banashankari Donne Biriyani', 'Yes', 'No', 300, 57, 57),
('Wamama', 'Yes', 'Yes', 800, 58, 58),
('Five Star Chicken', 'No', 'No', 200, 59, 59),
('XO Belgian Waffle', 'Yes', 'No', 400, 60, 60),
('Peppy Peppers', 'No', 'No', 800, 61, 61),
('Goa 0 Km', 'Yes', 'Yes', 800, 62, 62),
('Chinese Kitchen', 'Yes', 'No', 150, 63, 63),
('Jeet Restaurant', 'No', 'Yes', 850, 64, 64),
('Cake of the Day', 'No', 'No', 150, 65, 65),
('Kabab Magic', 'Yes', 'No', 400, 66, 66),
('Namma Brahmin''s Idli', 'Yes', 'No', 100, 67, 67),
('Gustoes Beer House', 'No', 'No', 700, 68, 68),
('Sugar Rush', 'No', 'No', 300, 69, 69),
('Burger King', 'Yes', 'No', 600, 70, 70),
('The Good Bowl', 'Yes', 'No', 500, 71, 71),
('The Biryani Cafe', 'No', 'No', 300, 72, 72),
('Spicy Tandoor', 'No', 'No', 150, 73, 73),
('LSD Cafe', 'No', 'No', 700, 74, 74),
('Rolls On Wheels', 'No', 'No', 300, 75, 75),
('Om Sri Vinayaka Chats', 'No', 'No', 500, 76, 76),
('Sri Guru Kottureshwara Davangere Benne Dosa', 'Yes', 'No', 150, 77, 77),
('Devanna Dum Biriyani Centre', 'Yes', 'No', 300, 78, 78),
('Kolbeh', 'No', 'No', 500, 79, 79),
('Upahar Sagar', 'No', 'No', 350, 80, 80),
('Kadalu Sea Food Restaurant', 'Yes', 'No', 500, 81, 81),
('Frozen Bottle', 'Yes', 'No', 400, 82, 82),
('Parimala Sweets', 'No', 'No', 200, 83, 83),
('Vaishali Deluxe', 'No', 'No', 700, 84, 84),
('Chill Out', 'No', 'No', 100, 85, 85),
('The Big O Bakes', 'No', 'No', 300, 86, 86),
('Meghana Foods', 'Yes', 'No', 600, 87, 87),
('Krishna Sagar', 'No', 'No', 200, 88, 88),
('Dessert Rose', 'No', 'No', 500, 89, 89),
('Chickpet Donne Biryani House', 'No', 'No', 250, 90, 90),
('Me And My Cake', 'No', 'No', 500, 91, 91),
('Sunsadm', 'No', 'No', 400, 92, 92),
('Annapooraneshwari Mess', 'No', 'No', 200, 93, 93),
('Thanco''s Natural Ice Creams', 'No', 'No', 300, 94, 94),
('Nandhini Deluxe', 'No', 'No', 600, 95, 95),
('Vi Ra''s Bar and Restaurant', 'No', 'No', 800, 96, 96),
('Kaggis', 'No', 'No', 250, 97, 97),
('Ayda Persian Kitchen', 'No', 'No', 950, 98, 98),
('Chatar Patar', 'No', 'No', 300, 99, 99),
('Polar Bear', 'Yes', 'No', 400, 100, 100);


-- Inserts data into the table Customer_Review
INSERT INTO Customer_Review(restaurant_id, rating, votes, review_date) VALUES
(1, 4.1, 775, '2025-03-07'),
(2, 4.1, 787, '2025-03-07'),
(3, 3.8, 918, '2025-03-07'),
(4, 3.7, 88, '2025-03-07'),
(5, 3.8, 166, '2025-03-07'),
(6, 3.8, 286, '2025-03-07'),
(7, 3.6, 8, '2025-03-07'),
(8, 4.6, 2556, '2025-03-07'),
(9, 4.0, 324, '2025-03-07'),
(10, 4.2, 504, '2025-03-07'),
(11, 4.1, 402, '2025-03-07'),
(12, 4.2, 150, '2025-03-07'),
(13, 4.2, 164, '2025-03-07'),
(14, 4.0, 424, '2025-03-07'),
(15, 3.8, 918, '2025-03-07'),
(16, 3.8, 90, '2025-03-07'),
(17, 3.9, 133, '2025-03-07'),
(18, 3.8, 144, '2025-03-07'),
(19, 3.9, 93, '2025-03-07'),
(20, 3.1, 13, '2025-03-07'),
(21, 3.0, 62, '2025-03-07'),
(22, 3.7, 180, '2025-03-07'),
(23, 3.6, 28, '2025-03-07'),
(24, 3.6, 62, '2025-03-07'),
(25, 3.7, 31, '2025-03-07'),
(26, 3.2, 11, '2025-03-07'),
(27, 3.8, 75, '2025-03-07'),
(28, 3.3, 4, '2025-03-07'),
(29, 3.3, 23, '2025-03-07'),
(30, 3.8, 148, '2025-03-07'),
(31, 4.0, 219, '2025-03-07'),
(32, 2.8, 506, '2025-03-07'),
(33, 3.9, 35, '2025-03-07'),
(34, 3.9, 172, '2025-03-07'),
(35, 4.2, 415, '2025-03-07'),
(36, 3.9, 230, '2025-03-07'),
(37, 2.8, 91, '2025-03-07'),
(38, 4.2, 1647, '2025-03-07'),
(39, 4.4, 4884, '2025-03-07'),
(40, 4.0, 17, '2025-03-07'),
(41, 3.8, 133, '2025-03-07'),
(42, 3.9, 28, '2025-03-07'),
(43, 3.9, 286, '2025-03-07'),
(44, 3.9, 540, '2025-03-07'),
(45, 4.6, 2556, '2025-03-07'),
(46, 3.8, 36, '2025-03-07'),
(47, 3.6, 244, '2025-03-07'),
(48, 4.0, 804, '2025-03-07'),
(49, 3.7, 679, '2025-03-07'),
(50, 3.1, 245, '2025-03-07'),
(51, 3.7, 21, '2025-03-07'),
(52, 4.1, 28, '2025-03-07'),
(53, 4.3, 345, '2025-03-07'),
(54, 4.0, 618, '2025-03-07'),
(55, 4.0, 1047, '2025-03-07'),
(56, 3.9, 627, '2025-03-07'),
(57, 3.8, 104, '2025-03-07'),
(58, 4.2, 354, '2025-03-07'),
(59, 3.6, 55, '2025-03-07'),
(60, 3.7, 17, '2025-03-07'),
(61, 4.2, 244, '2025-03-07'),
(62, 3.6, 163, '2025-03-07'),
(63, 3.8, 58, '2025-03-07'),
(64, 4.0, 808, '2025-03-07'),
(65, 3.7, 78, '2025-03-07'),
(66, 4.1, 1720, '2025-03-07'),
(67, 3.6, 34, '2025-03-07'),
(68, 4.1, 868, '2025-03-07'),
(69, 3.8, 39, '2025-03-07'),
(70, 3.2, 71, '2025-03-07'),
(71, 3.6, 6, '2025-03-07'),
(72, 4.1, 520, '2025-03-07'),
(73, 4.1, 0, '2025-03-07'),
(74, 2.9, 84, '2025-03-07'),
(75, 3.6, 299, '2025-03-07'),
(76, 3.6, 0, '2025-03-07'),
(77, 4.1, 558, '2025-03-07'),
(78, 3.6, 28, '2025-03-07'),
(79, 3.7, 22, '2025-03-07'),
(80, 3.8, 39, '2025-03-07'),
(81, 3.8, 153, '2025-03-07'),
(82, 4.2, 146, '2025-03-07'),
(83, 3.5, 14, '2025-03-07'),
(84, 3.8, 42, '2025-03-07'),
(85, 3.8, 0, '2025-03-07'),
(86, 4.0, 66, '2025-03-07'),
(87, 4.4, 4401, '2025-03-07'),
(88, 3.5, 31, '2025-03-07'),
(89, 3.5, 7, '2025-03-07'),
(90, 3.7, 21, '2025-03-07'),
(91, 3.7, 0, '2025-03-07'),
(92, 3.7, 0, '2025-03-07'),
(93, 3.7, 0, '2025-03-07'),
(94, 3.2, 9, '2025-03-07'),
(95, 2.6, 283, '2025-03-07'),
(96, 3.3, 62, '2025-03-07'),
(97, 3.8, 64, '2025-03-07'),
(98, 3.7, 39, '2025-03-07'),
(99, 3.7, 65, '2025-03-07'),
(100, 3.8, 71, '2025-03-07');



-- PART 3(b)
-- SECTION 1 CHANGES WERE MADE ABOVE

-- SECTION 2

-- Procedure 1
/**
This procedure is called UpdateRestaurantFeature, its purpose is to update 
the restaurant's option for online ordering, for booking table and it increments
the vote counts.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateRestaurantFeatures$$
CREATE PROCEDURE UpdateRestaurantFeatures(
    IN p_restaurant_id INT,
    IN p_online_order VARCHAR(3),
    IN p_book_table VARCHAR(3))
BEGIN
    DECLARE vote_count INT;
    
    START TRANSACTION;
    
    SELECT COUNT(*) INTO vote_count
    FROM Restaurant
    WHERE restaurant_id = p_restaurant_id;
    
    IF vote_count = 0 THEN
        ROLLBACK; -- If the restaurant doesn't exist, then undo all the changes.
    ELSE
        UPDATE Restaurant -- This changes the status of the online order and booking tables.
        SET online_order = p_online_order,
            book_table = p_book_table
        WHERE restaurant_id = p_restaurant_id;
        
        UPDATE Customer_Review -- This increased the vote count for all the reviews of this restaurant.
        SET votes = votes + 1
        WHERE restaurant_id = p_restaurant_id;
        
        COMMIT; -- Saves the changes, if there are no errors.
    END IF;
END$$
DELIMITER ;

-- Procedure 2
/**
This procedure is called AddNewRestaurant, its purpose it to check if the provided 
location and the cuisine type exists. Also adds a new restaurant to the database.
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS AddNewRestaurant$$
CREATE PROCEDURE AddNewRestaurant(
    IN p_name VARCHAR(100),
    IN p_online_order VARCHAR(10),
    IN p_book_table VARCHAR(10),
    IN p_approx_cost INT,
    IN p_location_id INT,
    IN p_type_id INT)
BEGIN
    DECLARE valid_location INT DEFAULT 0;
    DECLARE valid_type INT DEFAULT 0;
    
    START TRANSACTION;
    
    SELECT COUNT(*) INTO valid_location -- This checks if the provided location exists.
    FROM Location
    WHERE location_id = p_location_id;
    
    SELECT COUNT(*) INTO valid_type -- This checks if the provided cuisine type exists.
    FROM Cuisine_Type
    WHERE type_id = p_type_id;
    
    IF p_approx_cost <= 0 OR valid_location = 0 OR valid_type = 0 THEN
        ROLLBACK; -- IF the cost is invalid or location or cuisine type is invalid or if it doesn't exist, then undo all changes.
    ELSE
        INSERT INTO Restaurant(name, online_order, book_table, approx_cost, location_id, type_id)
        VALUES (p_name, p_online_order, p_book_table, p_approx_cost, p_location_id, p_type_id);
        
        COMMIT;
    END IF;
END$$
DELIMITER ;


CALL UpdateRestaurantFeatures(1, 'No', 'Yes');
SELECT * FROM Restaurant WHERE restaurant_id = 1;
SELECT * FROM Customer_Review WHERE restaurant_id = 1;

CALL UpdateRestaurantFeatures(999, 'No', 'Yes');

CALL AddNewRestaurant('New Pizza Place', 'Yes', 'No', 500, 1, 1);
SELECT * FROM Restaurant ORDER BY restaurant_id DESC LIMIT 1;


CALL AddNewRestaurant('Invalid Cost', 'Yes', 'No', 0, 1, 1); 
CALL AddNewRestaurant('Invalid Location', 'Yes', 'No', 500, 999, 1);
CALL AddNewRestaurant('Invalid Type', 'Yes', 'No', 500, 1, 999);


-- SECTION 3

-- Query 1
SELECT name, approx_cost, approx_cost * 1.5 AS cost_after_tax
FROM Restaurant
WHERE online_order = 'Yes';

-- Query 2
SELECT r.name AS Restaurant, c.type_name AS Cuisine
FROM Restaurant r
INNER JOIN Cuisine_Type c ON r.type_id = c.type_id;

-- Query 3
SELECT rating, COUNT(review_id) AS Total_Reviews
FROM Customer_Review
GROUP BY rating
ORDER BY rating DESC;

-- Query 4
SELECT r.name, avg_ratings.rating 
FROM Restaurant r
INNER JOIN (SELECT restaurant_id, rating FROM Customer_Review) AS avg_ratings
ON r.restaurant_id = avg_ratings.restaurant_id
LIMIT 10;
            
-- Query 5
DROP VIEW IF EXISTS RestaurantView;
CREATE VIEW RestaurantView AS 
SELECT r.restaurant_id, r.name AS Restaurant_name, c.type_name AS Cuisine_type,
	CASE
		WHEN r.approx_cost < 500 
			THEN 'Cheap'
			ELSE 'Not Cheap'
	END AS price_category
FROM Restaurant r
INNER JOIN Cuisine_Type c ON r.type_id = c.type_id;

SELECT * FROM RestaurantView LIMIT 10;

UPDATE Restaurant 
SET approx_cost = 600
WHERE restaurant_id = 1;

SELECT * FROM RestaurantView
WHERE restaurant_id = 1;

