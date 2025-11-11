% z5270589 YiJie Zhao 
% COMP 3411 Assignment 3 - Planning and Machine Learning
% Submit in 21/04/2023

% Question 1 Planning:

% Move Clockwise
action( mc,				        % Robot move clockwise
        state(cs, RHC, SWC, MW, RHM),		% Before action, Rob in Coffee Shop
        state(off, RHC, SWC, MW, RHM)).		% After action, Rob should in Sam Office
action( mc,				        % Robot move clockwise
        state(off, RHC, SWC, MW, RHM),		% Before action, Rob in Sam Office
        state(lab, RHC, SWC, MW, RHM)).		% After action, Rob should in Lab

action( mc,				        % Robot move clockwise
        state(lab, RHC, SWC, MW, RHM),		% Before action, Rob in Lab
        state(mr, RHC, SWC, MW, RHM)).		% After action, Rob should in Mail Room

action( mc,					% Robot move clockwise
        state(mr, RHC, SWC, MW, RHM),		% Before action, Rob in Mail Room
        state(cs, RHC, SWC, MW, RHM)).		% After action, Rob should in Coffee Shop

% Anti-Clockwise
action( mcc,				        % Robot move anti-clockwise
        state(cs, RHC, SWC, MW, RHM),		% Before action, Rob in Coffee Shop
        state(mr, RHC, SWC, MW, RHM)).		% After action, Rob should in Mail Room

action( mcc,				        % Robot move anti-clockwise
        state(mr, RHC, SWC, MW, RHM),		% Before action, Rob in Mail Room
        state(lab, RHC, SWC, MW, RHM)).		% After action, Rob should in Lab

action( mcc,					% Robot move anti-clockwise
        state(lab, RHC, SWC, MW, RHM),		% Before action, Rob in Lab
        state(off, RHC, SWC, MW, RHM)).		% After action, Rob should in Sam Office

action( mcc,					% Robot move anti-clockwise
        state(off, RHC, SWC, MW, RHM),		% Before action, Rob in Sam Office
        state(cs, RHC, SWC, MW, RHM)).		% After action, Rob should in Coffee Shop

% Pick-up Coffee
action( puc,					% Rob Pick up Coffee in Coffee Shop
        state(cs, false, SWC, MW, RHM),		% Before action, Rob has not coffee
        state(cs, true, SWC, MW, RHM)).		% After action, Rob has coffee

% Deliver Coffee
action( dc,					% Rob Deliver Coffee to Sam Office
        state(off, true, true, MW, RHM),	% Before action, Rob has coffee and Sam wants coffee
        state(off, false, false, MW, RHM)).	% After action, Rob has not coffee and Sam does not want coffee

% Pick-up Mail
action( pum,					% Rob Pick-up Mail in Mail Room
        state(mr, RHC, SWC, true, false),	% Before action, Rob has not mail and there is mail waiting
        state(mr, RHC, SWC, false, true)).	% After action, Rob has mail and there is not mail waiting

% Deliver Mail
action( dm,					% Rob Deliver Mail to Sam Office
        state(off, RHC, SWC, MW, true),		% Before action, Rob has mail 
        state(off, RHC, SWC, MW, false)).	% After action, Rob has mail

% plan(StartState, FinalState, Plan)

plan(State, State, []).				% To achieve State from State itself, do nothing

plan(State1, GoalState, [Action1 | RestofPlan]) :-
	action(Action1, State1, State2),	% Make first action resulting in State2
	plan(State2, GoalState, RestofPlan). 	% Find rest of plan

% Iterative deepening planner
% Backtracking to "append" generates lists of increasing length
% Forces "plan" to ceate fixed length plans

id_plan(Start, Goal, Plan) :-
    append(Plan, _, _),
    plan(Start, Goal, Plan).


%------------------
% Question 2 Inductive Logic Programming:
% Example inter_construction
:- op(300, xfx, <-).
inter_construction(C1 <- B1, C2 <- B2, C1 <- Z1B, C2 <- Z2B, C <- B) :-
C1 \= C2,
intersection(B1, B2, B),
B \= [],
gensym(z, C),
subtract(B1, B, B11),
subtract(B2, B, B12),
append(B11, [C], Z1B),
append(B12, [C], Z2B).
%-----------------
% Question 2.1 intra_construction:
:- op(300, xfx, <-).
intra_construction(C1 <- B1, C1 <- B2, C1 <- Z1B, C <- Z2B, C <- B) :-
intersection(B1, B2, B13),
B13 \= [],
gensym(z, C),
subtract(B1, B13, Z2B),
subtract(B2, B13, B),
append(B13, [C], Z1B).
%------------------
% Question 2.2 absorption:
:- op(300, xfx, <-).
absorption(C1 <- B1, C2 <- B2, C1 <- Z1B, C2 <- Z2B) :-
C1 \= C2,
subset(B2, B1),
subtract(B1, B2, B11),
append(B11, [C2], Z1B),
append(B2, [], Z2B).
%-------------------
% Question 2.3 truncation:
:- op(300, xfx, <-).
truncation(C1 <- B1, C1 <- B2, C1 <- Z1B) :-
intersection(B1, B2, Z1B).
%-------------------