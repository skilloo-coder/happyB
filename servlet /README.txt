VERSION OF SOFTWAER-----

apache-tomcat-10.1.33.exe

jdk-23_windows-x64_bin.zip

JDBC Driver for database connection

IDE  Eclipse to develop the web application


RUNNING STEPS -----

Step 1: Set up the MySQL Database
Create a Database and create two tables userdata and stddetails
Open MySQL and create a database for your project. For example, let's call it student_db.

Step 2: Set up the Project
Create a Dynamic Web Project
In your IDE, create a new Dynamic Web Project. If you're using Eclipse, follow these steps:

Go to File > New > Dynamic Web Project.
Name the project UserLoginApp.
Add Libraries
Download the required JDBC driver (e.g., mysql-connector-java-x.x.x.jar) and add it to your project’s lib folder for the MySQL connection.

Set up web.xml
In the WEB-INF folder of your project, configure web.xml for the servlet mapping and URL patterns.


Step 3: Create JSP Pages for Login and Registration
Login JSP (login.jsp)

        
Step 4: Create Servlets for Handling Login and Registration
Login Servlet (LoginServlet.java)

This servlet handles user login, checks credentials in the database, and sets the appropriate session attribute.

                     
Step 5: Test the Application

Start the Tomcat server and deploy the project to your server.
Navigate to login.jsp and register.jsp to test the functionality.
When the user registers, the details will be added to the database. After successful login, the user will be redirected to a home.jsp page (which you can create as a simple welcome page).
Additional Features to Add (Optional)
Password Hashing: Store passwords in a hashed format using BCrypt or SHA-256 instead of plain text.
Form Validation: Add client-side and server-side validation to ensure proper data is entered.
Session Management: Implement session management to track logged-in users and provide a logout feature.
Error Handling: Provide proper error messages and handle SQL exceptions securely.
UI/UX Enhancements: Improve the interface using CSS and JavaScript for better user experience.