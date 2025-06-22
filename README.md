---

# NASCON Project

This project was developed for **NASCON** — a platform designed to put both SQL and Web Development skills to the test.
It serves as a comprehensive demonstration of designing, developing, and integrating a dynamic, database-powered application.

## 🔹 Project Manifesto 🔹

NASCON stands for **National Software Convention** — a flagship event where innovation, coding prowess, and technical creativity come together.
This project was an opportunity to showcase my ability to connect a relational database (MySQL) with a full stack application (Node.js, Express, HTML, CSS, and JavaScript).
The application aims to provide a **seamless, interactive, and data-centric experience** for users, reflecting real-world scenarios and business logic.

## 🛠 Tech Stack

* **Database:** MySQL
* **Back-end:** Node.js with Express
* **Front-end:** HTML, CSS, JavaScript
* **Other:** API routing, CRUD operations, and form submission with data persistence

## 🚀 Features

* Perform **Create, Retrieve, Update, and Delete (CRUD)** operations on the MySQL database
* User-friendly **web-interface** designed with HTML, CSS, and JavaScript
* Seamless **API endpoints** powered by Node.js
* Proper **error handling and validation** for robustness
* Database schema designed following **normalization principles**

## 📁 Installation & Run

To get up and running with the project:

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/nascon-project.git
cd nascon-project
```

2. **Installing dependencies:**

```bash
npm install
```

3. **Set up your MySQL database:**

* Create a new database (say `nascon`) in MySQL.
* Import the provided `nascon.sql` script to create tables.

```sql
SOURCE nascon.sql;
```

4. **Edit your `config/database.js` with your credentials:**

```javascript
const connection = mysql.createConnection({ 
    host: "your-database-ip-or-name",
    user: "your-username",
    password: "your-password",
    database: "nascon"
});
```

5. **Start the application:**

```bash
node server.js
```

6. Open your browser at:

```bash
http://localhost:3000
```

## 📝 Additional Notes

* This project is meant for **educational purposes**, demonstrating a standard stack (MySQL, Node.js, Express, HTML, CSS, JavaScript).
* Feel free to **modify, reuse, or adapt** the code for your own portfolio or practice.

## 🔹 Contact 🔹

If you have any questions or suggestions, feel free to reach me at:

* **LinkedIn:** (www.linkedin.com/in/haseeb-arshad-09881b347)
* **Github:** (https://github.com/Hasee10)

---

✅ **Thank you for checking out my project!**
✨ Your support, suggestions, or contributions are much appreciated. 🌟
