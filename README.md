SkillSwap

SkillSwap is a Java-based web application that allows users to connect with others, share their skills, and learn new skills through peer-to-peer interactions.

Features

- User Registration and Login: Create an account and securely access your profile.
- User Profiles: Add personal details, city, bio, skills, and learning interests.
- Explore Users: Discover other users based on their skills and interests.
- Connection Requests: Send, accept, and reject connection requests.
- Connection Notes: Add notes to connections.
- Reviews: Submit reviews for other users.

Technologies Used

- Java
- JSP (JavaServer Pages)
- Servlets
- JDBC
- MySQL
- HTML and CSS
- Apache Tomcat
- NetBeans IDE

Project Type

Full-stack Java Web Application

Installation and Setup

Prerequisites

- JDK (Java Development Kit)
- NetBeans IDE
- Apache Tomcat 10.1
- MySQL or MariaDB
- phpMyAdmin (for easy database management)

1. Download the Project

Clone the repository or download it as a ZIP file from GitHub.

2. Set Up the Database

Step 1: Start Apache and MySQL from XAMPP.

Step 2: Open phpMyAdmin in your browser.

Step 3: Create a new database named "skillswap_db".

Step 4: Select the newly created database.

Step 5: Open the Import tab.

Step 6: Choose the "skillswap_db.sql" file included in this repository.

Step 7: Click Import or Go.

This will create the required tables and import the sample records.

3. Configure Database Connection

Step 1: Open the project in NetBeans.

Step 2: Locate "DBConnection.java" inside "src/java/util/".

Step 3: Update the database connection URL, username, and password according to your local MySQL configuration.

Step 4: Make sure the MySQL Connector/J library is available to the project.

4. Configure the Server and Run

Step 1: Configure Apache Tomcat 10.1 as the application server in NetBeans.

Step 2: Build the project.

Step 3: Run the application.

Limitations and Notes

- This project was developed as an academic project and is intended for learning and demonstration purposes.
- The database export includes sample user accounts and sample records.
- Passwords in the sample database are stored as plain text. This implementation is not suitable for production use.
- Use dummy credentials for testing. Do not enter real or reused passwords.
- The application requires a locally configured MySQL/MariaDB database and Apache Tomcat server.
- Sample certificate image files referenced in the database may not be available unless the corresponding files are provided.
- Additional configuration may be required depending on the local development environment.

Future Improvements

- Implement secure password hashing.
- Add email verification and password recovery.
- Improve application security and input validation.
- Deploy the application to a live hosting environment.
