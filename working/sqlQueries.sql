drop view AvailableRooms;
drop view GuestsInRoom1;
drop view BookingsForRoom1;


--Add 3-4 view definitions
--Lists all the available rooms

CREATE VIEW AvailableRooms AS
  SELECT ROOM.ROOMNUM, ROOMTYPE, BASICPRICE, ROOMCAP, ROOMAVAIL FROM ROOMTYPE
  INNER JOIN ROOM ON ROOM.ROOMNUM=ROOMTYPE.ROOMNUM
  INNER JOIN ROOMNUMBER ON ROOMNUMBER.ROOMNUM=ROOMTYPE.ROOMNUM 
  WHERE ROOMNUMBER.ROOMAVAIL='1';

--Lists all the guests that have booked room 1

CREATE VIEW GuestsInRoom1 AS
  SELECT FNAME, LNAME, BID, GUEST.GID FROM GUEST 
  INNER JOIN BOOKING ON BOOKING.GID=GUEST.GID 
  WHERE ROOMNUM=1;

--Lists all the bookings for room number 1 ordered by checkin date

CREATE VIEW BookingsForRoom1 AS
  SELECT * FROM BOOKING 
  WHERE ROOMNUM='1' ORDER BY COUTDATE;


--create view sumofdays as select sum(coutdate-cindate) as days from booking;

--Add 10-12 complex queries

--The number of days a guest will be staying 
select sum(coutdate-cindate) as days from booking b where b.gid=(select g.gid from guest g where fname='Era'); 
--number of bookings with one person after today's date
select count(bid) from booking where sysdate<cindate and nog=1;
--average price paid by all guests with bookings
select avg(basicprice) as average_price from room r,booking b where r.roomnum=b.roomnum;
--average stay of guests



--Sample test data
--100 rooms:
 -- 33 superior(Price: 170, capability: 3 ), 33 deluxe(Price: 200, capability: 2) and 34 basic(Price: 100, capability: 2).
 -- room numbers in range 0-25 for 4 floors (eg. 103, 203, 303, 403)
 -- room availability 50/50
 
--20 bookings:
 -- 40 Checkin dates from today and 1 year ahead.
 -- 10 checkin dates from before today for testing

--20 customers:

--45 guests: 10 alone, 20 two persons, 5 three persons
 -- Different names and agegroups.