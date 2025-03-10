--1.What are the contact details for the top 5 highest-performing campaigns?
SELECT 
    c.company_name, 
    c.pledged, 
    con.first_name, 
    con.last_name, 
    con.email
FROM 
    campaign c
JOIN 
    contacts con ON c.contact_id = con.contact_id
ORDER BY 
    c.pledged DESC
LIMIT 5;
		
-------------------------------------------------------------------------------------------------------------------------------
--2. How are the campaigns distributed across different categories based on their outcome count?
SELECT 
              cat.category, 
                   count(c.outcome) as "outcome_count" 
                FROM 
                    campaign c
                INNER JOIN 
                    category cat ON c.category_id = cat.category_id
                GROUP BY 
                    cat.category;
		
----------------------------------------------------------------------------------------------------------------------------------	
--3. List the count of 'successful' outcomes for each subcategory, grouped by the count of successful outcomes in descending order
SELECT 
    scat.subcategory, 
    COUNT(CASE WHEN c.outcome = 'successful' THEN 1 END) AS successful_count
FROM 
    campaign c
INNER JOIN 
    subcategory scat ON c.subcategory_id = scat.subcategory_id
GROUP BY 
    scat.subcategory
ORDER BY
	successful_count DESC;
	
-------------------------------------------------------------------------------------------------------------------------------
--4. Which campaigns raised the highest amount of money compared to their goal?
SELECT 
    c.company_name, 
    c.goal, 
    c.pledged, 
    ROUND((c.pledged/c.goal), 2) AS percentage_funded
FROM 
    campaign c
ORDER BY 
    percentage_funded Desc
LIMIT 10;

-------------------------------------------------------------------------------------------------------------------------------
--5. Which sub categories have the highest total number of backers?
SELECT 
    scat.subcategory, 
    SUM(c.backers_count) AS total_backers
FROM 
    campaign c
INNER JOIN 
    subcategory scat ON c.subcategory_id = scat.subcategory_id
GROUP BY 
    scat.subcategory
ORDER BY 
    total_backers DESC;
	
------------------------------------------------------------------------------------------------------------------------------	
--6.How much has been pledged in total across different crowdfunding categories?
SELECT cat.category,
    SUM(c.pledged) AS "total_pledged"
FROM
    campaign c
JOIN
    category cat ON c.category_id = cat.category_id
GROUP BY
    cat.category
	
-------------------------------------------------------------------------------------------------------------------------------	
--7.What is the average pledged amount for each category
SELECT 
    cat.category,
    ROUND(AVG(c.pledged),2) AS avg_pledged
FROM 
    campaign c
JOIN 
    category cat ON c.category_id = cat.category_id
GROUP BY 
    cat.category;
-------------------------------------------------------------------------------------------------------------------------------
