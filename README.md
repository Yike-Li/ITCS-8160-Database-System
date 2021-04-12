# ITCS 6160 Campus Eats Project

## Index
* [Project Requirement](#project-requirement)
* [Development Starting Point and Framework](#development-starting-point-and-framework)
* [Business Rules and Assumptions](#business-rules-and-assumptions)
* [Web UI](#web-ui)
* [EERD](#eerd)
* [Data Dictionary](#data-distionary)
* [SQL Implementation Details](#sql-implementation-details)
	* [Stored Procedure](#stored-procedure)
	* [Trigger](#trigger)
	* [View](#view)
	* [Indexes](#indexes)
* [ToDo(Future Work)](#todo)
* [References](#references)

## Project Requirement
In this project, we are responsible for the addition of a rating system for following the business rules for both drivers and restaurants. Some detailed requirements are as follows:
* The rating files will show supertypes and subtypes. 
* Load the tables with sufficient test data (http://www.generatedata.com is used).
* After adding the tables, reverse engineer to update the model.
* Analyze the indexes that are already in the database. Implement any improvements based on the business rules and your interpretation of how the data might be used.
* Create three advanced views that include the ratings tables.


## Business Rules
With the threat of the Corona virus, food delivery services are more important than ever.  Local restaurants are eager to find easy ways to have food delivered to customers without having to hire delivery employees. Even when things return to normal, many experts feel that food delivery will be something that we all will have become accustomed to as a part of our regular activities (even more than before).  

Students love food delivery services on campus.  Campuses do not like the steady stream of visitors that may or may not have a formal connection with the university.  Companies such as UberEats and GrubHub are happy to deliver on campus, but many schools are wondering if they should take control of the delivery and ensure that students and authorized university employees are the only ones delivering food on campus for safety and health reasons.

One startup that has tried to tackle this problem is http://www.craveoncampus.com
The company is a startup, and the site shows evidence of the system design.  Your assignment is to understand a test database for a campus controlled food delivery service similar to craveoncampus.com.  This database is the campuseats database.  You will be enhancing the database with a rating system for both restaurants and delivery drivers.  You can also look at grubhub and ubereats for ideas.  Please remember this is extending a prototype for the database, not a fully implemented working model.   
Here is some basic information on the existing database prototype: (the database is created and populated with data but does not include the rating system)
1)	Persons (campus faculty, staff, students) have accounts in the system with personid (PK), name, email, cell, etc.  For faculty we also keep title, highest degree, and degreecollege.  For staff we keep Position and AdminYorN.  For students we keep GradYear and major plus type (undergraduate, graduate).  Only faculty, staff and students are included.
2)	We have Locations which are spots on campus where food can be delivered.  Some examples are dorms, the student center, and approved classroom buildings.  LocationID, LocationName, LocationAddress and (optional) Latitude and Longitude are maintained in the database. Additionally a food delivery drop-off point is included (designated place for meeting or delivering food in the location – this can be a brief description).
3)	Persons can also be drivers (delivery personnel which have to be approved). Drivers have licensenumber and datehired plus ratings. You may also want to keep vehicle information (relative to the vehicle that the driver uses).
a.	UNCC will start with 8 approved delivery personnel – the system is in test mode.  You can assume all individuals have been cleared and they can be included in the database.  
b.	All delivery personnel are students.
4)	There is a flat fee of $5 for each delivery.  A person orders food one to many times.  An individual delivery is tied to one and only one person for the order.  The order is for one and only one restaurant.  For the items on the order, we will only need to keep the total price and delivery charge, along with the driver and delivery times.  There should also be a unique identifier (ID) that ties to the id for the order at the individual restaurant.  You can assume that the actual items on the order need to come from the restaurant database.
5)	Food providers or restaurants have to be approved in order to be included in the database.  You can include ten restaurants or more of your choice for the test database.  Information will include an ID, location, schedule, and a link to the web site along with other attributes you may identify.
6)	The database will serve as an important data collection source providing valuable information about nutrition and eating habits of campus community members.



![alt text](https://github.com/YikeLi-DS/ITCS-6160-Database-System/blob/main/imgs/EERD.png)
