CREATE DATABASE BANK;
USE BANK; 

CREATE TABLE EMPLOYEES (
    SSN INT PRIMARY KEY,
    Start_date DATE,
    Name VARCHAR(255),
    Emp_length INT,
    Telephone_Num INT,
    Emgnr_SSN INT NULL,
    FOREIGN KEY (Emgnr_SSN) REFERENCES EMPLOYEES(SSN)
);

CREATE TABLE DEPENDENTS (
    SSN INT,
    Name VARCHAR(255),
    FOREIGN KEY (SSN) REFERENCES EMPLOYEES(SSN)
);

CREATE TABLE BRANCH (
    Branch_id INT PRIMARY KEY,
    Name VARCHAR(255),
    Assets VARCHAR(255),
    Address VARCHAR(255),
    Mgnr_SSN INT,
    AssistMgnr_SSN INT,
    FOREIGN KEY (Mgnr_SSN) REFERENCES EMPLOYEES(SSN),
    FOREIGN KEY (AssistMgnr_SSN) REFERENCES EMPLOYEES(SSN)
);

CREATE TABLE CUSTOMERS (
    SSN INT PRIMARY KEY,
    Name VARCHAR(255),
    Apartment_number INT,
    Street_number INT,
    State VARCHAR(20),
    City VARCHAR(255),
    Zip_Code INT,
    Branch_id INT,
    FOREIGN KEY (Branch_id) REFERENCES BRANCH(Branch_id)
);

CREATE TABLE ACCOUNTS (
    Account_number INT PRIMARY KEY,
    AccountDate DATE,
    Account_balance FLOAT,
    SSN INT,
    FOREIGN KEY (SSN) REFERENCES CUSTOMERS(SSN)
);

CREATE TABLE LOAN (
    Loan_number INT PRIMARY KEY,
    Monthly_repay FLOAT,
    Loan_amount FLOAT,
    SSN INT,
    Branch_id INT,
    FOREIGN KEY (SSN) REFERENCES CUSTOMERS(SSN),
    FOREIGN KEY (Branch_id) REFERENCES BRANCH(Branch_id)
);

CREATE TABLE TRANSACTION (
    Tcode INT PRIMARY KEY,
    Type VARCHAR(255),
    Hour INT,
    TransactionDate DATE,
    Amount FLOAT,
    Account INT,
    SSN INT,
    FOREIGN KEY (SSN) REFERENCES CUSTOMERS(SSN)
);

CREATE TABLE LOAN_ACCOUNT (
    Fixed_Rate FLOAT,
    Account_number INT,
    FOREIGN KEY (Account_number) REFERENCES ACCOUNTS(Account_number)
);

CREATE TABLE SAVINGS_ACCOUNT (
    Fixed_rate FLOAT,
    Account_number INT,
    FOREIGN KEY (Account_number) REFERENCES ACCOUNTS(Account_number)
);

CREATE TABLE MONEY_MARKET_ACCOUNT (
    Variable_rate FLOAT,
    Account_number INT,
    FOREIGN KEY (Account_number) REFERENCES ACCOUNTS(Account_number)
);

CREATE TABLE CHECKING_ACCOUNT (
    Overdrafts FLOAT,
    Account_number INT,
    FOREIGN KEY (Account_number) REFERENCES ACCOUNTS(Account_number)
);

/*Data Population*/

INSERT INTO EMPLOYEES (SSN, Start_date, Name, Emp_length, Telephone_Num, Emgnr_SSN)
VALUES (101, TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'John Doe', 3, 1234567890, NULL);

INSERT INTO EMPLOYEES (SSN, Start_date, Name, Emp_length, Telephone_Num, Emgnr_SSN)
VALUES  (102, TO_DATE('2019-03-10', 'YYYY-MM-DD'), 'Jane Smith', 4, 9876543210, 101);

INSERT INTO EMPLOYEES (SSN, Start_date, Name, Emp_length, Telephone_Num, Emgnr_SSN)
VALUES (103, TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'Alice Brown', 2, 1122334455, 101);

INSERT INTO EMPLOYEES (SSN, Start_date, Name, Emp_length, Telephone_Num, Emgnr_SSN)
VALUES (104, TO_DATE('2018-12-05', 'YYYY-MM-DD'), 'Bob White', 5, 2233445566, 102);

INSERT INTO EMPLOYEES (SSN, Start_date, Name, Emp_length, Telephone_Num, Emgnr_SSN)
VALUES (105, TO_DATE('2017-08-25', 'YYYY-MM-DD'), 'Carol Green', 6, 3344556677, NULL);

/*
SELECT *
FROM EMPLOYEES;
*/

INSERT INTO DEPENDENTS (SSN, Name)
VALUES (101, 'Emily Doe');

INSERT INTO DEPENDENTS (SSN, Name)
VALUES (102, 'Michael Smith');

INSERT INTO DEPENDENTS (SSN, Name)
VALUES (103, 'Sophia Brown');

INSERT INTO DEPENDENTS (SSN, Name)
VALUES (104, 'Daniel White');

INSERT INTO DEPENDENTS (SSN, Name)
VALUES (105, 'Olivia Green');

/*
SELECT *
FROM DEPENDENTS;
*/

INSERT INTO BRANCH (Branch_id, Name, Assets, Address, Mgnr_SSN, AssistMgnr_SSN)
VALUES (1, 'Main Branch', 1500000.50, '123 Main St', 101, 102);

INSERT INTO BRANCH (Branch_id, Name, Assets, Address, Mgnr_SSN, AssistMgnr_SSN)
VALUES (2, 'Downtown Branch', 800000.00, '456 Elm St', 103, 104);

INSERT INTO BRANCH (Branch_id, Name, Assets, Address, Mgnr_SSN, AssistMgnr_SSN)
VALUES (3, 'Suburban Branch', 500000.00, '789 Oak St', 102, 105);

INSERT INTO BRANCH (Branch_id, Name, Assets, Address, Mgnr_SSN, AssistMgnr_SSN)
VALUES (4, 'Industrial Branch', 300000.00, '321 Pine St', 104, NULL);

INSERT INTO BRANCH (Branch_id, Name, Assets, Address, Mgnr_SSN, AssistMgnr_SSN)
VALUES (5, 'Uptown Branch', 1000000.00, '654 Maple St', 105, 103);

/*
SELECT *
FROM BRANCH;
*/

INSERT INTO CUSTOMERS (SSN, Name, Apartment_number, Street_number, State, City, Zip_Code, Branch_id)
VALUES (201, 'Jake Harper', 12, 101, 'NY', 'New York', 10001, 1);

INSERT INTO CUSTOMERS (SSN, Name, Apartment_number, Street_number, State, City, Zip_Code, Branch_id)
VALUES (202, 'Megan Brown', 45, 202, 'CA', 'Los Angeles', 90001, 2);

INSERT INTO CUSTOMERS (SSN, Name, Apartment_number, Street_number, State, City, Zip_Code, Branch_id)
VALUES (203, 'Chris Green', 78, 303, 'TX', 'Houston', 77001, 3);

INSERT INTO CUSTOMERS (SSN, Name, Apartment_number, Street_number, State, City, Zip_Code, Branch_id)
VALUES (204, 'Laura Black', 89, 404, 'IL', 'Chicago', 60601, 4);

INSERT INTO CUSTOMERS (SSN, Name, Apartment_number, Street_number, State, City, Zip_Code, Branch_id)
VALUES (205, 'Sarah White', 23, 505, 'FL', 'Miami', 33101, 5);

/*
SELECT *
FROM CUSTOMERS
*/

INSERT INTO ACCOUNTS (Account_number, AccountDate, Account_balance, SSN)
VALUES (301, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 5000.00, 201);

INSERT INTO ACCOUNTS (Account_number, AccountDate, Account_balance, SSN)
VALUES (302, TO_DATE('2022-02-01', 'YYYY-MM-DD'), 7500.00, 202);

INSERT INTO ACCOUNTS (Account_number, AccountDate, Account_balance, SSN)
VALUES (303, TO_DATE('2022-03-01', 'YYYY-MM-DD'), 10000.00, 203);

INSERT INTO ACCOUNTS (Account_number, AccountDate, Account_balance, SSN)
VALUES (304, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 3000.00, 204);

INSERT INTO ACCOUNTS (Account_number, AccountDate, Account_balance, SSN)
VALUES (305, TO_DATE('2022-05-01', 'YYYY-MM-DD'), 6000.00, 205);

/*
SELECT *
FROM ACCOUNTS
*/

INSERT INTO LOAN (Loan_number, Monthly_repay, Loan_amount, SSN, Branch_id)
VALUES (401, 500, 50000.00, 201, 1);

INSERT INTO LOAN (Loan_number, Monthly_repay, Loan_amount, SSN, Branch_id)
VALUES (402, 750, 75000.00, 202, 2);

INSERT INTO LOAN (Loan_number, Monthly_repay, Loan_amount, SSN, Branch_id)
VALUES (403, 300, 30000.00, 203, 3);

INSERT INTO LOAN (Loan_number, Monthly_repay, Loan_amount, SSN, Branch_id)
VALUES (404, 1000, 100000.00, 204, 4);

INSERT INTO LOAN (Loan_number, Monthly_repay, Loan_amount, SSN, Branch_id)
VALUES (405, 400, 40000.00, 205, 5);

/*
SELECT *
FROM LOAN
*/

INSERT INTO TRANSACTION (Tcode, Type, Hour, TransactionDate, Amount, Account, SSN)
VALUES (501, 'Credit', 10, TO_DATE('2022-06-01', 'YYYY-MM-DD'), 1000, 301, 201);

INSERT INTO TRANSACTION (Tcode, Type, Hour, TransactionDate, Amount, Account, SSN)
VALUES (502,  'Debit', 11, TO_DATE('2022-06-02', 'YYYY-MM-DD'), 500, 302, 202);

INSERT INTO TRANSACTION (Tcode, Type, Hour, TransactionDate, Amount, Account, SSN)
VALUES (503, 'Debit', 12, TO_DATE('2022-06-03', 'YYYY-MM-DD'), 750, 303, 203);

INSERT INTO TRANSACTION (Tcode, Type, Hour, TransactionDate, Amount, Account, SSN)
VALUES (504, 'Credit', 13, TO_DATE('2022-06-04', 'YYYY-MM-DD'), 2000, 304, 204);

INSERT INTO TRANSACTION (Tcode, Type, Hour, TransactionDate, Amount, Account, SSN)
VALUES (505, 'Debit', 14, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 1000, 305, 205);

/*
SELECT *
FROM Transaction;
*/

INSERT INTO LOAN_ACCOUNT (Fixed_Rate, Account_number)
VALUES (5, 301);

INSERT INTO LOAN_ACCOUNT (Fixed_Rate, Account_number)
VALUES (6, 302); 


INSERT INTO LOAN_ACCOUNT (Fixed_Rate, Account_number)
VALUES (4, 303); 

INSERT INTO LOAN_ACCOUNT (Fixed_Rate, Account_number)
VALUES (7, 304);

INSERT INTO LOAN_ACCOUNT (Fixed_Rate, Account_number)
VALUES (3, 305);

/*
SELECT *
FROM LOAN_ACCOUNT;
*/

INSERT INTO CHECKING_ACCOUNT (Overdrafts, Account_number)
VALUES (500, 301);

INSERT INTO CHECKING_ACCOUNT (Overdrafts, Account_number)
VALUES (1000, 302);

INSERT INTO CHECKING_ACCOUNT (Overdrafts, Account_number)
VALUES (750, 303);

INSERT INTO CHECKING_ACCOUNT (Overdrafts, Account_number)
VALUES (1200, 304);

INSERT INTO CHECKING_ACCOUNT (Overdrafts, Account_number)
VALUES (900, 305);

/*
SELECT * 
FROM CHECKING_ACCOUNT
*/

INSERT INTO SAVINGS_ACCOUNT (Fixed_rate, Account_number)
VALUES (3, 301);

INSERT INTO SAVINGS_ACCOUNT (Fixed_rate, Account_number)
VALUES (2, 302);

INSERT INTO SAVINGS_ACCOUNT (Fixed_rate, Account_number)
VALUES (1, 303);

INSERT INTO SAVINGS_ACCOUNT (Fixed_rate, Account_number)
VALUES (4, 304);

INSERT INTO SAVINGS_ACCOUNT (Fixed_rate, Account_number)
VALUES (5, 305);

/*
SELECT * 
FROM SAVINGS_ACCOUNT
*/

INSERT INTO MONEY_MARKET_ACCOUNT (Variable_rate, Account_number)
VALUES (1.5, 301);

INSERT INTO MONEY_MARKET_ACCOUNT (Variable_rate, Account_number)
VALUES (2.0, 302);

INSERT INTO MONEY_MARKET_ACCOUNT (Variable_rate, Account_number)
VALUES (1.8, 303);

INSERT INTO MONEY_MARKET_ACCOUNT (Variable_rate, Account_number)
VALUES (2.2, 304);

INSERT INTO MONEY_MARKET_ACCOUNT (Variable_rate, Account_number)
VALUES (2.5, 305);

/*
SELECT * 
FROM MONEY_MARKET_ACCOUNT
*/

/*------------------------------------------------------------------------------------------*/

/*Queries*/

/*
Gets the total loan amount from each bank branch.

SELECT Branch_id, SUM(Loan_amount) AS Total_Loan_Amount
FROM LOAN
GROUP BY Branch_id;

Gets total loan amount from each bank branch that is greated than 50,000.

SELECT Branch_id, SUM(Loan_amount) AS Total_Loan_Amount
FROM LOAN
GROUP BY Branch_id
HAVING SUM(Loan_amount) > 50000;

Gets the name and employment length of employees that have worked longer than the manager of the branch with id 2. 

SELECT Name, Emp_length 
FROM EMPLOYEES
WHERE Emp_length > ALL (
        SELECT Emp_length 
        FROM EMPLOYEES E
        JOIN BRANCH B ON B.Mgnr_SSN = E.SSN
        WHERE B.Branch_id = 2
    );
    
Gets the name, city, and state of customers who use the downton or main branch.

SELECT Name, City, State 
FROM CUSTOMERS
WHERE Branch_id IN (
        SELECT Branch_id 
        FROM BRANCH 
        WHERE Name IN ('Downtown Branch', 'Main Branch')
    );

*/