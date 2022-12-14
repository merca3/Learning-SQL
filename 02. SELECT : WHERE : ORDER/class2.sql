--Phone Model
create table PhoneModel(
PhoneModel_ID int primary key not null,
Manufacturer nvarchar(30) not null,
Model nvarchar(30) not null,
ModelYear numeric(4,0)
);
--Carrier
create table Carrier(
Carrier_ID int primary key not null,
CarrierName nvarchar(30) not null
);
--USER
create table Networkuser(
Username varchar(30) primary key not null,
Password nvarchar(30) not null
);
--Travel method type
create table TravelMethodType(
Travelmethodtype_ID int primary key not null,
Type nvarchar(30) not null
);
--Feedback
create table Feedback(
Feedback_ID int primary key not null,
UserName varchar(30) ,
Rating int, 
Notes nvarchar(500), 
EntryDate date,
constraint username_fk foreign key (UserName) references Networkuser(UserName)
);
--Place Type
create table PlaceType(
PlaceType_ID int primary key not null,
PlaceName varchar(30)
);
--Place
create table Place(
Place_ID int primary key not null,
City nvarchar(30),
State nvarchar(30),
ZIP nvarchar(10),
Country nvarchar(20)
);
--Geographic place
create table GeographicPlace(
Place_ID int primary key not null,
Latitude numeric(9,6),
Longitude numeric(9,6),
constraint Geoplace_fk foreign key (Place_ID) references Place(Place_ID)
);
--Place of Interest
create table PlaceOfInterest(
Place_ID int primary key not null,
Name nvarchar(200),
Description nvarchar(500),
Type_ID int,
constraint InterestPlacepk_fk foreign key (Place_ID) references Place(Place_ID),
constraint InterestPlaceType_fk foreign key (Type_ID) references PlaceType(PlaceType_ID)
);
--PlaceFeedback
create table PlaceFeedback(
PlaceFeedback_ID int primary key not null,
Place_ID int,
Feedback_ID int,
constraint PFPlace_fk foreign key (Place_ID) references PlaceOfInterest(Place_ID),
constraint PFFeedback_fk foreign key (Feedback_ID) references Feedback(Feedback_ID)
);
--Network Quality
create table NetworkQuality(
Quality_ID int primary key not null,
Phone_ID int, 
Carrier_ID int, 
Username varchar(30), 
Place_ID int, 
Quality int, 
Notes nvarchar(500), 
EntryDate Date,
constraint NQPlace_fk foreign key (Place_ID) references GeographicPlace(Place_ID),
constraint NQCarrier_fk foreign key (Carrier_ID) references Carrier(Carrier_ID),
constraint NQPhone_fk foreign key (Phone_ID) references PhoneModel(PhoneModel_ID),
constraint NQUsername_fk foreign key (Username) references Networkuser(Username)
);
--Travel Method
create table TravelMethod(
TM_ID int primary key not null, 
From_ID int, 
To_ID int, 
Username varchar(30), 
EntryDate Date, 
Travelmethodtype_ID int, 
Rating int, 
Notes nvarchar(500),
constraint TMFrom_fk foreign key (From_ID) references PlaceOfInterest(Place_ID),
constraint TMTo_fk foreign key (To_ID) references PlaceOfInterest(Place_ID),
constraint TMMethodType_fk foreign key (Travelmethodtype_ID) references TravelMethodType(Travelmethodtype_ID),
constraint TMUsername_fk foreign key (Username) references Networkuser(Username)
);

--Phonemodel
insert into Phonemodel values(98701 , 'Apple', 'Iphone 8', 2016);
insert into Phonemodel values(98702 , 'Samsung', 'Galaxy S10', 2017);
insert into Phonemodel values(98703 , 'Apple', 'Iphone X', 2018);
insert into Phonemodel values(98704 , 'HTC', 'U12 Plus', 2014);
insert into Phonemodel values(98705 , 'Google', 'Pixel 4', 2019);
insert into Phonemodel values(98706 , 'OnePlus', '7 Pro', 2019);
insert into Phonemodel values(98707 , 'Alcatel', 'Go Flip 3', 2019);
insert into Phonemodel values(98708 , 'Motorola', 'Moto G7 Power', 2019);
insert into Phonemodel values(98709 , 'Apple', 'Iphone 11', 2019);
insert into Phonemodel values(98710 , 'Blackberry', 'Key2 LE', 2019);
insert into Phonemodel values(98711 , 'Huawei', 'P30 Pro', 2019);
insert into Phonemodel values(98712 , 'Samsung', 'Galaxy S9', 2018);
insert into Phonemodel values(98713 , 'Google ', 'Pixel 3', 2018);
insert into Phonemodel values(98714 , 'Motorola', 'moto Z4', 2019);
insert into Phonemodel values(98715 , 'LG ', 'G6', 2016);
insert into Phonemodel values(98716 , 'LG', 'G8 ThinQ', 2017);
insert into Phonemodel values(98717 , 'LG', 'G8X ThinQ', 2017);
insert into Phonemodel values(98718 , 'LG', 'Stylo 4', 2017);
insert into Phonemodel values(98719 , 'LG', 'Stylo 5', 2019);
insert into Phonemodel values(98720 , 'LG', 'V30', 2017);
insert into Phonemodel values(98721 , 'LG', 'V35 ThinQ', 2018);
insert into Phonemodel values(98722 , 'LG', 'V40 ThinQ', 2019);
insert into Phonemodel values(98723 , 'Google', 'Pixel 4 XL', 2019);
insert into Phonemodel values(98724 , 'Samsung', 'Galaxy A10', 2016);
insert into Phonemodel values(98725 , 'Samsung', 'Galaxy A20', 2017);
insert into Phonemodel values(98726 , 'Samsung', 'Galaxy A50', 2018);
insert into Phonemodel values(98727 , 'Samsung', 'Galaxy A6', 2019);
insert into Phonemodel values(98728 , 'Samsung', 'Galaxy Fold', 2019);
insert into Phonemodel values(98729 , 'Samsung', 'Note10', 2018);
insert into Phonemodel values(98730 , 'Samsung', 'Note10+', 2019);

--Carrier
insert into carrier values(78001 , 'AT&T');
insert into carrier values(78002 , 'Verizon');
insert into carrier values(78003 , 'Sprint');
insert into carrier values(78004 , 'T Mobile');
insert into carrier values(78005 , 'Cricket');
insert into carrier values(78006 , 'MobileNation');
insert into carrier values(78007 , 'IndigoWireless');
insert into carrier values(78008 , 'Pine Cellular');
insert into carrier values(78009 , 'Silver Star Communications');
insert into carrier values(78010 , 'RTC Communications');
insert into carrier values(78011 , 'Blaze Wireless');
insert into carrier values(78012 , 'Blue Wireless');
insert into carrier values(78013 , 'Bravado Wireless');
insert into carrier values(78014 , 'C Spire Wireless');
insert into carrier values(78015 , 'Carolina West Wireless');
insert into carrier values(78016 , 'CTC Wireless');
insert into carrier values(78017 , 'Evolve Broadband');
insert into carrier values(78018 , 'FTC Wireless');
insert into carrier values(78019 , 'Northwest Cell');
insert into carrier values(78020 , 'United Wireless');
insert into carrier values(78021 , 'Union Wireless');
insert into carrier values(78022 , 'Thumb Cellular');
insert into carrier values(78023 , 'West Central Wireless');
insert into carrier values(78024 , 'Boost Mobile');
insert into carrier values(78025 , 'XYZ Wireless');
insert into carrier values(78026 , 'ABC Wireless');
insert into carrier values(78027 , 'PQR Wireless');
insert into carrier values(78028 , 'TQR Wireless');
insert into carrier values(78029 , 'Tampnet');
insert into carrier values(78030 , 'Viaero Wireless');

--networkuser
insert into networkuser values('johndoe' , 'password!');
insert into networkuser values('marcsmith' , 'password123');
insert into networkuser values('tiger123' , 'password@123');
insert into networkuser values('andrewskeels' , 'bologna1');
insert into networkuser values('tushartiwari' , 'password12345');
insert into networkuser values('shreyagupta' , 'password23456');
insert into networkuser values('girtskarnitis' , 'password34567');
insert into networkuser values('anjaligupta1' , 'password45678');
insert into networkuser values('sakarsrivastava' , 'password56789');
insert into networkuser values('mohitsrivastava' , 'password67900');
insert into networkuser values('yashsaur' , 'password79011');
insert into networkuser values('abhishekgupta' , 'password90122');
insert into networkuser values('saurabhchanda' , 'password101233');
insert into networkuser values('marcjones' , 'password112344');
insert into networkuser values('aashnadave' , 'password123455');
insert into networkuser values('poojithabonda' , 'password134566');
insert into networkuser values('shreyachandak' , 'password145677');
insert into networkuser values('sarthakchak' , 'password156788');
insert into networkuser values('albyeapen' , 'password167899');
insert into networkuser values('jessiejones' , 'password179010');
insert into networkuser values('frankunderwood' , 'password190121');
insert into networkuser values('claire' , 'password201232');
insert into networkuser values('douglas' , 'password201233');
insert into networkuser values('michaelsmith' , 'password201234');
insert into networkuser values('anthonymark' , 'password201235');
insert into networkuser values('luisawoods' , 'password201236');
insert into networkuser values('jeremmy' , 'password201237');
insert into networkuser values('jake234' , 'password201238');
insert into networkuser values('Timhorton' , 'password201239');
insert into networkuser values('troypistachio' , 'fluffhead0710');

--travelmethodtype
insert into travelmethodtype values(45001 , 'Public Bus');
insert into travelmethodtype values(45002 , 'Personal Vehicle');
insert into travelmethodtype values(45003 , 'Rideshare');
insert into travelmethodtype values(45004 , 'Rental Car');
insert into travelmethodtype values(45005 , 'Train');
insert into travelmethodtype values(45006 , 'Charter Bus');
insert into travelmethodtype values(45007 , 'Bike');
insert into travelmethodtype values(45008 , 'Walk');
insert into travelmethodtype values(45009 , 'Subway');
insert into travelmethodtype values(45010 , 'School Bus');
insert into travelmethodtype values(45011 , 'Commericial Airline');
insert into travelmethodtype values(45012 , 'Boat');
insert into travelmethodtype values(45013 , 'Shuttle bus');
insert into travelmethodtype values(45014 , 'Private Jet');

--feedback
insert into feedback values(54001 , 'johndoe', 4, 'Great place', '2017.01.14');
insert into feedback values(54002 , 'marcsmith', 3, '', '2018.04.02');
insert into feedback values(54003 , 'tiger123', 4, 'Great', '2018.07.07');
insert into feedback values(54004 , 'andrewskeels', 4, 'Awesome Experience', '2019.01.01');
insert into feedback values(54005 , 'tushartiwari', 3, 'Nice place', '2015.02.04');
insert into feedback values(54006 , 'shreyagupta', 2, '', '2006.03.06');
insert into feedback values(54007 , 'girtskarnitis', 5, 'Worth a visit', '2017.04.06');
insert into feedback values(54008 , 'anjaligupta1', 3, 'Worth the trip', '2016.06.06');
insert into feedback values(54009 , 'sakarsrivastava', 1, 'Please save time and not go', '2015.05.05');
insert into feedback values(54010 , 'mohitsrivastava', 2, 'Poor', '2014.04.04');
insert into feedback values(54011 , 'yashsaur', 3, '', '2002.02.02');
insert into feedback values(54012 , 'abhishekgupta', 5, 'Lovely place', '2019.01.03');
insert into feedback values(54013 , 'saurabhchanda', 4, '', '2017.04.09');
insert into feedback values(54014 , 'johndoe', 2, 'Very expensive entry ticket', '2005.11.12');
insert into feedback values(54015 , 'aashnadave', 3, '', '2007.02.23');
insert into feedback values(54016 , 'poojithabonda', 5, 'Nice family place', '2009.04.05');
insert into feedback values(54017 , 'shreyachandak', 1, 'Terrible', '2018.03.02');
insert into feedback values(54018 , 'sarthakchak', 3, '', '2000.04.06');
insert into feedback values(54019 , 'albyeapen', 4, 'Poor', '2019.09.08');
insert into feedback values(54020 , 'jessiejones', 5, '', '2008.07.07');
insert into feedback values(54021 , 'frankunderwood', 2, '', '2004.02.04');
insert into feedback values(54022 , 'claire', 5, 'Great place', '2004.04.04');
insert into feedback values(54023 , 'douglas', 4, 'Fun place', '2008.05.07');
insert into feedback values(54024 , 'michaelsmith', 3, '', '2015.07.06');
insert into feedback values(54025 , 'anthonymark', 5, 'Absolutely loved it', '2018.08.09');
insert into feedback values(54026 , 'luisawoods', 5, 'Will recommend', '2005.09.09');
insert into feedback values(54027 , 'jeremmy', 4, 'Great', '2006.06.06');
insert into feedback values(54028 , 'jake234', 2, '', '2014.08.12');
insert into feedback values(54029 , 'Timhorton', 3, '', '2017.08.11');
insert into feedback values(54030 , 'troypistachio', 5, 'This has all been wonderful', '2018.12.31');

--placetype
insert into placetype values(98001 , 'Recreational - National Parks');
insert into placetype values(98002 , 'Lodging-Hotels');
insert into placetype values(98003 , 'Dining (Food, Drinks)');
insert into placetype values(98004 , 'Recreational - Monuments');
insert into placetype values(98005 , 'Recreational - Live Music');
insert into placetype values(98006 , 'Lodging - Camps');
insert into placetype values(98007 , 'Lodging- Air BnB');
insert into placetype values(98008 , 'Recreational- Sight Seeing');
insert into placetype values(98009 , 'Recreational- Lake, Boating');
insert into placetype values(98010 , 'Dining- Food');
insert into placetype values(98011 , 'Luxury Dining');
insert into placetype values(98012 , 'Recreational - Cannabis');
insert into placetype values(98013 , 'Recreational- Sports');
insert into placetype values(98014 , 'Recreational - Alcohol');
insert into placetype values(98015 , 'Recreational - Amusement Park');
insert into placetype values(98016 , 'Recreational- Water Park');
insert into placetype values(98017 , 'Recreational - Theater');
insert into placetype values(98018 , 'Recreational- Rock Climbing');
insert into placetype values(98019 , 'Recreational- Skiing');
insert into placetype values(98020 , 'Recreational- Hiking');
insert into placetype values(98021 , 'Recreational- Hunting');
insert into placetype values(98022 , 'Recreational- Fishing');
insert into placetype values(98023 , 'Recreational- Horseback Riding');
insert into placetype values(98024 , 'Recreational- Swimming');
insert into placetype values(98025 , 'Recreational- Shopping Center');
insert into placetype values(98026 , 'Recreational- Art Museum');
insert into placetype values(98027 , 'Recreational- White Water Raft');
insert into placetype values(98028 , 'Recreational- Birdwatching');
insert into placetype values(98029 , 'Recreational- Mountain Biking');
insert into placetype values(98030 , 'Recreational- Backpacking');

--place
insert into place values(17001 , 'Buffalo', 'New York', '14203', 'USA');
insert into place values(17002 , 'New York', 'New York', '10026', 'USA');
insert into place values(17003 , 'Boston', 'Massachusetts', '2122', 'USA');
insert into place values(17004 , 'New York', 'New York', '10022', 'USA');
insert into place values(17005 , 'Buffalo', 'New York', '14221', 'USA');
insert into place values(17006 , 'Boston', 'Massachusetts', '2145', 'USA');
insert into place values(17007 , 'New York', 'New York', '10020', 'USA');
insert into place values(17008 , 'Bangor', 'Maine', '4401', 'USA');
insert into place values(17009 , 'Camden', 'New Jearsey', '8100', 'USA');
insert into place values(17010 , 'New York', 'New York', '12670', 'USA');
insert into place values(17011 , 'Saratoga Springs', 'New York', '12866', 'USA');
insert into place values(17012 , 'Boston', 'Massachusetts', '3201', 'USA');
insert into place values(17013 , 'Scranton', 'Pennsylvania', '18577', 'USA');
insert into place values(17014 , 'New York', 'New York', '11860', 'USA');
insert into place values(17015 , 'Philadelphia', 'Pennsylvania', '19019', 'USA');
insert into place values(17016 , 'Boston', 'Massachusetts', '2145', 'USA');
insert into place values(17017 , 'Pittsburgh', 'Pennsylvania', '15106', 'USA');
insert into place values(17018 , 'New York', 'New York', '12401', 'USA');
insert into place values(17019 , 'Syracuse', 'New York', '13201', 'USA');
insert into place values(17020 , 'Pittsford', 'New York', '14534', 'USA');
insert into place values(17021 , 'New York', 'New York', '10041', 'USA');
insert into place values(17022 , 'Rochester', 'New York', '14618', 'USA');
insert into place values(17023 , 'New York', 'New York', '10078', 'USA');
insert into place values(17024 , 'Fairport', 'New York', '14450', 'USA');
insert into place values(17025 , 'New York', 'New York', '11008', 'USA');
insert into place values(17026 , 'Rochester', 'New York', '14602', 'USA');
insert into place values(17027 , 'New York', 'New York', '11001', 'USA');
insert into place values(17028 , 'Rochester', 'New York', '14602', 'USA');
insert into place values(17029 , 'New York', 'New York', '12890', 'USA');
insert into place values(17030 , 'Boston', 'Massachusetts', '2167', 'USA');

--placeofinterest
insert into placeofinterest values(17001 , 'Buffalo State Park', 'State Park', 98001);
insert into placeofinterest values(17002 , 'New York Central Park', 'Central Park', 98001);
insert into placeofinterest values(17003 , 'Boston State Park', 'State Park', 98001);
insert into placeofinterest values(17004 , 'Raoul''s, SOHO', 'Luxury Dine-in', 98011);
insert into placeofinterest values(17005 , 'Kostas', 'Luxury Dine-in', 98011);
insert into placeofinterest values(17006 , 'Parish Cafe ', 'Dine-In', 98010);
insert into placeofinterest values(17007 , 'Charlie Bird', 'Dine-In', 98010);
insert into placeofinterest values(17008 , 'Maine Discovery Museum', 'Museum', 98026);
insert into placeofinterest values(17009 , 'Snow Bowl', 'Skiing', 98019);
insert into placeofinterest values(17010 , 'ButterMilk Falls', 'Hiking', 98020);
insert into placeofinterest values(17011 , 'Point Breeze Marine', 'Boating', 98009);
insert into placeofinterest values(17012 , 'Bar Mezzana', 'Dine-In', 98010);
insert into placeofinterest values(17013 , 'Everhart Museum', 'Museum', 98026);
insert into placeofinterest values(17014 , 'ALTA', 'Dine-In', 98010);
insert into placeofinterest values(17015 , 'Urban escapes', 'Rafting', 98027);
insert into placeofinterest values(17016 , 'Samuel Adams Boston Brewery', 'Brewery', 98005);
insert into placeofinterest values(17017 , 'East End Brewing Company', 'Brewery', 98005);
insert into placeofinterest values(17018 , 'Times Square', 'Sight Seeing', 98008);
insert into placeofinterest values(17019 , 'Rosamond Gifford Zoo', 'Sight Seeing', 98008);
insert into placeofinterest values(17020 , 'Mendon Ponds Park', 'Sight Seeing', 98008);
insert into placeofinterest values(17021 , 'Brooklyn Bridge', 'Sight Seeing', 98008);
insert into placeofinterest values(17022 , 'The Strong Museum', 'Museum', 98013);
insert into placeofinterest values(17023 , 'Brooklyn Botanic Garden', 'Park', 98008);
insert into placeofinterest values(17024 , 'Whitney Town Center', 'Shopping', 98025);
insert into placeofinterest values(17025 , 'Wollman Rink', 'Ice Skating', 98019);
insert into placeofinterest values(17026 , 'Seneca Park Zoo', 'Sight Seeing', 98008);
insert into placeofinterest values(17027 , 'Staten Island Ferry', 'Ferry SeightSeeing', 98009);
insert into placeofinterest values(17028 , 'Seabreeze Amusement Park', 'Amusement Park', 98015);
insert into placeofinterest values(17029 , 'Museum of Modern Art', 'Museum ', 98026);
insert into placeofinterest values(17030 , 'Downtown Crossing', 'Shopping Seightseeing', 98008);

--placefeedback
insert into placefeedback values(21001 , 17001 , 54001);
insert into placefeedback values(21002 , 17002 , 54002);
insert into placefeedback values(21003 , 17003 , 54003);
insert into placefeedback values(21004 , 17004 , 54004);
insert into placefeedback values(21005 , 17005 , 54005);
insert into placefeedback values(21006 , 17006 , 54006);
insert into placefeedback values(21007 , 17007 , 54007);
insert into placefeedback values(21008 , 17008 , 54008);
insert into placefeedback values(21009 , 17009 , 54009);
insert into placefeedback values(21010 , 17010 , 54010);
insert into placefeedback values(21011 , 17011 , 54011);
insert into placefeedback values(21012 , 17012 , 54012);
insert into placefeedback values(21013 , 17013 , 54013);
insert into placefeedback values(21014 , 17014 , 54014);
insert into placefeedback values(21015 , 17015 , 54015);
insert into placefeedback values(21016 , 17016 , 54016);
insert into placefeedback values(21017 , 17017 , 54017);
insert into placefeedback values(21018 , 17018 , 54018);
insert into placefeedback values(21019 , 17019 , 54019);
insert into placefeedback values(21020 , 17020 , 54020);
insert into placefeedback values(21021 , 17021 , 54021);
insert into placefeedback values(21022 , 17022 , 54022);
insert into placefeedback values(21023 , 17023 , 54023);
insert into placefeedback values(21024 , 17024 , 54024);
insert into placefeedback values(21025 , 17025 , 54025);
insert into placefeedback values(21026 , 17026 , 54026);
insert into placefeedback values(21027 , 17027 , 54027);
insert into placefeedback values(21028 , 17028 , 54028);
insert into placefeedback values(21029 , 17029 , 54029);
insert into placefeedback values(21030 , 17030 , 54030);

--travelmethod
insert into travelmethod values(26001 , 17001 , 17002 , 'johndoe' , '2017.01.14', 45002, 4, 'Great travel');
insert into travelmethod values(26002 , 17002 , 17001 , 'marcsmith' , '2018.04.02', 45003, 4, '');
insert into travelmethod values(26003 , 17003 , 17001 , 'tiger123' , '2018.07.07', 45004, 2, 'Dont take bus');
insert into travelmethod values(26004 , 17001 , 17004 , 'andrewskeels' , '2019.01.01', 45014, 5, 'Loved the private jet experience.');
insert into travelmethod values(26005 , 17001 , 17016 , 'tushartiwari' , '2015.02.04', 45014, 5, 'Loved the private jet experience.');
insert into travelmethod values(26006 , 17002 , 17016 , 'shreyagupta' , '2006.03.06', 45001, 2, 'Dont take bus');
insert into travelmethod values(26007 , 17017 , 17019 , 'girtskarnitis' , '2017.04.06', 45007, 5, 'Loved the personal vehicle exp');
insert into travelmethod values(26008 , 17017 , 17019 , 'anjaligupta1' , '2016.06.06', 45008, 3, 'Loved the private jet experience.');
insert into travelmethod values(26009 , 17014 , 17016 , 'sakarsrivastava' , '2015.05.05', 45009, 1, 'Loved the personal vehicle exp');
insert into travelmethod values(26010 , 17010 , 17018 , 'mohitsrivastava' , '2014.04.04', 45002, 2, 'Loved the private jet experience.');
insert into travelmethod values(26011 , 17004 , 17012 , 'yashsaur' , '2002.02.02', 45003, 3, 'Dont take bus');
insert into travelmethod values(26012 , 17010 , 17022 , 'abhishekgupta' , '2019.01.03', 45004, 5, 'Loved the personal vehicle exp');
insert into travelmethod values(26013 , 17017 , 17022 , 'saurabhchanda' , '2017.04.09', 45005, 4, 'Loved the private jet experience.');
insert into travelmethod values(26014 , 17014 , 17001 , 'marcjones' , '2005.11.12', 45001, 2, 'Charter Bus was good ');
insert into travelmethod values(26015 , 17010 , 17005 , 'aashnadave' , '2007.02.23', 45007, 3, 'Dont take bus');
insert into travelmethod values(26016 , 17004 , 17006 , 'poojithabonda' , '2009.04.05', 45008, 5, 'Loved the private jet experience.');
insert into travelmethod values(26017 , 17010 , 17007 , 'shreyachandak' , '2018.03.02', 45009, 1, 'Exp was good with Rental Car');
insert into travelmethod values(26018 , 17028 , 17016 , 'sarthakchak' , '2000.04.06', 45003, 3, 'Loved the private jet experience.');
insert into travelmethod values(26019 , 17029 , 17018 , 'albyeapen' , '2019.09.08', 45002, 4, 'Exp was good with Rental Car');
insert into travelmethod values(26020 , 17030 , 17012 , 'jessiejones' , '2008.07.07', 45003, 5, 'Loved the private jet experience.');
insert into travelmethod values(26021 , 17008 , 17022 , 'frankunderwood' , '2004.02.04', 45004, 2, 'Exp on bike was great');
insert into travelmethod values(26022 , 17012 , 17022 , 'claire' , '2004.04.04', 45005, 5, 'Dont take bus');
insert into travelmethod values(26023 , 17013 , 17001 , 'douglas' , '2008.05.07', 45003, 4, 'Exp on bike was great');
insert into travelmethod values(26024 , 17011 , 17002 , 'michaelsmith' , '2015.07.06', 45004, 3, 'Exp on commercial airline was great');
insert into travelmethod values(26025 , 17014 , 17006 , 'anthonymark' , '2018.08.09', 45005, 5, 'Loved the private jet experience.');
insert into travelmethod values(26026 , 17009 , 17007 , 'luisawoods' , '2005.09.09', 45002, 5, 'Dont take bus');
insert into travelmethod values(26027 , 17010 , 17004 , 'jeremmy' , '2006.06.06', 45003, 4, 'Exp on commercial airline was great');
insert into travelmethod values(26028 , 17020 , 17010 , 'jake234' , '2014.08.12', 45004, 2, 'Loved the private jet experience.');
insert into travelmethod values(26029 , 17022 , 17005 , 'Timhorton' , '2017.08.11', 45005, 3, 'Dont take bus');
insert into travelmethod values(26030 , 17027 , 17006 , 'troypistachio' , '2018.12.31', 45014, 5, 'Loved the private jet experience.');

-- geographicplace
insert into geographicplace values(17001 , 134.347865, 783.245881);
insert into geographicplace values(17002 , 324.569871, 124.598302);
insert into geographicplace values(17003 , 391.653745, 534.049841);
insert into geographicplace values(17004 , 815.764479, 119.269773);
insert into geographicplace values(17005 , 123.987523, 185.134557);
insert into geographicplace values(17006 , 663.985946, 250.999344);
insert into geographicplace values(17007 , 208.809668, 316.864137);
insert into geographicplace values(17008 , 251.220741, 382.728917);
insert into geographicplace values(17009 , 293.631814, 448.593704);
insert into geographicplace values(17010 , 336.042888, 514.458497);
insert into geographicplace values(17011 , 378.453961, 580.323277);
insert into geographicplace values(17012 , 420.865034, 646.188063);
insert into geographicplace values(17013 , 463.276108, 712.052851);
insert into geographicplace values(17014 , 505.687181, 777.917637);
insert into geographicplace values(17015 , 548.098254, 843.782423);
insert into geographicplace values(17016 , 590.509328, 909.647217);
insert into geographicplace values(17017 , 632.920417, 975.511996);
insert into geographicplace values(17018 , 675.331475, 104.137673);
insert into geographicplace values(17019 , 717.742544, 110.241576);
insert into geographicplace values(17020 , 760.153617, 117.310635);
insert into geographicplace values(17021 , 802.564651, 123.897113);
insert into geographicplace values(17022 , 844.975765, 134.835937);
insert into geographicplace values(17023 , 887.386841, 137.070716);
insert into geographicplace values(17024 , 929.797912, 143.656553);
insert into geographicplace values(17025 , 972.208986, 152.413029);
insert into geographicplace values(17026 , 101.462009, 156.829506);
insert into geographicplace values(17027 , 205.703113, 163.415983);
insert into geographicplace values(17028 , 109.944287, 170.024649);
insert into geographicplace values(17029 , 124.185322, 176.889436);
insert into geographicplace values(17030 , 118.426554, 183.175422);

--networkquality
insert into networkquality values(33001 , 98701 , 78001 , 'johndoe' , 17001, 4, 'Great network', '2017.01.14');
insert into networkquality values(33002 , 98702 , 78002 , 'marcsmith' , 17002, 5, 'Awesome network', '2018.04.02');
insert into networkquality values(33003 , 98703 , 78002 , 'tiger123' , 17003, 2, 'Poor network', '2018.07.07');
insert into networkquality values(33004 , 98703 , 78001 , 'andrewskeels' , 17006, 5, 'Awesome network', '2019.01.01');
insert into networkquality values(33005 , 98705 , 78002 , 'tushartiwari' , 17007, 4, 'Great network', '2015.02.04');
insert into networkquality values(33006 , 98704 , 78003 , 'shreyagupta' , 17008, 3, 'Good network', '2006.03.06');
insert into networkquality values(33007 , 98705 , 78004 , 'girtskarnitis' , 17009, 2, 'Poor network', '2017.04.06');
insert into networkquality values(33008 , 98703 , 78001 , 'anjaligupta1' , 17010, 1, 'Terrible network', '2016.06.06');
insert into networkquality values(33009 , 98713 , 78002 , 'sakarsrivastava' , 17011, 3, 'Good network', '2015.05.05');
insert into networkquality values(33010 , 98712 , 78003 , 'mohitsrivastava' , 17012, 4, 'Great network', '2014.04.04');
insert into networkquality values(33011 , 98714 , 78004 , 'yashsaur' , 17013, 2, 'Poor network', '2002.02.02');
insert into networkquality values(33012 , 98705 , 78001 , 'abhishekgupta' , 17014, 1, 'Terrible network', '2019.01.03');
insert into networkquality values(33013 , 98703 , 78002 , 'saurabhchanda' , 17015, 5, 'Awesome network', '2017.04.09');
insert into networkquality values(33014 , 98714 , 78003 , 'marcjones' , 17016, 5, 'Awesome network', '2005.11.12');
insert into networkquality values(33015 , 98712 , 78004 , 'aashnadave' , 17017, 5, 'Awesome network', '2007.02.23');
insert into networkquality values(33016 , 98714 , 78005 , 'poojithabonda' , 17018, 4, 'Great network', '2009.04.05');
insert into networkquality values(33017 , 98709 , 78006 , 'shreyachandak' , 17019, 4, 'Great network', '2018.03.02');
insert into networkquality values(33018 , 98703 , 78009 , 'sarthakchak' , 17020, 1, 'Terrible network', '2000.04.06');
insert into networkquality values(33019 , 98713 , 78010 , 'albyeapen' , 17021, 3, 'Good network', '2019.09.08');
insert into networkquality values(33020 , 98714 , 78001 , 'jessiejones' , 17022, 5, 'Awesome network', '2008.07.07');
insert into networkquality values(33021 , 98712 , 78002 , 'frankunderwood' , 17023, 2, 'Poor network', '2004.02.04');
insert into networkquality values(33022 , 98709 , 78003 , 'claire' , 17024, 4, 'Great network', '2004.04.04');
insert into networkquality values(33023 , 98703 , 78004 , 'douglas' , 17022, 3, 'Good network', '2008.05.07');
insert into networkquality values(33024 , 98713 , 78002 , 'michaelsmith' , 17020, 2, 'Poor network', '2015.07.06');
insert into networkquality values(33025 , 98714 , 78003 , 'anthonymark' , 17018, 5, 'Awesome network', '2018.08.09');
insert into networkquality values(33026 , 98712 , 78004 , 'luisawoods' , 17016, 4, 'Great network', '2005.09.09');
insert into networkquality values(33027 , 98709 , 78001 , 'jeremmy' , 17014, 3, 'Good network', '2006.06.06');
insert into networkquality values(33028 , 98703 , 78002 , 'jake234' , 17012, 3, 'Good network', '2014.08.12');
insert into networkquality values(33029 , 98705 , 78003 , 'Timhorton' , 17010, 4, 'Great network', '2017.08.11');
insert into networkquality values(33030 , 98712 , 78004 , 'troypistachio' , 17008, 5, 'Awesome network', '2018.12.31');


-- SELECT everything from Place table
SELECT *
FROM [dbo].[Place];
-- same as previous
SELECT *
FROM Place;
-- select only specific columns from Place table
SELECT City, State
FROM Place;

-- you can create expressions from existing columns
-- and rename them
SELECT
	City AS CityName,
	State AS StateString,
	City + '-' + State,
	City + '-' + ZIP
FROM Place;

-- select distinct states from Place table
SELECT DISTINCT State
FROM Place;

-- check out what's in the NetworkQuality table
SELECT * FROM NetworkQuality;

-- using different arithmetic expressions
SELECT
Quality,
Quality+5,
Quality-5,
Quality*2,
Quality/2,
(Quality*1.0)/2
FROM NetworkQuality;

-- filter only network quality records with quality index <= 3
SELECT *
FROM NetworkQuality
WHERE Quality <= 3;

-- check what's in the Place table
SELECT * FROM Place;

-- set Zip codes to NULL
-- for places with ID > 17027
UPDATE Place
SET ZIP = NULL
WHERE Place_ID > 17027;

-- check that the correct Place table records have empty ZIP code
-- using "=" with NULL is a bad idea
SELECT * FROM Place
WHERE ZIP = NULL;

-- select null ZIP codes
SELECT * FROM Place
WHERE ZIP IS NULL;

-- select not null ZIP codes
SELECT * FROM Place
WHERE ZIP IS NOT NULL;

-- select usernames and notes for records with Quality = 1
SELECT Username, Notes
FROM NetworkQuality
WHERE Quality = 1;

-- you can use OR logical statement for filtering
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Quality = 1 OR Quality = 5;

-- select records with Quality 1 or 5
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Quality IN (1,5);

-- select records with quality between 2 and 4 using conditions
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Quality >= 2 AND Quality <= 4;

-- select records with quality between 2 and 4 using BETWEEN statement
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Quality BETWEEN 2 AND 4;

-- filtering by string
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Notes = 'Great network';

-- LIKE statement. select records that start with "G"
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Notes LIKE 'G%';

-- select records where notes start with the word "Great"
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Notes LIKE 'Great%';

-- select records where Notes have character combinations "some" in them
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Notes LIKE '%some%';

-- select records where Notes do not have character combinations "some" in them
SELECT Username, Notes, Quality
FROM NetworkQuality
WHERE Notes NOT LIKE '%some%';

-- sort records by Quality in ascending order
SELECT Username, Notes, Quality
FROM NetworkQuality
ORDER BY Quality;

-- sort records by Quality in descending order
SELECT Username, Notes, Quality
FROM NetworkQuality
ORDER BY Quality DESC;

-- sort records by "quality", when quality is equal between records - using "username" for sorting
SELECT Username, Notes, Quality
FROM NetworkQuality
ORDER BY Quality DESC, Username;

-- combine results from multiple select statements using UNION
SELECT Username
FROM NetworkQuality
WHERE Quality = 5 -- 8 records
UNION ALL
SELECT UserName
FROM Feedback
WHERE Rating = 4 -- 7 records

-- Foreign key violation example
UPDATE TravelMethod SET Travelmethodtype_ID = 24 WHERE TM_ID = 26021;

-- Example of creating table with Primary keys and Foreign keys
create table Feedback(
    Feedback_ID int primary key not null,
    UserName varchar(30) ,
    Rating int,
    Notes nvarchar(500),
    EntryDate date,
    constraint username_fk foreign key (UserName) references Networkuser(UserName)
);

-- Create Foreign key after the table is created
ALTER TABLE Feedback
    ADD CONSTRAINT username_fk
    FOREIGN KEY (UserName) REFERENCES Networkuser(UserName);



SELECT * FROM TravelMethod; -- 30 rows
SELECT * FROM TravelMethodType; -- 14 rows
SELECT 30*14; -- ROWS 420

-- SELECT with FULL OUTER JOIN
SELECT *
FROM TravelMethod, TravelMethodType;

-- SELECT specific columns from multiple tables
SELECT TM_ID, Type
FROM TravelMethod, TravelMethodType;

-- SELECT data from 2 tables via INNER JOIN
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod, TravelMethodType
WHERE TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID
ORDER BY TravelMethod.TM_ID;

-- SYNTAX VER.2 (preferred one)
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod
INNER JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID;

-- add travel method which is not used in TravelMethod table
INSERT INTO TravelMethodType VALUES (45015, 'Roller skates');
-- change TravelMethod record to be without TravelMethodType connection
UPDATE TravelMethod SET Travelmethodtype_ID = NULL WHERE TM_ID = 26030;

-- Example of INNER JOIN
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod
INNER JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID;

-- Example of LEFT JOIN
-- you can compare results with INNER JOIN and see the difference
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod
LEFT JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID;

-- Example of RIGHT JOIN
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod
RIGHT JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID;

-- Same SQL as previous, only using LEFT JOIN
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethodType
LEFT JOIN TravelMethod
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID;


-- Example of JOIN statement with multiple JOIN conditions
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type AS TravelMethodType
FROM TravelMethod
LEFT JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID
        AND TM_ID IN (26030,26029,26028,26027,26026,26025,26024,26023,26022,26021,26020,26019,26018)
ORDER BY TravelMethod.TM_ID DESC;


-- Using WHERE conditions in addition to JOINing data
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type AS TravelMethodType
FROM TravelMethod
LEFT JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID
WHERE TM_ID IN (26030,26029,26028,26027,26026,26025,26024,26023,26022,26021,26020,26019,26018)
ORDER BY TravelMethod.TM_ID DESC;

-- JOINing more than 2 tables
-- If you JOIN one table multiple times - need to give each JOIN table an alias
-- in our case - POI and POI2
SELECT
    TravelMethod.TM_ID,
    TravelMethodType.Type AS TravelMethodType,
    POI.Name AS FromName,
    POI2.Name AS ToName
FROM TravelMethod
LEFT JOIN TravelMethodType ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID
LEFT JOIN PlaceOfInterest POI on TravelMethod.From_ID = POI.Place_ID
LEFT JOIN PlaceOfInterest POI2 on TravelMethod.To_ID = POI2.Place_ID;


-- Example of how Many-to-Many can be implemented by using a connection table PLaceFeedback
SELECT
    PlaceFeedback.PlaceFeedback_ID,
    POI.Name,
    F.UserName,
   F.Notes
FROM PlaceFeedback
JOIN PlaceOfInterest POI on PlaceFeedback.Place_ID = POI.Place_ID
JOIN Feedback F on PlaceFeedback.Feedback_ID = F.Feedback_ID;


 
 drop table TravelMethod;
 drop table NetworkQuality;
 drop table PlaceFeedback;
 drop table PlaceOfInterest;
 drop table GeographicPlace;
 drop table Place;
 drop table PlaceType;
 drop table Feedback;
 drop table TravelMethodType;
 drop table Networkuser;
 drop table Carrier;
 drop table PhoneModel;
 