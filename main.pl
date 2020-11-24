% fields
field('Computer Networks').
field('Computer Security').
field('Artifical Intelligence').
field('Machine Learning').
field('Human Computer Interaction').

suggest:-
	
	write('\t\t ==================== CAREER ADVICE ======================'),nl,sleep(0.25),
	write('\t\t\t Designed by: Nirav Diwan for AI Course @ IIITD '),nl,sleep(0.25),
	write('\t\t\t\t  Roll Number: 2017072'), nl, sleep(0.25), nl, nl, 
	
	retractall(interest_list(_)),
	retractall(gpa(_)),
	retractall(research(_)),
	retractall(job(_)),
	retractall(btp(_)),
	retractall(cp(_)),
	retractall(feedback(_)),
	write('Hey lets first talk about your interests in the field of computer science ?'), sleep(0.25), nl,
	ask_interests(_),
	ask_research,
	ask_job, nl,
	write('Now, lets get some of your background info ?'), sleep(0.25),nl ,
	ask_BTP,
	ask_GPA,
	ask_CP,
	write('\t\t\t----------- FIELD ADVICE --------'), nl, 
	write('Fields you should be persuing based on your answers - '), nl, sleep(0.25),
	advice_field(_),

	write('\t\t\t----------- IMMEDIATE FUTURE ADVICE --------'), nl, 
	write('So our final advice is as follows - '), nl, sleep(0.25),
	
	final_advice(_, _, _, _, _),
	feedback,
	program.

ask_interests(Interest) :- 
	field(Interest),
	interested(Interest),
	assert(recommended(Interest)),fail.

ask_interests(_) :- 
	nl, convert_to_list(List), 
	write('The list of recommended places for you is '), 
	write(List), nl,!,
	assert(interest_list(List)).

interested(Interest) :- 
	nl,
	write('Are you interested in '), write(Interest), write(':'),
	read(Y), Y = y,
	write('How many courses did you take related to '), write(Interest), write('?'),
	read(X), X >= 2,
	write('What is your average GPA in the courses you have taken for '), write(Interest),write('?'),
	read(A), A >= 8.

convert_to_list([Px|Tail]) :-
	field(Px),
	retract(recommended(Px)), 
	convert_to_list(Tail).

convert_to_list([]).


% BTP 
ask_BTP:- write('Have you done a BTP?'), nl, read(Y), nl, make_btp(Y).
make_btp(Y) :- Y = y, assert(btp('True')).
make_btp(Y) :- Y = n, assert(btp('False')).

% GPA 
ask_GPA:- write('What is your GPA?'), nl, read(Y), nl, make_GPA(Y).
make_GPA(Y) :- Y >= 8, assert(gpa('good')).
make_GPA(Y) :- Y < 8, assert(gpa('bad')).

% CP  
ask_CP:- write('Are you interested in competitive programming?'), nl, read(Y), nl, make_CP(Y).
make_CP(Y) :- Y = y, assert(cp('good')).
make_CP(Y) :- Y = n, assert(cp('bad')).

% Research 
ask_research:- write('Are you interested in Research Role ?'), nl, read(Y), nl, make_research(Y).
make_research(Y) :- Y = y, assert(research('True')).
make_research(Y) :- Y = n, assert(research('False')).

% Job 
ask_job:- write('Are you interested in an engineer Role ?'), nl, read(Y), nl, make_job(Y).
make_job(Y) :- Y = y, assert(job('True')).
make_job(Y) :- Y = n, assert(job('False')).

advice_field([X | Tail]) :- field(X), interest_list([X | Tail]),!, write(X), nl, sleep(0.25),advice_field(Tail).
advice_field([]).
advice_field([X | Tail]) :- field(X), write(X), nl, advice_field(Tail), sleep(0.25).



final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'True', BTP_VAL = 'False', (GPA_VAL = 'bad'; CP_VAL = 'good'),nl,
	write('CASE 1 - 3 cases'), nl,
	write('It would better to consider a job in career since you have no research experince'),nl,
	write('and other indicators seem(GPA, CP) indicate a better position to start a engineer job ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'False', BTP_VAL = 'False', GPA_VAL = 'bad', CP_VAL = 'good',
	write('CASE 2'), nl,
	write('Although your interest is in research it would better to consider a job in career since you have no research experince'),nl,
	write('and other indicators seem(GPA, CP) indicate a better position to start a engineer job ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'False', BTP_VAL = 'True', GPA_VAL = 'good',
	write('CASE 3'), nl,
	write('You seem to be destined for solid research career ahead. You have a good GPA and research experince (BTP)'), nl,
	write('Our advice would be go for further studies or take a research fellow position '),
	write('Keep going !!! You are on the right track :) ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'False', BTP_VAL = 'True', GPA_VAL = 'bad',
	write('CASE 4'),nl,
	write('The interest in research is commendable. You have a good research experince, however your GPA is a hindrace'), nl,
	write('Our advice would be to work on your GPA and then apply for a research fellow position or pursue further studies'), nl,
	write('If that option is no longer available, pursue a role as a engineer if you get an option to get some work experince').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'False', BTP_VAL = 'False', GPA_VAL = 'good',
	write('CASE 5'),nl,
	write('The interest in research is commendable. You have a good GPA, however no research experince (NO BTP)  is a hindrace'), nl,
	write('Our advice would be to engage in a few research projects and then apply for a research fellow position or pursue further studies').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'True', BTP_VAL = 'True', (GPA_VAL = 'good'; CP_VAL = 'bad'),
	write('CASE 6 - 3 cases'), nl,
	write('It would better to consider a research role in the immediate future since you have no do not have an interest on competitive programming'),nl,
	write('and other indicators seem(GPA, BTP) indicate a better position to pursue a research role ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'False', BTP_VAL = 'True', (GPA_VAL = 'good'; CP_VAL = 'bad'),
	write('CASE 7'), nl,
	write('Although your interest is to get a engineer job, it would better to consider a research role in the immediate future since you have no do not have an interest on competitive programming'),nl,
	write('and other indicators seem(GPA, BTP) indicate a better position to pursue a research role ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'True', CP_VAL = 'good', GPA_VAL = 'good',
	write('CASE 8'), nl,
	write('You seem to be destined for solid engineer career ahead, you have a good GPA and an interest in competitive programming'), nl,
	write('Keep going !!! You are on the right track').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'True', CP_VAL = 'good', GPA_VAL = 'bad',
	write('CASE 7'),nl,
	write('The aim of getting a engineer job is commendable. You have an interest in Competitive programming which is always a plus while persuing an engineer role'), nl,
	write('Our advice would be to focus on getting a good GPA in the time left in yoour undergraduate years, if thats not possible, take it on the chin, having it is a plus , but not having it does not close doors'), nl.

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'True', CP_VAL = 'bad', GPA_VAL = 'good',
	write('CASE 8'),nl,
	write('The aim of getting a engineer job is commendable, you have a good GPA, however you should brush up your competitive programming skills a bit coz they are helpful in getting a job'), nl.

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'False',BTP_VAL = 'True' ,CP_VAL = 'good',
	write('CASE 9'), nl,
	write('You could pursue either a research role or a engineer role because you have research experience and Competitive programming interest').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'False',BTP_VAL = 'False' ,CP_VAL = 'good',
	write('CASE 10'), nl,
	write('Too bad you have no interest in research because you have research experience and  no Competitive programming interest'),
	write('So we think it should work out for you research').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'False',BTP_VAL = 'True' ,CP_VAL = 'bad', 
	write('CASE 11'), nl,
	write('Too bad you have no interest in research because you have research experience and  no Competitive programming interest'),
	write('So we think it should work out for you research').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'False', JOB_VAL = 'False', BTP_VAL = 'False' , CP_VAL = 'bad',
	write('CASE 12'), nl,
	write('Testing our program eh,  you are a free soul, develop an interest !!!').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'True',BTP_VAL = 'True' , CP_VAL = 'good', GPA_VAL = 'good',
	write('CASE 13'), nl,
	write('You could pursue either a research role or a engineer role because you have research experience and Competitive programming interest'),
	write('and a GOOD GPA :) ').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'True',BTP_VAL = 'False' ,CP_VAL = 'good',
	write('CASE 14'), nl,
	write('You could pursue a engineer role because you have no research experience and Competitive programming interest').

final_advice(RES_VAL, JOB_VAL, BTP_VAL, GPA_VAL, CP_VAL) :-
	research(RES_VAL), job(JOB_VAL), btp(BTP_VAL), gpa(GPA_VAL), cp(CP_VAL),
	RES_VAL = 'True', JOB_VAL = 'True',BTP_VAL = 'False' ,CP_VAL = 'bad', GPA_VAL = 'bad',
	write('CASE 15'), nl,
	write('Although you have interests, but it seems you have acted on them yet'),
	write('We would suggest to be motivated and work a bit harder, you can do it !!!'),
	write('For the time being going for a engineer role seems to be the best fit').


feedback:-
	write('Was the advice helpful? '), nl,
	read(Y), assert(feedback(Y)),
	write('Thanks :)'), nl,
	write('Have a nice day !!!').

program(_):-
	append('feedback.csv', Stream),
    %open('feedback.csv', append, Stream),
    forall(research(Y), write(Stream, Y)), write(Stream, ','),
    forall(job(X), write(Stream, X)), write(Stream, ','),
    forall(btp(A), write(Stream, A)), write(Stream, ','),
    forall(cp(B), write(Stream, B)), write(Stream, ','),
    forall(gpa(C), write(Stream, C)), write(Stream, ','),
    forall(interest_list(G), write(Stream, G)), write(Stream, ','),
    forall(feedback(J), write(Stream, J)),
    close(Stream).


program:-
	append('feedback.txt'), write(','), told,
	append('feedback.txt'), forall(research(Y), write(Y)), told, 
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(job(X), write(X)), told,
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(btp(A), write(A)), told,
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(cp(B), write(B)), told,
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(gpa(C), write(C)), told,
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(interest_list(G),  write(G)), told,
    append('feedback.txt'), write(','), told,
    append('feedback.txt'), forall(feedback(J), write(J)), told.