use [Finance DB]
select * from financial_loan

--Total Loan Applications

select COUNT(id) as Total_Loan_Applications from financial_loan

--MTD Loan Applications
select COUNT(id) as MTD_Total_Loan_Applications from financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--PMTD Loan Applications
select COUNT(id) as PMTD_Total_Loan_Applications from financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--Total Funded Amount

select SUM(loan_amount) as Total_Funded_Amt from financial_loan

--MTD Funded Amount
select SUM(loan_amount) as MTD_Total_Funded_Amt from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

--PMTD Funded Amount
select SUM(loan_amount) as PMTD_Total_Funded_Amt from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021


--Total Amount Received

select SUM(total_payment) as Total_Amt_Received from financial_loan

--MTD Total Amount Received
select SUM(total_payment) as MTD_Total_Amt_Received from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

--PMTD Total Amount Received
select SUM(total_payment) as PMTD_Total_Amt_Received from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021


--Avg Int Rate

Select ROUND(AVG(int_rate),4)*100 AS AVG_INT_RATE FROM financial_loan

--MTD Avg Int Rate
Select ROUND(AVG(int_rate),4)*100 as MTD_AVG_INT_RATE FROM financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

--PMTD Avg Int Rate
Select ROUND(AVG(int_rate),4)*100 as PMTD_AVG_INT_RATE FROM financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

--MTD AVG DTI
select ROUND(AVG(dti),4) * 100 as MTD_Avg_dti from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

--PMTD AVG DTI
select ROUND(AVG(dti),4) * 100 as PMTD_Avg_dti from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

--Good Loan Percentage
select (Count (CASE when loan_status = 'Fully Paid' or loan_status = 'Current'
         Then id end) * 100.0) / COUNT(id) As Good_Loan_Percentage
         from financial_loan

--Good loan Applications
select count(id) As GOOD_LOAN_APPLICATIONS from financial_loan
where loan_status = 'fully paid' or loan_status = 'Current'

--GOOD_LOAN_FUNDED_AMOUNT
select sum(loan_amount) as GOOD_LOAN_FUNDED_AMOUNT from financial_loan
where loan_status = 'fully paid' or loan_status = 'Current'

--GOOD_LOAN_Total_Received_AMOUNT
select sum(total_payment) as GOOD_LOAN_Total_Received_AMOUNT from financial_loan
where loan_status = 'fully paid' or loan_status = 'Current'


--BAD loan Percentage

select (COUNT(CASE when loan_status = 'Charged Off' then id end)*100.0) / count(id) as Bad_Loan_Percentage
 from financial_loan

 --BAD loan Applications
select count(id) As BAD_LOAN_APPLICATIONS from financial_loan
where loan_status = 'Charged Off'

 --BAD_LOAN_FUNDED_AMOUNT
select sum(loan_amount) as BAD_LOAN_FUNDED_AMOUNT from financial_loan
where loan_status = 'Charged Off'

 --BAD_LOAN_Received_AMOUNT
select sum(total_payment) as BAD_LOAN_Received_AMOUNT from financial_loan
where loan_status = 'Charged Off'


--Loan Status

select loan_status,count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan,
AVG(int_rate * 100) as Interest_Rate,
AVG(dti * 100) as DTI
from financial_loan
group by loan_status


select loan_status,count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
where MONTH(issue_date) = 12
group by loan_status


--Monthly Trends


select MONTH(issue_date) as Month_Num,
DATENAME(month,issue_date) as Month,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by DATENAME(month,issue_date),MONTH(issue_date)
order by Month(issue_date)


select * from financial_loan
where id = 1066789


--Regional Analysis by State

select address_state,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by address_state
order by count(id) desc

--Term Analysis

select term,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by term
order by count(id) desc


--Emp Length Analysis

select emp_length,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by emp_length
order by count(id) desc


--Loan Purpose Analysis

select purpose,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by purpose
order by count(id) desc


--Home Ownership  Analysis

select home_ownership,
count(id) as LoanCount,
sum(loan_amount) as Total_Funded_Loan,
sum(total_payment) as Total_Payment_Loan
from financial_loan
group by home_ownership
order by count(id) desc