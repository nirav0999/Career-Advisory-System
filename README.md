# Career-Advisory-System
A prolog based career advisory system for 3rd-4th year computer science undergraduate students. Provides you the field you should pursue and answers the perpetual question of Job Vs Research. 

<h4>Steps to run the program -</h4>
<ol>
<li> Load the file in SWI - Prolog via ?- [main]. 
<li> To run the program execute - ?- suggest. 
<li> Now the program first asks you about your choice of field. 

The program loads with the above heading. I added a couple of sleep commands  to make the program loading more authentic. <br>

<b> Are you interested in Computer Networks ? </b> <br>
So let’s say you are interested in Computer networks, type .y.
If you are not interested type n. ,.the program would straight away move onto the field for the
next question.

<b> How many courses did you take related to Computer Networks?</b><br>
NOTE - This has to be an integer
So let’s say you have taken 3 courses , type 3.
If you have less than 2 courses, the program would straight away move onto the field for the
next question.

<b> What is your average GPA in the courses you have taken for Computer Networks? </b><br>
NOTE - This has to be an integer
So let’s say you have taken 8 courses , type 8.
If you have less than 8 , the program would straight away move onto the field for the next
question.

These questions would be asked for - Computer Networks, Computer Security
Artificial Intelligence, Machine Learning, Human Computer Interaction

<li> The program then asks you whether you want a research role or a job role in the
immediate future was- 

Note that you may be interested in both, any one (or n. in both ).When you give same answer for each of the 2 questions, the program interprets that as you being confused and would later give you some advice for that.

<li> Next the program asks for 3 questions -

<b> Have you done a BTP? </b> <br>
y. - interpretation that you have some research experience <br>
n. - interpretation that you do not have research experience <br>

<b> What is your GPA? </b> <br>
NOTE - This has to be an integer <br>

<b> Do you have an interest and experience in competitive programming? </b> <br>
y. - interpretation that you may be suited for a job <br>
n. - interpretation that you may not be suited for a job <br>
</ol>

Two types of advices are given -
<h2> Field Advice -</h2> <br>

<b> What field should you enter? </b> <br>
There may be multiple recommendations for this out of the 5 field we have given
A field is only recommended iff #courses you have taken for the field >= 2 and your average
GPA in those courses >=8.

<b> Immediate Future Advice -</b> <br>
We give our advice on a question which preplexes most B.tech students at IIITD, whether to
apply for a job as an engineer or to go into a research field.
Largely we make recommendations based on BTP (favors research), competitive programming
interest and experience (favors job) and specific advice on what could be done in the immediate
future. 

As an additional feature, in the spirit of learning in AI, a question in the end is asked whether the
advice that was provided was useful or NOT. The response is recorded and appended in a txt
file named as "feedback.txt" along with the answers provided. The operators can check the
effectiveness of the program this way based on the number of positive reviews
