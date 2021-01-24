/*
 * Authors : Benjamin Muminovic & Axel Pittet
 * Date : 24.01.2020
 * Project : EcommerceHardware
 * Description : Script that creates a view containing the number of records for each table 
*/


CREATE VIEW V_TableRecords AS SELECT 
(SELECT COUNT(id) FROM clients) as ClientsCount,
(SELECT COUNT(id) FROM promotions) as PromotionsCount,
(SELECT COUNT(id) FROM providers) as ProvidersCount,
(SELECT COUNT(id) FROM Orders) as OrdersCount,
(SELECT COUNT(id) FROM Statutes) as StatutesCount,
(SELECT COUNT(id) FROM components)as ComponentsCount,
(SELECT COUNT(id) FROM Categories)as CategoriesCount,
(SELECT COUNT(id) FROM clients_benefits_promotions)as clients_benefits_promotionsCount,
(SELECT COUNT(id) FROM clients_comment_components)as clients_comment_componentsCount,
(SELECT COUNT(id) FROM order_includes_components)as order_includes_componentsCount

-- SELECT * FROM V_TableRecords;