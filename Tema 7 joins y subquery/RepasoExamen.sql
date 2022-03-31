USE library;

-- 1. List of members cities (no duplicates)
select distinct city from MEMBERS;

-- 2. Name and surname of all the members who live in Manacor or Felanitx
select NAME,SURNAMES from MEMBERS where CITY = 'Manacor' or CITY = 'Felanitx';

-- 3. Name and surname of all the members who live in Manacor and they have been registered before 01/01/2009
select NAME,SURNAMES from MEMBERS where CITY = 'Manacor' and ENTRY_DATE < '2009-01-01';

-- 4. Name and surname of all the members who live in Manacor sorted by surname and then by name (if they the same surname you must sort by name)
select NAME, SURNAMES from MEMBERS where CITY = 'Manacor' order by SURNAMES,NAME;

-- 5. Name and surname of all members with a code between 10 and 20
select NAME,SURNAMES from MEMBERS where MEMBER_CODE between 10 and 20;

-- 6. Title of the books that we do not know their publisher.

select TITLE from BOOKS where PUBLISHER_CODE is null;

-- 7. Name and surname of all Manacor members who do not know their telephone number.
select NAME,NAME from MEMBERS where CITY = 'Manacor' and PHONE is null;

-- 8. Retrieve the copy number and member code of all borrows made in 2012 and which have not yet been returned.
select COPY_CODE,MEMBER_CODE from BORROWS where year(BORROW_DATE)= 2012 and RETURN_DATE is null;

-- 9. Title of books containing the word 'TIERRA' or the word 'FUEGO'.
select TITLE from BOOKS where TITLE like '%TIERRA%' or TITLE like '%FUEGO%';

-- 10. Title of books that contain the word 'TIERRA' and do not contain the word 'PILARES'.
select TITLE from BOOKS where TITLE like '%TIERRA%' and TITLE not like '%PILARES%';

-- 11. Publishers that have a state, but not the city.
select * from PUBLISHERS where STATE is not null and CITY is null;

-- 12. Loans that have been returned late.
select * from BORROWS where RETURN_DATE > DEAD_DATE;

-- 13. Return the number of Manacor members.
select count(*) from MEMBERS where CITY = 'Manacor';

-- 14. Return the number of loans made by the member with code 1.
select count(*) from BORROWS where MEMBER_CODE = 1;

-- 15. Return the highest member code and his/her full name (with the format 'surnames, name'). Give an alias for the fullname.

select MEMBER_CODE,concat(SURNAMES,',',NAME)as fullname from MEMBERS group by MEMBER_CODE order by MEMBER_CODE desc limit 1;

-- 16. Return the day we registered the oldest member (does not have to be the number 1 member)
select min(ENTRY_DATE) from MEMBERS where MEMBER_CODE != 1;

-- 17. Returns the average number of editions of all books in the database.
select avg(EDITION_NUM) from BOOKS;

-- 18. Retrieves the number of days of the longest loan in 2011.
select max(timestampdiff(day,BORROW_DATE,RETURN_DATE)) from BORROWS where year(BORROW_DATE)= 2011;
select max(timestampdiff(day,BORROW_DATE,RETURN_DATE)) from BORROWS where year(RETURN_DATE)= 2011;


-- 19. Average number of days that each book has been borrowed (don't take in account some mistakes on dates as 0000-00-00 00:00:00 or when return date is before borrow date)

select avg(timestampdiff(BORROW_DATE,RETURN_DATE)) from BORROWS where BORROW_DATE != '0000-00-00' and RETURN_DATE is not null;
-- 20. Names and surnames of the members who live in Manacor or Son Servera and who were registered in 2011.


-- 21. Title, full name of the author and name of the publisher of all books (2 solutions)


-- 22. Title, full name of the author and publisher name of all books written in the language 'CA' (2 solutions)


-- 23. Members (name and surnames) who are from Manacor and have made some loans.


-- 24. Members (name and surnames) who have books on loan today.


-- 25. Title of all books borrowed by member number 1.


-- 26. Name of the publishers who have published some HISTORY book.


-- 27. Full name of the authors who have written a book published by PLANETA (2 solutions)


-- 28. Names of authors different from NOAH GORDON who have written some HISTORIA books (2 solutions)


-- 29. Full name of the members living in the same city as the member 1


-- 30. Title of all books published by the same publisher as the book "EL MEDICO"


-- 31. Title of all the books written by the same author as the book "EL MEDICO".


-- 32. Title of all the books that belong to any of the genres to which the book "EL MEDICO" belongs.


-- 33. Returns how many books have been published by the same publisher as "EL MEDICO".


-- 34. Returns the total number of loans made in 2011 and the total number of loans returned in the same year.


-- 35. Returns how many books each author wrote (answer format: name surname number, noha gordon 5, ...)


-- 36. Return how many copies there are in total for each book (answer format: title total, PROGAMACION EN COBOL 3, ...)


-- 37. Return the average number of copies per book.


-- 38. Returns how many books there are in each genre (output format: genre total, HISTORIA 25, ...)


-- 39. Return how many loans each member has made in total (output format: name surnames total, toni mesquida 7, ...)


-- 40. Return, for each member, the number of books he has borrowed.


-- 41. List of members that have made more than 5 loans.


-- 42. List of members who currently have more than one book on loan.


-- 43. For the book "El medico", return the total number of copies, number of copies currently on loan and number of available copies (output format: title number_of_copies on_loan available, the doctor 5 3 2)


-- 44. Retrieves the number of books in the library, the number of copies, and the average number of copies per book.


-- 45. Number of different books each member has borrowed.


-- 46. Returns the number of members of whom we do not know their telephone.


-- 47. Retrieve the copy code and member code for all loans made this year that either have been returned out of date, or have not yet been returned and are already out of date.


-- 48. Number of copies of each book published by "Planeta". The title, language, author and number of copies of the book must be retrieved, sorted by number of copies and author.


-- 49. Retrieve code from books that belong to more than one genre.


-- 50. Title of books left on loan in 2011.


-- 51. Total number of loans made by members who have taken a book during 2011.


-- 52. List of members that have not made any loans during 2011.


-- 53. List of loans (all fields) made in February 2011.


-- 54. List of loans (all fields) longer than 15 days.


-- 55. List of members (all fields) who were registered in the same month as the number 1 member.


-- 56. Title of the book with more editions.


-- 57. Name and surname of the members who have a book not returned.


-- 58. Returns the title of books written by authors who have authored more than 2 books.


-- 59. Name and surname of the member who made the most loans.


-- 60. For each book by the author 'FOLLETT' recover the number of loans and the average number of days that have been on loan. Books that are on loan and have not yet been returned we will consider the return date as 31/12/2013.


-- 61. What is the book we have the most copies?


-- 62. Number of members who have not borrowed a book for more than 9 years.


-- 63. Amount of loans made by the members according to the number of years they have been registered (answer format: years number_of_loans, 20 (years) 20 (loans)


-- 64. All books whose title contains the word 'tiempo' that are available.


-- 65. Details of the members (all fields) who have borrowed more than 2 times the same book.


-- 66. Data of the loans that have been returned 20 days or more, later than the dead date or that have not been returned and have passed more than 20 days of the dead date (output format: [surnames, names]-of-member book-title borrow-date return-date dead-date delay-days)


-- 67. Name and surname of the oldest member of the library.


-- 68. Code of the members who in 2010 borrowed some of the books written by 'Gordon'.


-- 69. Retrieve all books (only title) on the subject "HISTORIA" showing their number of loans.


-- 70. Which is the most requested book for each year, that is, borrowed more times.


