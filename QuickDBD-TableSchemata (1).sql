-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3FOvy4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "DepartmentNumber" Varchar   NOT NULL,
    "Department" Varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "DepartmentNumber"
     )
);

CREATE TABLE "department_employee" (
    "EmployeeNumber" int   NOT NULL,
    "DepartmentNumber" Varchar   NOT NULL,
    "Fromdate" date   NOT NULL,
    "Todate" date   NOT NULL
);

CREATE TABLE "manager" (
    "DepartmentNumber" Varchar   NOT NULL,
    "EmployeeNumber" int   NOT NULL,
    "Fromdate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "employee" (
    "EmployeeNumber" int   NOT NULL,
    "Birthdate" date   NOT NULL,
    "FirstName" Varchar   NOT NULL,
    "LastName" Varchar   NOT NULL,
    "Gender" Varchar(3)   NOT NULL,
    "Hiredate" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "EmployeeNumber"
     )
);

CREATE TABLE "salary" (
    "EmployeeNumber" int   NOT NULL,
    "Salary" money   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "titles" (
    "EmployeeNumber" int   NOT NULL,
    "Title" Varchar   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "employee" ("EmployeeNumber");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_DepartmentNumber" FOREIGN KEY("DepartmentNumber")
REFERENCES "departments" ("DepartmentNumber");

ALTER TABLE "manager" ADD CONSTRAINT "fk_manager_DepartmentNumber" FOREIGN KEY("DepartmentNumber")
REFERENCES "departments" ("DepartmentNumber");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "employee" ("EmployeeNumber");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "employee" ("EmployeeNumber");

