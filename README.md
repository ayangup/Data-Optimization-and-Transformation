# Data-Optimization-and-Transformation

# Overview
This project builds a structured relational database, RestaurantDB, based on real-world restaurant and customer review data inspired by Zomato orders. It covers database creation, table design, data insertion, and relationship establishment between entities like restaurants, cuisines, locations, and customer reviews.
The database is intended for use in restaurant review platforms, food delivery apps, or analytics projects related to customer preferences and restaurant operations.

# Database Structure
The project includes the following components:

- Database Creation:
  - Drops RestaurantDB if it already exists.
  - Creates a new RestaurantDB for a clean start.

- Tables Created:

  - Location
    - Stores city, neighborhood, and zip code.
    - Enforces zip code length to exactly 6 characters.

  - Cuisine_Type
    - Stores cuisine categories and descriptions.
    - Ensures unique cuisine types.

  - Restaurant
    - Stores restaurant details including name, online ordering option, table booking option, approximate cost, and foreign keys linking to Location        and Cuisine_Type.

  - Customer_Review
    - Stores restaurant reviews, including rating, number of votes, and review date.
    - Enforces valid rating (0.0 to 5.0) and non-negative votes.

# Data Insertion:
- Populates Location with over 90 U.S. cities and neighborhoods.
- Populates Cuisine_Type with a diverse range of over 90 cuisine categories.
- Populates Restaurant with sample restaurant data linked to locations and cuisines.


# Technologies Used
- SQL — MySQL dialect
- MySQL Workbench (recommended for running and managing scripts)

# How to Run
- Open MySQL Workbench (or any MySQL client).
- Copy and paste the SQL script into a new SQL tab.
- Execute the full script:
- The database and tables will be created.
- Sample data will be inserted automatically.

# Notes
- All DROP TABLE IF EXISTS statements are included to avoid creation errors.
- Data integrity is maintained with constraints like CHECK, NOT NULL, and FOREIGN KEY.
- Comments are provided in the script for better readability and educational purposes.
- The design ensures normalization and proper relationship management across tables.
