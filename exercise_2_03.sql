Use bank;
/*
2.03 Activity 1
Keep working on the bank database. (In case you need to load data again, refer to the previous lab and files_for_lab folder to get the database.)
Queries

*/
 -- Get card_id and year_issued for all gold cards.
SELECT * FROM card;
SELECT card_id, CONVERT(LEFT(issued,6), date) AS year_issued FROM card WHERE type ='gold';
-- When was the first gold card issued? (Year)
SELECT card_id, min(DATE_FORMAT(LEFT(issued,6),'%Y')) AS year_issued FROM card WHERE type ='gold';
--     Get issue date as:
-- date_issued: 'November 7th, 1993'
SELECT card_id, DATE_FORMAT(min(LEFT(issued,6)),'%M %D, %Y') AS year_issued FROM card WHERE type ='gold';
        -- fecha_emision: '07 of November of 1993'
SELECT card_id, DATE_FORMAT(min(LEFT(issued,6)),'%D of %M of %Y') AS fecha_emision FROM card WHERE type ='gold';

-- 2.03 Activity 2
-- Questions and queries
--    Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.
--    Check for transactions with null or empty values for the column amount.
select * from trans;
select trans_id AS 'Transaction_ID', amount from trans 
WHERE amount is not null;
select trans_id, k_symbol from trans 
WHERE k_symbol is null OR k_symbol like ' ';
-- Count how many transactions have empty and non-empty k_symbol (in one query).
select count(trans_id) 
from trans 
where k_symbol is not null or k_symbol is null;

select sum(k_symbol = ' ') as k_symbol_empty, sum(not k_symbol = ' ') as k_symbol_non_empty
from bank.trans
where amount is not null; 
