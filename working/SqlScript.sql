/*TODO
 - The GID has to be the same in the booking table and the guest table.
*/

SET TERMOUT ON
PROMPT Building demonstration tables.  Please wait.

DROP TABLE HOTEL;
DROP TABLE ROOM;
DROP TABLE ROOMNUMBER;
DROP TABLE BOOKING;
DROP TABLE GUEST;
DROP TABLE ROOMTYPE;

CREATE TABLE HOTEL
	(NORA NUMBER(3) NOT NULL,
	NORC NUMBER(3));

CREATE TABLE ROOMTYPE
    (ROOMNUM NUMBER(3) PRIMARY KEY,
    ROOMTYPE VARCHAR(10));

CREATE TABLE ROOM
    (ROOMNUM NUMBER(3) REFERENCES ROOMTYPE(ROOMNUM),
    BASICPRICE NUMBER(4),
    ROOMCAP NUMBER(2));

CREATE TABLE ROOMNUMBER
    (ROOMNUM NUMBER(3) REFERENCES ROOMTYPE(ROOMNUM),
    ROOMAVAIL NUMBER(2)); 

CREATE TABLE GUEST
    (GID VARCHAR(10) PRIMARY KEY,
    FNAME VARCHAR(20),
    LNAME VARCHAR(20),
    AGROUP NUMBER(1));

CREATE TABLE BOOKING
    (BID VARCHAR(10) PRIMARY KEY,
    GID VARCHAR(10) REFERENCES GUEST(GID) NOT NULL,
    ROOMNUM NUMBER(3) REFERENCES ROOMTYPE(ROOMNUM) NOT NUll,
    CDATE DATE,
    NOG NUMBER(1));

INSERT INTO HOTEL (NORA, NORC) VALUES (100, 0);

BEGIN
  FOR count IN 1..33 LOOP
    INSERT INTO ROOMTYPE (ROOMNUM, ROOMTYPE) VALUES (count, 'superior');
    INSERT INTO ROOM (ROOMNUM, BASICPRICE, ROOMCAP) VALUES (count, 170, 3);
  END LOOP;
END;
/
BEGIN
  FOR i IN 34..66 LOOP
    INSERT INTO ROOMTYPE (ROOMNUM, ROOMTYPE) VALUES (i, 'deluxe');
    INSERT INTO ROOM (ROOMNUM, BASICPRICE, ROOMCAP) VALUES (i, 200, 2);
  END LOOP;
END;
/
BEGIN
  FOR j IN 67..100 LOOP
    INSERT INTO ROOMTYPE (ROOMNUM, ROOMTYPE) VALUES (j, 'basic');
    INSERT INTO ROOM (ROOMNUM, BASICPRICE, ROOMCAP) VALUES (j, 100, 2);
  END LOOP;
END;
/
BEGIN
  FOR k IN 1..50 LOOP
    INSERT INTO ROOMNUMBER (ROOMNUM, ROOMAVAIL) VALUES (k, 1);
  END LOOP;
END;
/
BEGIN
  FOR p IN 51..100 LOOP
    INSERT INTO ROOMNUMBER (ROOMNUM, ROOMAVAIL) VALUES (p, 0);
  END LOOP;
END;
/
DROP SEQUENCE BOOKING_ID;
DROP SEQUENCE GUEST_ID;
CREATE SEQUENCE BOOKING_ID START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE GUEST_ID START WITH 1 INCREMENT BY 1;

/*Inserting guests, the GID(guest id) connect the guest with bookings
and from the booking we can find room number etc.*/

INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Markita', 'Risko', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Ivette', 'Lundberg', 2);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Era', 'Brito', 3);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Lavone', 'Dore', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Nikia', 'Smeltzer', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Bernice', 'Luque', 2);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Cristine', 'Savage', 3);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Lecia', 'Brough', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Kristy', 'Loden', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Lynette', 'Mccord', 2);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Daren', 'Brann', 3);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Wynona', 'Mcquire', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Fidel', 'Walkup', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Valeri', 'Channel', 2);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Lovie', 'Urban', 3);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Latosha', 'Ihle', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Robin', 'Slama', 1);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Romelia', 'Slate', 2);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Amal', 'Rackers', 3);
INSERT INTO GUEST (GID, FNAME, LNAME, AGROUP)  VALUES(GUEST_ID.NEXTVAL, 'Andres', 'McDuff', 1);

/*CHECKIN DATE BEFORE TODAY*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 2, 1, TO_DATE('2010/03/30', 'yyyy/mm/dd'), 3);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 3, 2, TO_DATE('2012/04/01', 'yyyy/mm/dd'), 3);

/* CHECKIN DATE TODAY -> */

/*3 GUESTS, SUPERIOR ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 4, 1, TO_DATE('2016/03/30', 'yyyy/mm/dd'), 3);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 5, 2, TO_DATE('2016/04/01', 'yyyy/mm/dd'), 3);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 6, 3, TO_DATE('2016/04/05', 'yyyy/mm/dd'), 3);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 7, 4, TO_DATE('2016/04/06', 'yyyy/mm/dd'), 3);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 8, 5, TO_DATE('2016/04/07', 'yyyy/mm/dd'), 3);

/*2 GUESTS, SUPERIOR ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 9, 6, TO_DATE('2016/04/08', 'yyyy/mm/dd'), 2);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 10, 7, TO_DATE('2016/04/09', 'yyyy/mm/dd'), 2);

/*1 GUEST, SUPERIOR ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 11, 8, TO_DATE('2016/03/30', 'yyyy/mm/dd'), 1);

/*2 GUESTS, DELUXE ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 12, 34, TO_DATE('2016/04/05', 'yyyy/mm/dd'), 2);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 13, 35, TO_DATE('2016/04/06', 'yyyy/mm/dd'), 2);

/*1 GUEST, DELUXE ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 14, 37, TO_DATE('2016/04/08', 'yyyy/mm/dd'), 1);

/*2 GUESTS, BASIC ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 15, 67, TO_DATE('2016/10/05', 'yyyy/mm/dd'), 2);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 16, 68, TO_DATE('2016/08/19', 'yyyy/mm/dd'), 2);

/*1 GUEST, BASIC ROOM*/
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 17, 70, TO_DATE('2016/09/03', 'yyyy/mm/dd'), 1);
INSERT INTO BOOKING (BID, GID, ROOMNUM, CDATE, NOG)   VALUES(BOOKING_ID.NEXTVAL, 18, 71, TO_DATE('2016/12/24', 'yyyy/mm/dd'), 1);

COMMIT

SET TERMOUT ON
PROMPT Demonstration table build is complete.
