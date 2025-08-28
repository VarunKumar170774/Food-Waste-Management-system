# local Food Wastage Management System
Food wastage is a significant issue, with many households and restaurants discarding surplus food while numerous people struggle with food insecurity. This project aims to develop a Local Food Wastage Management System, where:
Restaurants and individuals can list surplus food.
NGOs or individuals in need can claim the food.
SQL stores available food details and locations.

Business Use Cases
Connecting surplus food providers to those in need through a structured platform.
Reducing food waste by redistributing excess food efficiently.
Enhancing accessibility via geolocation features to locate food easily.
Data analysis on food wastage trends for better decision-making.

Approach
 1. Data Preparation
Utilize a provided dataset containing food donation records.
Ensure consistency and accuracy in data formatting.
2. Database Creation
Store food availability data in SQL tables.
Implement CRUD operations for updating, adding, and removing records.
3. Data Analysis.
Identify food wastage trends based on categories, locations, and expiry dates.
Generate reports for effective food distribution.

Dataset Description

1. Providers Dataset
The providers.csv file contains details of food providers who contribute surplus food to the system.
Provider_ID (Integer) – Unique identifier for each provider.
Name (String) – Name of the food provider (e.g., restaurants, grocery stores, supermarkets).
Type (String) – Category of provider (e.g., Restaurant, Grocery Store, Supermarket).
Address (String) – Physical address of the provider.
City (String) – City where the provider is located.
Contact (String) – Contact information (e.g., phone number).

2. Receivers Dataset
The receivers.csv file contains details of individuals or organizations receiving food.
Receiver_ID (Integer) – Unique identifier for each receiver.
Name (String) – Name of the receiver (individual or organization).
Type (String) – Category of receiver (e.g., NGO, Community Center, Individual).
City (String) – City where the receiver is located.
Contact (String) – Contact details (e.g., phone number).

3. Food Listings Dataset
The food_listings.csv file stores details of available food items that can be claimed by receivers.
Food_ID (Integer) – Unique identifier for each food item.
Food_Name (String) – Name of the food item.
Quantity (Integer) – Quantity available for distribution.
Expiry_Date (Date) – Expiry date of the food item.
Provider_ID (Integer) – Reference to the provider offering the food.
Provider_Type (String) – Type of provider offering the food.
Location (String) – City where the food is available.
Food_Type (String) – Category of food (e.g., Vegetarian, Non-Vegetarian, Vegan).
Meal_Type (String) – Type of meal (e.g., Breakfast, Lunch, Dinner, Snacks).

4. Claims Dataset
The claims.csv file tracks food claims made by receivers.
Claim_ID (Integer) – Unique identifier for each claim.
Food_ID (Integer) – Reference to the food item being claimed.
Receiver_ID (Integer) – Reference to the receiver claiming the food.
Status (String) – Current status of the claim (e.g., Pending, Completed, Cancelled).
Timestamp (Datetime) – Date and time when the claim was made.

Questions to be Answered (SQL Queries & Analysis)
The project will analyze food donations, claims, and provider trends using SQL queries. Below are some key questions:

Food Providers & Receivers
1.How many food providers and receivers are there in each city?
2.Which type of food provider (restaurant, grocery store, etc.) contributes the most food?
3.What is the contact information of food providers in a specific city?
4.Which receivers have claimed the most food?

Food Listings & Availability
5.What is the total quantity of food available from all providers?
6.Which city has the highest number of food listings?
7.What are the most commonly available food types?

Claims & Distribution
8. How many food claims have been made for each food item?
9. Which provider has had the highest number of successful food claims?
10. What percentage of food claims are completed vs. pending vs. canceled?

Analysis & Insights
11. What is the average quantity of food claimed per receiver?
12. Which meal type (breakfast, lunch, dinner, snacks) is claimed the most?
13.What is the total quantity of food donated by each provider?

Results
✅ A fully functional Streamlit app that allows users to:

Filter food donations based on location, provider, and food type.

Contact food providers and receivers directly through the app.

Implement CRUD operations for updating, adding, and removing records.

All the 15 queries along with their outputs.

✅ SQL-powered analysis that provides insights into:

The most frequent food providers and their contributions.

The highest demand locations based on food claims.

Trends in food wastage to improve distribution efforts.

All the 15 queries along with their outputs.
