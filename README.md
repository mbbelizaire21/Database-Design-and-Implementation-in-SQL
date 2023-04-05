# Database-Design-and-Implementation-in-SQL
## Designing a database and performing exploratory data analysis in Microsoft SQL Server for a laundromat business.

3 Boys Enterprises Laundromat, a family-owned business located in Spring Valley, New York, has been operating since 2010. Over the years, the business has grown, but its methods for tracking customer purchases, inventory, drop-off services, employee data, and customer laundromat cards have remained inefficient. To address these challenges, we have developed an all-encompassing database that streamlines data management, making it easier to store and retrieve relevant information. This project aims to improve the operational efficiency of 3 Boys Enterprises Laundromat by providing an efficient, reliable, and secure database system

* The project will involve designing and building an all-encompassing database to store and retrieve customer purchase data, inventory/stock data, drop-off service customer information, employee data, and customer laundromat card data.
* The database will be designed based on the business rules defined for the project, such as mandatory and optional data fields for customers, employees, and suppliers.
* The database will be implemented using Microsoft SQL Server, a popular database management system, which will enable efficient storage and retrieval of data.
* Queries will be created to answer specific data questions, such as how much revenue is generated from washers and dryers on a given day, the average weight of drop-off service clothes, and which employees complete the most transactions.
* The project will involve testing and validation of the database to ensure that it can handle large amounts of data and provide accurate and reliable results.
 
## Stakeholders
* 3 Boys Enterprises Management/Employees: People within the business who perform many operations for the store.
* 3 Boys Enterprises Customers: Recurring and new consumers of the business.
* Suppliers: Companies who provide inventory for the laundromat.

## Business Rules
* Every customer who washes and dries will be identified by the ID on their laundromat card, but first/last name, address, email, phone number are optional identifiers (If card is lost, it is convenient to have all info present).
* Customers who utilize drop-off service are required to be identified by their first/last name, and phone number. Address, email address, and laundromat card ID are optional. Weight of clothes will also be calculated.
* Employees are required to have their first/last name, address, phone number, and email address available in database.
* Employees manage stock by documenting sales (transactions) made to customers.
*Suppliers on delivery day give employees the product to be stored or stocked on shelves.

## Conceptual Model and Logical Model Demonstrating Business Rules
<img width="411" alt="image" src="https://user-images.githubusercontent.com/125572462/230017932-e7839d53-dd8c-4904-aada-d77f0110d26d.png">
<img width="468" alt="image" src="https://user-images.githubusercontent.com/125572462/230018258-1564b7d5-e46b-446f-a922-baf1003fb06a.png">

## Examples of Implementing Tables and Records into Database 
![image](https://user-images.githubusercontent.com/125572462/230019487-e73fc52d-e4b6-4fc3-b183-929617ce3d2e.png)
![image](https://user-images.githubusercontent.com/125572462/230020975-6e094c8e-783f-4937-b744-1756accf6038.png)


![image](https://user-images.githubusercontent.com/125572462/230020219-d27bb01a-2ed5-4d5a-b325-cda4bedcaf17.png)
![image](https://user-images.githubusercontent.com/125572462/230021491-b1be94a8-1f1d-48be-836c-b1e33e38f84a.png)

## Data Questions
Now that the database is designed and has data inserted, data questions can be answered, such as: 
![image](https://user-images.githubusercontent.com/125572462/230023720-c4d1459f-290e-4576-937f-afa8d476a86e.png)

![image](https://user-images.githubusercontent.com/125572462/230024074-f1ce356a-82c4-48a1-9823-866c8ac7ea0d.png)

## Tools Used
* Microsoft SQL Server
* Microsoft Access
* Draw.io

