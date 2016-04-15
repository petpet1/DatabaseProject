#Add 3-4 view definitions
SELECT ROOM.ROOMNUMBER, ROOMTYPE, BASICPRICE, ROOMCAP, ROOMAVAIL FROM ROOMTYPE, ROOM, ROOMNUMBER WHERE ROOMAVAIL='1' ORDER BY ROOM.ROOMNUMBER;
SELECT FNAME, LNAME, BID, GID FROM GUEST, BOOKING WHERE ROOMNUM='1';
SELECT * FROM BOOKING, WHERE ROOMNUM='1' ORDER BY CDATE;

#Add 10-12 complex queries 


#Sample test data
100 rooms:
 - 33 superior(Price: 170, capability: 3 ), 33 deluxe(Price: 200, capability: 2) and 34 basic(Price: 100, capability: 2).
 - room numbers in range 0-25 for 4 floors (eg. 103, 203, 303, 403)
 - room availability 50/50
 
 20 bookings:
 - 40 Checkin dates from today and 1 year ahead.
 - 10 checkin dates from before today for testing

 20 customers:
 - 

 45 guests: 10 alone, 20 two persons, 5 three persons
 - Different names and agegroups.