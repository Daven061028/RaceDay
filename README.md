# RaceDay – Event Management System

## 1. Project Overview

RaceDay is a full-stack web-based event management system designed specifically for the South African road running, walking and cycling community.

The system is designed to help Event Organisers create and manage events, categories and participant results. Participants can browse upcoming events, enter events and track their personal performance history.

This project is being developed progressively across three parts.

### Part 1 – System Planning and Database

Part 1 focuses on planning the RaceDay system before application code is developed. It includes:

* Entity Relationship Diagram (ERD)
* RESTful API endpoint plan
* SQL Server database script
* GitHub repository and CI/CD validation

### Part 2 – RESTful API

Part 2 will involve building the RESTful API in C#, connecting it to the database, writing unit tests and configuring GitHub CI/CD.

### Part 3 – MVC Web Application

Part 3 will involve building the MVC web application that consumes the API, integrating Azure Blob Storage and containerising the application using Docker.

## 2. System Roles

RaceDay has two main system roles:

### Event Organiser

The Event Organiser is responsible for managing events and race information.

The Organiser will be able to:

* Create events.
* Manage events.
* Create event categories.
* Manage event categories.
* View participant enrolments.
* Manage participant results.

### Participant

The Participant uses RaceDay to participate in sporting events.

The Participant will be able to:

* Register an account.
* Log into the system.
* Browse upcoming events.
* Enter events.
* View event information.
* Track personal performance history.

## 3. Database Design

The RaceDay system uses a relational database to store information about users, organisers, participants, events, categories, enrolments and results.

The database design is represented using an Entity Relationship Diagram (ERD).

The ERD identifies:

* Entities
* Attributes
* Primary keys
* Foreign keys
* Relationships
* Relationship cardinality

The ERD is stored in the `/docs` folder.

## 4. API Endpoint Plan

The RaceDay API Endpoint Plan defines the RESTful endpoints that will be required by the system.

The endpoint plan covers:

* Authentication
* User Profile
* Events
* Categories
* Event Enrolments
* Results

Each planned endpoint includes:

* HTTP Method
* Route
* Description
* Role Required
* Request Body
* Expected Response

The API Endpoint Plan is stored in the `/docs` folder.

## 5. SQL Database

The RaceDay SQL database is created using SQL Server Management Studio (SSMS).

The SQL script contains:

* Database creation
* Table creation
* Primary keys
* Foreign keys
* NOT NULL constraints
* UNIQUE constraints
* DEFAULT constraints
* Sample data

The sample data includes the required:

* Two Organisers
* Two Participants
* Three Events
* Categories for each event
* Sample Enrolments

The SQL script is stored in the `/docs` folder.

## 6. Repository Structure

The Part 1 repository is organised as follows:


RaceDay
│
├── README.md
│
├── docs
│   ├── RaceDay_ERD.png
│   ├── API_Endpoint_Plan.md
│   └── RaceDay_Database.sql
│
└── .github
    └── workflows
        └── validate.yml


## 7. GitHub and CI/CD


**CI/CD Screenshot:**
<img width="1912" height="717" alt="validate" src="https://github.com/user-attachments/assets/52b187b3-badf-4051-8460-d5f54aa8cf7e" />



## 8. Video Presentation

An unlisted YouTube video will be created for the Part 1 presentation.

The video will explain:

* The RaceDay system.
* The ERD and the database design decisions.
* The API endpoint plan and endpoint choices.
* The SQL database design.
* The execution of the SQL script in SQL Server Management Studio.

**YouTube Video Link:**

*To be added.*

## 9. Part 1 Documentation

The `/docs` folder contains the main Part 1 documentation:

### ERD

`RaceDay_ERD.png`

Contains the database entities, attributes, primary keys, foreign keys and relationships.

### API Endpoint Plan

`API_Endpoint_Plan.md`

Contains the planned RESTful API endpoints and their required information.

### SQL Database Script

`RaceDay_Database.sql`

Contains the SQL Server database schema and required sample data.

## 10. AI Disclosure

AI tools were used during the planning, proofreading and development process of this project. AI assistance was reviewed and adapted to meet the requirements of the RaceDay Programming 2B assignment.
