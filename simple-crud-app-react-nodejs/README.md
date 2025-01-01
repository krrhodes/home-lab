*This is a fork Saurabh-DevOpsVoyager77/simple-crud-app-react-nodejs with a few tweaks I have made to deploy in the cluster and instrument metrics.

**React Node.js CRUD Application**

This repository contains a full-stack CRUD (Create, Read, Update, Delete) application built with React and Node.js. 

The application allows you to perform basic operations on a data set, making it a practical example for learning and understanding how to develop and deploy such applications.

**Prerequisites**:

Before you begin, make sure you have the following prerequisites installed on your system:

Docker: This project utilizes Docker for containerization. You can install it from the official website.

Docker-Compose: Make sure you have Docker Compose installed.

Git: To clone the project, you need Git installed on your system.

Nginx: This project assumes that Nginx is installed and configured on your system.


**Installation and Usage**

Follow these steps to get started with the CRUD application:

**Clone the Repository**:

``git clone https://github.com/Saurabh-DevOpsVoyager77/simple-crud-app-react-nodejs.git``

**Change Directory**:

``cd simple-crud-app-react-nodejs/``

**Start the Application**:

Run the following command to start the application:

``docker-compose up --build``

This will set up the application, and you can access it via your web browser frontend at http://localhost:8080 and backend at http://localhost:3333/api

**Application Details**

This CRUD application is designed to showcase how to create, retrieve, update, and delete items from a data source using React and Node.js. You can use this project as a starting point for building your own CRUD applications or as a learning resource to understand the integration of React and Node.js

After navigating to http://localhost:8080, you will be presented with the frontend interface, exemplified in the image below. This interface serves as the user-friendly portal to interact with the application, enabling you to create, read, update, and delete data entries seamlessly.

![image](https://github.com/Saurabh-DevOpsVoyager77/simple-crud-app-react-nodejs/assets/147520862/6c63c214-8b66-466e-990d-848dccf486f8)


For direct access to the backend and its data, navigate to http://localhost:3333/api. Here, you can interact with the backend services and examine the data, as depicted in the image below. The backend is the backbone of the application, responsible for processing data requests, serving as the intermediary between the user interface and the data source.

![image](https://github.com/Saurabh-DevOpsVoyager77/simple-crud-app-react-nodejs/assets/147520862/f859c8ca-e7ce-4024-8f0f-57c5396ff64b)


These two distinct components, the frontend and the backend, collaboratively deliver a robust and user-centric experience for managing data within the application.
