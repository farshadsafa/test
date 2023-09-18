

--both are correct--




-- Variables to Change:
-- - SuperTypeID: (currently set to 1, 2, and 8).
-- - Status ID: (currently set to 123).
-- - Minimum Order Count: (currently set to 3).
-- - Date Range:  (currently set to 90-30 days ago).
-- - CityID:  (currently set to 7, 1, 2, 4, 6, 3, 5, 14).
-- - ProteinFirstOrderDate: (currently Null).

-- Selects:
-- customer_id
-- city
-- cityid (aliased as CityID)
-- SnappFoodFirstOrderIsJEK


select sub1.customer_id,city,cityid,SnappFoodFirstOrderIsJEK

from (select customer_id, count(*) as number_of_orders
      from Orders
               JOIN Vendors ON Orders.vendor_id = Vendors.ID and SuperTypeID in (1, 2, 8) and status_id = 123
      group by customer_id
            having count(*) >= 3
         and max(created_at) >= dateadd(day, -90, getdate())
         and max(created_at) <= dateadd(day, -30, getdate())) as sub1

         join ServiceNewUsers on customer_id = user_id
         join (select orders.customer_id,city,CityID,SnappFoodFirstOrderIsJEK
               from Orders
                        join vendors on vendor_id = vendors.ID
                        join UserOrderStatistics on SnappFoodLastOrderID = orders.id and CityID in (7,1,2,4,6,3,5,14)) as sub2
              on sub1.customer_id = sub2.customer_id


where ProteinFirstOrderDate is null;



-- Variables to Change:
-- - FoodOrders:  (currently set to 3).
-- - SuperTypeID:  (currently set to 1, 2, and 8).
-- - LastCityID:  (currently set to 1, 2, 3, 4, 5, 6, 7, and 14).
-- - Date Range:  (currently set to 90-30 days ago).
-- - ProteinFirstOrderDate: (currently Null).

-- Selects:

--    UserID,
--   SnappFoodFirstOrderIsJEK,
--   LastCityID AS cityid,
--    City.title




select UserID, SnappFoodFirstOrderIsJEK, LastCityID as cityid, City.title


from UserOrderStatistics

         join ServiceNewUsers on UserID = user_id and FoodOrders >= 3
         join zoodfood_db..ServiceNewUsers1
              on CustomerID = UserID and SuperTypeID in (1,2,8) and LastCityID in (1, 2, 3, 4, 5, 6, 7, 14)
         join City on city.id=LastCityID
    and RestaurantCafeLastOrderDate >= dateadd(day, -90, getdate())
    and RestaurantCafeLastOrderDate <= dateadd(day, -30, getdate())


where ProteinFirstOrderDate is null;







رستوران ایرانی,1
کافه رستوران,2
کترینگ/کبابی,3
فست فود/ایتالیایی,4
شیرینی,5
شیرینی و خشکبار,6
نان و شیرینی,7
کافه قنادی,8
آبمیوه بستنی,9
کافی شاپ,10
مجتمع نان,11
میوه فروشی,12
سبزی و محصولات خانگی,13
آجیل و خشکبار,14
عطاری/ادویه جات,15
پروتئینی,16
سوپرمارکت,17
سایر,18
عمده,19
سوپرمیوه,22
سوسیس و کالباس,23
سوپر پروتئینی,24
داروخانه,25
بازارچه,26
فودکورت,28
بین المللی/خاص,29
سالم/گیاهی,30
طباخی,31
آش و حلیم,32
سالاد بار/اسنک بار,33
لبنیاتی,34
قهوه و شکلات,35
هایپر پروتئینی,36
نان سنگک,37
نان لواش,38
نان بربری,39
نان تافتون,40
آرایشی بهداشتی,41
کتاب,42
مد و پوشاک,43
دیجیتال,44
غذای نیمه آماده,45
خانه و آشپزخانه,48
ورزش و سفر,49
ابزار و لوازم خودرو,50
پت شاپ,51
گل و گیاه,52
تره بار,53
ارگانیک شاپ,54

;

dateadd(day, -90, getdate())



