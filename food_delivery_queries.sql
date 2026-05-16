select * from rec_food_delivery
limit 10;

SELECT Order_ID, Distance_km, Delivery_Time_min
FROM rec_food_delivery;

##find the total number order
select count(*) from rec_food_delivery;

# find avg delivery time 
SELECT AVG(Delivery_Time_min) AS avg_delivery_time
FROM rec_food_delivery;

#Show all orders delivered during rainy weather.
select * from rec_food_delivery
where weather = 'rainy';

#Show all orders with high traffic.
select * from rec_food_delivery
where traffic_level = 'high';

#Find orders taking more than 60 minutes.
select * from rec_food_delivery
where delivery_time_min > 60;

#Display all orders sorted by highest delivery time.
select * from rec_food_delivery 
order by delivery_time_min desc;

#How many deliveries were made using each vehicle type
SELECT Vehicle_Type,
       COUNT(*) AS total_deliveries
FROM rec_food_delivery
GROUP BY Vehicle_Type;

#What is the average delivery time for each weather condition?
select avg(delivery_time_min) as average 
from rec_food_delivery
group by weather;

# How many orders were delivered in the evening?
select count(*) from rec_food_delivery
where time_of_day = 'evening';

#How many unique weather conditions exist in the dataset?
SELECT COUNT(DISTINCT Weather) AS unique_weather_conditions
FROM rec_food_delivery;



#Which traffic condition causes the highest average delivery time?
SELECT Traffic_Level,
       ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM rec_food_delivery
GROUP BY Traffic_Level
ORDER BY avg_delivery_time DESC;

#Find total deliveries grouped by traffic and weather conditions.
SELECT Traffic_Level,
       Weather,
       COUNT(*) AS total_deliveries
FROM rec_food_delivery
GROUP BY Traffic_Level, Weather
ORDER BY total_deliveries DESC;



#Which time of day has the slowest deliveries?
SELECT Time_of_Day,
       ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM rec_food_delivery
GROUP BY Time_of_Day
ORDER BY avg_delivery_time DESC;


#Calculate total and average distance traveled by vehicle type.
SELECT Vehicle_Type,
       SUM(Distance_km) AS total_distance,
       ROUND(AVG(Distance_km),2) AS avg_distance
FROM rec_food_delivery
GROUP BY Vehicle_Type;


#How many deliveries were completed under 30 minutes?
select delivery_time_min from rec_food_delivery
where delivery_time_min < 30;


#Which time of day has the slowest deliveries?
SELECT Time_of_Day, AVG(Delivery_Time_min) AS avg_delivery_time
FROM rec_food_delivery
GROUP BY Time_of_Day
ORDER BY avg_delivery_time DESC
LIMIT 1;



#Find orders where distance is high but delivery time is low.
SELECT Order_ID,
       Distance_km,
       Delivery_Time_min
FROM rec_food_delivery
WHERE Distance_km >
(
    SELECT AVG(Distance_km)
    FROM rec_food_delivery
)
AND Delivery_Time_min <
(
    SELECT AVG(Delivery_Time_min)
    FROM rec_food_delivery
);



#Find weather conditions where average delivery time exceeds 50 minutes.
SELECT Weather,
       ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM rec_food_delivery
GROUP BY Weather
HAVING AVG(Delivery_Time_min) > 50
ORDER BY avg_delivery_time DESC;



#Rank all deliveries based on delivery time.
SELECT Order_ID,
       Delivery_Time_min,
       RANK() OVER(ORDER BY Delivery_Time_min DESC) AS delivery_rank
FROM rec_food_delivery;




#Rank vehicle types based on average delivery performance.
SELECT Vehicle_Type,
       ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time,
       RANK() OVER(
       ORDER BY AVG(Delivery_Time_min)
       ) AS vehicle_rank
FROM rec_food_delivery
GROUP BY Vehicle_Type;


#Calculate running average of delivery time.
SELECT Order_ID,
       Delivery_Time_min,
       ROUND(
       AVG(Delivery_Time_min)
       OVER(ORDER BY Order_ID),2
       ) AS running_avg_delivery_time
FROM rec_food_delivery;


#Find highest delivery time recorded in each weather condition.
select max(delivery_time_min)as highest_delivery_time , weather
from rec_food_delivery
group by weather
order by highest_delivery_time desc;


#find top 5 slowest delivaries
select order_id , delivery_time_min
from rec_food_delivery
order by delivery_time_min desc
limit 5;


#find top 5 fastet delivaries
select order_id , delivery_time_min
from rec_food_delivery
order by delivery_time_min asc
limit 5;


#find the average delay time for each experienece group
SELECT Courier_Experience_yrs,
       ROUND(AVG(Delivery_Time_min),2) AS avg_delay_time
FROM rec_food_delivery
GROUP BY Courier_Experience_yrs
ORDER BY Courier_Experience_yrs;


#find busiest delievry time of day
SELECT Time_of_Day,
       COUNT(*) AS total_deliveries
FROM rec_food_delivery
GROUP BY Time_of_Day
ORDER BY total_deliveries DESC
LIMIT 1;


#find average delivery time for each vehicle under high traffic
select vehicle_type,  AVG(delivery_time_min) as average_delivery_time
from rec_food_delivery
where traffic_level = 'high'
group by vehicle_type;


#find the relationship between distance and delivery time
SELECT Distance_km,
       Delivery_Time_min
FROM rec_food_delivery
ORDER BY Distance_km;

