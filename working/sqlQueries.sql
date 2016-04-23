#Add 3-4 view definitions
#Lists all the available rooms
CREATE VIEW AvailableRooms AS
  2	 SELECT ROOM.ROOMNUM, ROOMTYPE, BASICPRICE, ROOMCAP, ROOMAVAIL FROM ROOMTYPE
  3  INNER JOIN ROOM ON ROOM.ROOMNUM=ROOMTYPE.ROOMNUM
  4  INNER JOIN ROOMNUMBER ON ROOMNUMBER.ROOMNUM=ROOMTYPE.ROOMNUM 
  5  WHERE ROOMNUMBER.ROOMAVAIL='1';

#Lists all the guests that have booked room 1
CREATE VIEW GuestsInRoom1 AS
  2  SELECT FNAME, LNAME, BID, GUEST.GID FROM GUEST 
  3  INNER JOIN BOOKING ON BOOKING.GID=GUEST.GID 
  4  WHERE ROOMNUM=1;

#Lists all the bookings for room number 1 ordered by checkin date
CREATE VIEW BookingsForRoom1 AS
  1	 SELECT * FROM BOOKING 
  2  WHERE ROOMNUM='1' ORDER BY CDATE;

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