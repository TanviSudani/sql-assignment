use manufacturerdb;
-- 9.1 give the total number of recordings in this table
select count(*) from `cran_logs_2015-01-01`;

-- 9.2 the number of packages listed in this table?
select count(distinct package) from `cran_logs_2015-01-01`;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(*) from `cran_logs_2015-01-01`
where package = 'Rcpp';

-- 9.4 How many recordings are from China ("CN")?
select count(*) from `cran_logs_2015-01-01`
where country = 'CN';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select  package, count(*) from `cran_logs_2015-01-01`
group by package
order by 2 desc;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select a.package, count(*) from 
(select * from `cran_logs_2015-01-01`
	where 
		substr(time, 1, 5)<"11:00" 
        and 
        substr(time, 1, 5)>"09:00")
as a
group by a.package 
order by 2 desc;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
--    Select based on a given list.
select count(*) from `cran_logs_2015-01-01`
where country IN ('CN' , 'JP', 'SG');

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select 
    TEMP.country
from
    (select 
        country, count(*) as downloads
    from
        `cran_logs_2015-01-01`
    group by country) as TEMP
where
    TEMP.downloads > (select 
            count(*)
        from
            `cran_logs_2015-01-01`
        where
            country = 'CN');

-- 9.9 Print the average length of the package name of all the UNIQUE packages
select avg(LENGTH(temp.packages)) 
from 
(
select DISTINCT package as packages
	from  `cran_logs_2015-01-01`
) temp;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select temp.a package, temp.b count
from
(
select package a, count(*) b
	from  `cran_logs_2015-01-01`
	group by package
	order by b DESC
	LIMIT 2
) temp
order by temp.b ASC
LIMIT 1;


-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package
from  `cran_logs_2015-01-01`
group by package
HAVING count(*) > 1000;

-- 9.12 The field "r_os" is the operating system of the users.
-- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
 select SUBSTR(r_os, 1, 5) AS OS, 
	COUNT(*) AS Download_count, 
	SUBSTR(COUNT(*)/(select COUNT(*) from `cran_logs_2015-01-01`)*100, 1, 4)  AS PROPORTION
from `cran_logs_2015-01-01`
group by SUBSTR(r_os, 1, 5);

-- Here we use INT*1.0 to conver an integer to float so that we can compute compute the percentage (1/5 can be 0.2 instead of 0)
-- || is an alternative of CONCAT() in SQLite.
-- SUBSTR(field, start_position, length) is used to get a part of a character string.
-- [] can help use spaces in the aliases.