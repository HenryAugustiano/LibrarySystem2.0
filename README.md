<H1> LibrarySystem2.0 </H1>
This version of our library system adds to our initial version 1 of our library system that can be found here: https://github.com/310g17/librarySystem</br>
We decided to not branch and to create a new repository as this version is far different than the initial as a complete system overhaul was required. Methods from the first version may remain, however, the code will differ as we've abandoned the initial .csv approach to our system. <br/>
Our initial goal still remains the same. Our team’s project is focused on the creation of a library system that primarily focuses on the borrowing feature of a library. The library system will be created as an app as we believe the mobility of a mobile device is handy for librarians that want to check and see book. Furthermore, our website is centred around 5 main features. Our primary feature will be the ability to check in and check out, this system will function around our book database that tracks our stock of books. Aside from borrowing and returning books, we also want to implement a simple filtering tool. There is another feature we decided to implement, which is the idea of an individual account. Users and administrators will have their own accounts, each with different access levels. Administrators have access to the addition and removal of borrowable books in the database of books. To support the library in terms of its security, we have decided to implement a tracking system for books. If a person has borrowed 2 books or an overdue book (books borrowed for over 2 weeks) they are unable to borrow more. </br>
The core functionalities of our system is still the same however, due to the previous systems limitations of using a .csv file to store our data we will transition into SQL for better code readability and overall performance. Furthermore, by using SQL we believe it will be easier to solve the issue of data storage. <br/>
<br/>
Our website can be found under the web folder.
<H2>Data Flow Diagrams</H2><br/>
Our Data Flow Diagram (DFD) provides a preview of how data flows in our system. We provide two views, level-0 and level-1 DFD's. <br/>
<h3>Level-0</h3>
Level-0 or L0 DFD's are meant to represent the most basic functionalities. It should represent all the high level functionalities. For this system, this is what our L0 DFD should look like: <br/>

![alt text](ReadMeRsc/dfd0.jpeg)<br/>

The high level functionalities here are highlighted. The arrows represent where the data flows and the labels tell you what it does. The difference between admins and users can be seen here. Admins are able to add or remove books from the system. <br/>

<h3>Level-1</h3>
Our Level-1 or L-1 DFD should describe the high level functionalities and all the subprocesses that play a part in our system. This is what our L-1 DFD looks like: <br/>

![alt text](ReadMeRsc/AccountsLogin.png) <br/>

In this case, we can clearly see the dependencies of data. We begin at entity that is a user logging in. During the log in phase, users are able to make an account or log in to the system. User data is stored and taken from the user table in the database. Failure to log-in will send users back to the log in page. Then we move on to the process of choosing what the user wants to do. This process differs based on the data in the log in phase. If they are admins they are able to add and remove books on top of the other listed features. Upon choosing what to do, the database of books is updated and the user database is updated. Then results are updated and displayed. <br/>

<h2>Features changed or added:</h2><br/>
1. Addition of a filter feature<br/>
This feature was initially cut due to the constraints provided by a .csv system. Now, with the addition of SQL to our system, it's possible to use a relatively simple SELECT query to filter specific books. Filtering books would be a big deal in our system as it is integral for libraries to categorize and find books relatively fast. Even if it is just a simple filtering feature. <br/>

![alt text](ReadMeRsc/filter1.jpeg)<br/>

![alt text](ReadMeRsc/filter2.jpeg)<br/>

![alt text](ReadMeRsc/filter3.jpeg)<br/>
<br/>

2. Reprogramming older features (login, new account, add book, remove book) to suit our new SQL integration<br/>
This feature was changed due to the complexity of our previous system. The previous system heavily relied on the .csv readers and writers. This made our code extremely inefficient. The amount of reads and writes we had to do also convoluted the code and was relatively messy. </br>

![alt text](ReadMeRsc/borrow.jpeg)<br/>

![alt text](ReadMeRsc/borrow2.jpeg)<br/>
<br/>

3. Addition of a GUI, from terminal to website <br/>
Pairing the new SQL integration with the GUI also creates a better user experience as we're now adding buttons instead of relying on users typing (less errors). Furthermore, by using a website users do not have to download an application and can use the information easily. This solves the initial issue of users having to operate on a terminal and requiring expert knowledge to even open and operate the system. Users would need to use docker to access the website itself currently. This creates an issue of expert level set up. However, upon completion of set up the application no longer requires individuals to operate at an expert level.<br/>

![alt text](ReadMeRsc/book.jpeg)<br/>

![alt text](ReadMeRsc/book2.jpeg)<br/>

4. A new contact us feature<br/>
To support users that might not understand how to operate the website, or if they have issues. We have placed a contact us button in the login page. <br/>

![alt text](ReadMeRsc/contactUs.jpeg)<br/>

![alt text](ReadMeRsc/email.jpeg)<br/>
<br/>

5. SQl integration<br/>
6. In version 2 of our program we are no longer using csv for the database. The csv format was causing limitations, and the SQL format allows for better integration.<br/> 
![alt text](ReadMeRsc/ddl.png)<br/>
<br/>

7. PayPal implementation 
For existing users who borrowed more than 14 days, they will get charged with late fees. This implementation helps for the user to pay the fees and asve more time rather than paying it using cash(in-person). <br/>

![alt text](ReadMeRsc/paypal.png)<br/>
<br/>

8. Google Map implementation
On our main page, we implemented google map (UBCO Library for simplicity purpose) to help users navigate their way to the library. This implementation helps user to find our library location where they can press "direction" in the google map API and find the best route from their location. 

![alt text](ReadMeRsc/gmap.png)<br/>
