-- customer table

INSERT INTO Customer VALUES ('C001', 'KV', 'kv@gmail.com', 'k123', '9003124365');
INSERT INTO Customer VALUES ('C002', 'KV', 'bob@gmail.com', 'pass456', '9267567891');
INSERT INTO Customer VALUES ('C003', 'Charlie Brown', 'charlie@gmail.com', 'jjehrer', '9844567892');
INSERT INTO Customer VALUES ('C004', 'David Wilson', 'david@gmail.com', '3743nj', '8934567893');
INSERT INTO Customer VALUES ('C005', 'Eva Adams', 'eva@gmail.com', 'bhg355', '8923567894');
INSERT INTO Customer VALUES ('C006', 'Frank Harris', 'frank@gmail.com', 'hjwef434', '9003567895');
INSERT INTO Customer VALUES ('C007', 'Grace Lee', null, 'password104', '9952567896');
INSERT INTO Customer VALUES ('C008', 'Henry Martin', 'henry@gmail.com', 'password105', '9835567897');
INSERT INTO Customer VALUES ('C009', 'Ivy Davis', 'ivy@gmail.com', 'password106', '9345567898');
INSERT INTO Customer VALUES ('C010', 'Jack White', 'jack@gmail.com', 'password107', '9056567899');



--rest
INSERT INTO Restaurants VALUES ('R001', 'Pizza Palace', 5, 'Main St', 'Downtown', '123456', '9952057932', 'pass1');
INSERT INTO Restaurants VALUES ('R002', 'Burger Bistro', 6, '2nd Ave', 'Midtown', '234567', '9876543211', 'restpass2');
INSERT INTO Restaurants VALUES ('R003', 'Sushi Spot', 9, '3rd Blvd', 'Uptown', '345678', '9876543212', 'restpass3');
INSERT INTO Restaurants VALUES ('R004', 'Taco Town', 45, '4th Rd', 'Oldtown', '456789', '9876543213', 'restpass4');
INSERT INTO Restaurants VALUES ('R005', 'Pasta Place', 45, '5th St', 'Newtown', '567890', '9876543214', 'restpass5');
INSERT INTO Restaurants VALUES ('R006', 'Steak House', 4, '6th Ave', 'Greentown', '678901', '9876543215', 'restpass6');
INSERT INTO Restaurants VALUES ('R007', 'Curry Corner', 23, '7th Blvd', 'Redtown', '789012', '9876543216', 'restpass7');
INSERT INTO Restaurants VALUES ('R008', 'Noodle Nook', 78, '8th Rd', 'Bluetown', '890123', '9876543217', 'restpass8');
INSERT INTO Restaurants VALUES ('R009', 'BVK Biriyani', 89, '9th St', 'Yellowtown', '901234', '9876543218', 'restpass9');
INSERT INTO Restaurants VALUES ('R010', 'Thalapakatti', 2, '10th Ave', 'Browntown', '123450', '9876543219', 'restpass10');


--items
INSERT INTO Items VALUES ('I001', 'Margherita Pizza', 'Italian', 'veg');
INSERT INTO Items VALUES ('I002', 'Cheeseburger', 'Burger', 'non-veg');
INSERT INTO Items VALUES ('I003', 'California Roll', 'Japanese', 'non-veg');
INSERT INTO Items VALUES ('I004', 'Tacos', 'Mexican', 'non-veg');
INSERT INTO Items VALUES ('I005', 'Pasta Alfredo', 'Italian', 'veg');
INSERT INTO Items VALUES ('I006', 'Roti', 'Indian Breads', 'veg');
INSERT INTO Items VALUES ('I007', 'Naan', 'Indian Breads', 'veg');
INSERT INTO Items VALUES ('I008', 'Egg Biriyani', 'Biriyani', 'egg');
INSERT INTO Items VALUES ('I009', 'Veg Biriyani', 'Biriyani', 'veg');
INSERT INTO Items VALUES ('I010', 'Chicken Biriyani', 'Biriyani', 'non-veg');
INSERT INTO Items VALUES ('I011', 'Chicken Zinger', 'Burger', 'non-veg');

--menu
INSERT INTO Menu VALUES ('R001', 'I001', 150, 'Classic Margherita Pizza');
INSERT INTO Menu VALUES ('R002', 'I002', 130, 'Juicy Cheeseburger');
INSERT INTO Menu VALUES ('R002', 'I011', 120, 'Fresh classic burger');
INSERT INTO Menu VALUES ('R004', 'I004', 80, 'Spicy Tacos');
INSERT INTO Menu VALUES ('R005', 'I005', 120, 'Creamy Pasta Alfredo');
INSERT INTO Menu VALUES ('R006', 'I006', 278, 'Grilled to perfection Steak');
INSERT INTO Menu VALUES ('R007', 'I007', 125, 'Rich and Spicy Chicken Curry');
INSERT INTO Menu VALUES ('R009', 'I008', 325, 'Smoky flavored egg biriyani');
INSERT INTO Menu VALUES ('R009', 'I009', 300, 'Biriyani with carrot and beans');
INSERT INTO Menu VALUES ('R009', 'I010', 450, 'Richly cooked chicken biriyani');
INSERT INTO Menu VALUES ('R010', 'I008', 345, 'Biriyani with scrambled egg');
INSERT INTO Menu VALUES ('R010', 'I009', 350, 'Biriyani with potato and peas');
INSERT INTO Menu VALUES ('R010', 'I010', 400, 'Biriyani cooked with chicken');

--delivery
INSERT INTO Delivery_person VALUES ('D001', 'Mike Ross', '1234567890', 'Downtown', 'pass123', 'mike.ross@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D002', 'Rachel Zane', '1234567891', 'Midtown', 'pass456', 'rachel.zane@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D003', 'Harvey Specter', '1234567892', 'Uptown', 'pass789', 'harvey.specter@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D004', 'Donna Paulsen', '1234567893', 'Oldtown', 'pass101', 'donna.paulsen@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D005', 'Louis Litt', '1234567894', 'Newtown', 'pass202', 'louis.litt@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D006', 'Jessica Pearson', '1234567895', NULL, 'pass303', NULL, 0);
INSERT INTO Delivery_person VALUES ('D007', 'Samantha Wheeler', '1234567896', NULL, 'pass404', 'samantha.wheeler@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D008', 'Katrina Bennett', '1234567897', 'Bluetown', 'pass505', NULL, 0);
INSERT INTO Delivery_person VALUES ('D009', 'Alex Williams', '1234567898', 'Yellowtown', 'pass606', 'alex.williams@gmail.com', 0);
INSERT INTO Delivery_person VALUES ('D010', 'Benjamin Kim', '1234567899', NULL, 'pass707', 'benjamin.kim@gmail.com', 0);


--orders
INSERT INTO Orders VALUES ('O001', 'C001', 'R001', 'D001', TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O002', 'C001', 'R001', 'D001', TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('11:45:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O003', 'C002', 'R001', 'D004', TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('12:40:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O004', 'C004', 'R004', 'D004', TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O005', 'C007', 'R005', 'D001', TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O006', 'C006', 'R006', 'D006', TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('15:35:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O007', 'C007', 'R010', 'D007', TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:45:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O008', 'C008', 'R009', 'D008', TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O009', 'C007', 'R009', 'D007', TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:45:00', 'HH24:MI:SS'), 'delivered', 'paid');
INSERT INTO Orders VALUES ('O010', 'C010', 'R010', 'D010', TO_TIMESTAMP('19:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('19:35:00', 'HH24:MI:SS'), 'received', 'unpaid');



-- Order_list
INSERT INTO Order_list VALUES ('O001', 'I001', 2, 5);
INSERT INTO Order_list VALUES ('O002', 'I002', 1, 4);
INSERT INTO Order_list VALUES ('O002', 'I011', 1, null);
INSERT INTO Order_list VALUES ('O003', 'I004', 3, 5);
INSERT INTO Order_list VALUES ('O004', 'I005', 1, 5);
INSERT INTO Order_list VALUES ('O005', 'I006', 4, null);
INSERT INTO Order_list VALUES ('O006', 'I007', 2, 5);
INSERT INTO Order_list VALUES ('O007', 'I008', 3, 4);
INSERT INTO Order_list VALUES ('O008', 'I009', 2, 5);
INSERT INTO Order_list VALUES ('O008', 'I010', 1, 5);
INSERT INTO Order_list VALUES ('O009', 'I008', 1, null);
INSERT INTO Order_list VALUES ('O009', 'I009', 2, 4);
INSERT INTO Order_list VALUES ('O009', 'I010', 1, 4);
INSERT INTO Order_list VALUES ('O010', 'I008', 2, 3);
INSERT INTO Order_list VALUES ('O010', 'I009', 1, 3);
INSERT INTO Order_list VALUES ('O010', 'I010', 2, 3);

-- Payment
INSERT INTO Payment VALUES ('P001', 'O001', 'Credit Card', 'unsuccessful', 'T001');
INSERT INTO Payment VALUES ('P011', 'O001', 'Credit Card', 'unsuccessful', 'T012');
INSERT INTO Payment VALUES ('P012', 'O001', 'Credit Card', 'successful', 'T031');
INSERT INTO Payment VALUES ('P002', 'O002', 'Credit Card', 'successful', 'T002');
INSERT INTO Payment VALUES ('P003', 'O003', 'Gpay', 'successful', 'T003');
INSERT INTO Payment VALUES ('P004', 'O004', 'Debit Card', 'successful', 'T004');
INSERT INTO Payment VALUES ('P005', 'O005', 'Cash', 'successful', null);
INSERT INTO Payment VALUES ('P006', 'O006', 'Credit Card', 'successful', 'T006');
INSERT INTO Payment VALUES ('P007', 'O007', 'Debit Card', 'successful', 'T007');
INSERT INTO Payment VALUES ('P008', 'O008', 'Credit Card', 'successful', 'T008');
INSERT INTO Payment VALUES ('P009', 'O009', 'Gpay', 'successful', 'T009');
INSERT INTO Payment VALUES ('P010', 'O010', 'Cash', 'successful', null);


--address
INSERT INTO Address VALUES ('C001', 'A001', 123, 'Main St', 'Downtown', '123456');
INSERT INTO Address VALUES ('C001', 'A002', 456, 'Second St', 'Uptown', '654321');
INSERT INTO Address VALUES ('C001', 'A003', 556, 'Fifth St', 'Uptown', '654321');
INSERT INTO Address VALUES ('C002', 'A004', 789, 'Third St', 'Midtown', '234567');
INSERT INTO Address VALUES ('C003', 'A005', 101, 'Fourth St', 'Eastside', '345678');
INSERT INTO Address VALUES ('C004', 'A006', 202, 'Fifth St', 'Westside', '456789');
INSERT INTO Address VALUES ('C005', 'A007', 303, 'Sixth St', 'Northside', '567890');
INSERT INTO Address VALUES ('C006', 'A008', 404, 'Seventh St', 'Southside', '678901');
INSERT INTO Address VALUES ('C007', 'A009', 505, 'Eighth St', 'Suburbia', '789012');
INSERT INTO Address VALUES ('C008', 'A010', 606, 'Ninth St', 'Downtown', '890123');
INSERT INTO Address VALUES ('C009', 'A011', 707, 'Tenth St', 'Uptown', '901234');
INSERT INTO Address VALUES ('C010', 'A012', 808, 'Eleventh St', 'Midtown', '012345');
INSERT INTO Address VALUES ('C010', 'A013', 909, 'Twelfth St', 'Eastside', '123456');
