`productcatalogue`

```
 prod_catalogue_id | base_stock_level | batch_size | colour |  corrosion_factor  |  cost  | is_export_controlled | is_under_development | mean_time_before_failure |    objective     | part_num | performance |             prod_catalogue_name              | product  | product_prefix | reorder_level | size |      strength      
-------------------+------------------+------------+--------+--------------------+--------+----------------------+----------------------+--------------------------+------------------+----------+-------------+----------------------------------------------+----------+----------------+---------------+------+--------------------
              4143 |               45 |         15 | White  |  7.573599999999997 |   1400 | f                    | t                    |       17.281866666666662 | Emergency Sensor | VA-14012 | STANDARD    | White-10-STANDARD-Emergency Sensor-valve     | valve    | VA             |             5 | 10mm |  30.59293333333333
              4144 |               45 |         15 | Silver |  7.573599999999997 |   1400 | f                    | t                    |       17.281866666666662 | Emergency Sensor | VA-14011 | STANDARD    | Silver-10-STANDARD-Emergency Sensor-valve    | valve    | VA             |             5 | 10mm |  30.59293333333333
              4145 |               90 |         30 | White  | 24.427599999999998 |    315 | f                    | t                    |       17.742284633333334 | Emergency Sensor | MN-04112 | ADVANCED    | White-10-ADVANCED-Emergency Sensor-manifold  | manifold | MN             |            10 | 10mm | 32.056266666666666
              4146 |               45 |         15 | Black  |  7.573599999999997 |   1400 | f                    | t                    |       17.281866666666662 | Emergency Sensor | VA-14010 | STANDARD    | Black-10-STANDARD-Emergency Sensor-valve     | valve    | VA             |             5 | 10mm |  30.59293333333333
              4147 |               90 |         30 | Silver |            11.0864 |     40 | f                    | f                    |        14.01513343333333 | Coolant          | MN-03021 | STANDARD    | Silver-20-STANDARD-Coolant-manifold          | manifold | MN             |            10 | 20mm | 23.955066666666664
```
---
`order_line`
```
 order_line_id | customer_order | performance | product_code |                product_name                | product_type | quantity 
---------------+----------------+-------------+--------------+--------------------------------------------+--------------+----------
          4434 | AMS00085939    | standard    | PM-22022     | White-20-STANDARD-Water-pump               | pump         |       18
          4435 | AMS00085939    | standard    | PM-21022     | White-20-STANDARD-Air-pump                 | pump         |        6
          4436 | AMS00085764    | advanced    | MN-03121     | Silver-20-ADVANCED-Coolant-manifold        | manifold     |       30
          4437 | AMS00085764    | advanced    | VA-12112     | White-10-ADVANCED-Water-valve              | valve        |       15
          4438 | AMS00085764    | standard    | MN-04000     | Black-5-STANDARD-Emergency Sensor-manifold | manifold     |       30
```
---
`customer_order`
```
 customer_order_id | customer_id | customer_order_ref |         order_date         | customer_code 
-------------------+-------------+--------------------+----------------------------+---------------
              4501 | CE0059      | AMS00085939        | 2021-11-11 18:20:37.381521 |          4428
              4502 | CE0059      | AMS00085764        | 2021-11-04 10:00:55.381521 |          4428
              4503 | CE0059      | AMS00085589        | 2021-10-29 13:15:29.381521 |          4428
              4504 | CE0059      | AMS00085550        | 2021-10-27 11:51:41.381521 |          4428
              4505 | CE0059      | AMS00085468        | 2021-10-21 14:20:24.381521 |          4428
```
---
`customer` 
```
 customer_id |  customer_billing_addr1   | customer_billing_addr2 | customer_billing_county | customer_billing_post_code | customer_code | customer_contact |       customer_name        | customer_order_prefix | last_order_number |              passwd              
-------------+---------------------------+------------------------+-------------------------+----------------------------+---------------+------------------+----------------------------+-----------------------+-------------------+----------------------------------
        4428 | Transport House           | Coventry               | West Midlands           | CV2 3CC                    | CE0059        | Deloras Bisaccia | Advanced Motor Systems Ltd | AMS                   |             86040 | 8c75d2fc737420cf21bbfb906ee3dd39
        4429 | Weybridge Industrial Park | Leamington             | Warks                   | CV35 2BB                   | CA3102        | Joye Gerrald     | Traction Systems Ltd       | TSL                   |             76104 | e5d33eee442b3349c206dbc0c87a3522
        4430 | Unit 1, Springfield Way   | Warwick                | Warks                   | CV65 1AA                   | EB5581        | Jenine Trennell  | MM Controls Ltd            | MCL                   |             32050 | e10adc3949ba59abbe56e057f20f883e
        4431 | 294 Trafford Road         | Nuneaton               | Warks                   | CV38 4DD                   | AC9936        | Kittie Mccormack | Auto Sensors Ltd           | ASENS-                |             52230 | e10adc3949ba59abbe56e057f20f883e
        4432 | Unit 35, Walkers Road     | Burbage                | Warks                   | CV75 6DD                   | BC4743        | Yolanda Belk     | Sillit Industrial Systems  | SIS-                  |             85500 | 433484b5317340f5c28e085bfffc78be
```