SELECT YEAR(charged_datetime) AS year, MONTHNAME(charged_datetime) AS month, SUM(amount) AS revenue
FROM billing
WHERE charged_datetime BETWEEN "2012-03-01" AND "2012-03-31";

SELECT client_id, SUM(amount) AS total_revenue
FROM billing
WHERE client_id = 2;

SELECT domain_name AS sites, client_id
FROM sites
WHERE client_id = 10;

SELECT client_id, COUNT(site_id) AS number_of_sites, YEAR(created_datetime) AS year, MONTHNAME(created_datetime) AS month
FROM sites
WHERE client_id=1
GROUP BY year, month;

SELECT domain_name AS sites, COUNT(leads_id) AS number_of_leads, DATE_FORMAT(registered_datetime,"%M %d, %Y") AS date_generated
FROM leads
LEFT JOIN sites
ON leads.site_id = sites.site_id
WHERE registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY leads.site_id;

SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, COUNT(leads_id) AS number_of_leads
FROM leads
LEFT JOIN sites
ON leads.site_id = sites.site_id
LEFT JOIN clients
ON clients.client_id = sites.client_id
WHERE registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY clients.client_id;


SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, COUNT(leads_id) AS number_of_leads, MONTHNAME(registered_datetime) AS month, YEAR(registered_datetime) AS year
FROM leads
LEFT JOIN sites
ON leads.site_id = sites.site_id
LEFT JOIN clients
ON clients.client_id = sites.client_id
WHERE registered_datetime BETWEEN '2011-01-01' AND '2011-06-30'
GROUP BY clients.client_id, month
ORDER BY registered_datetime;


SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, domain_name AS site, COUNT(leads.leads_id) AS number_of_leads
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
LEFT JOIN leads
ON leads.site_id = sites.site_id
WHERE registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY domain_name
ORDER BY clients.client_id;

SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, domain_name AS site, COUNT(leads.leads_id) AS number_of_leads
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
LEFT JOIN leads
ON leads.site_id = sites.site_id
GROUP BY domain_name
ORDER BY clients.client_id;

SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, SUM(amount) AS total_revenue, MONTHNAME(charged_datetime) AS month, YEAR(charged_datetime) AS year
FROM clients
LEFT JOIN billing
ON clients.client_id = billing.client_id
GROUP BY client_name, month, year
ORDER BY clients.client_id;

SELECT CONCAT_WS(" ", clients.first_name, clients.last_name) AS client_name, GROUP_CONCAT(domain_name SEPARATOR ' / ') AS sites
FROM clients
LEFT JOIN sites
ON clients.client_id = sites.client_id
GROUP BY clients.client_id;