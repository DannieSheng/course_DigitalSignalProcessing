dbstop if error
clear;
close all; clc
load('2018_eee5502_code01_q2.mat')

%% part (b)
change the content in 'searchTerms' so that you can get the metched document and corresponding correlation coefficient
searchTerms = 'welcome to zork';%'we found the crown of lord dimwit flathead in the canyon';%'the wizard of frobozz cast a spell';%
[ corrCoef, matchedDoc, index ] = searchEngine( searchTerms );
disp(['The matched document for the search term ' searchTerms ' is: ' matchedDoc])
disp(['Which is the ' num2str(index) '-th content'])
disp(['The corresponding correlation coefficient is ' num2str(corrCoef)])

%% part (c)
UFID = '21959681';
searchTerms = strjoin(get_search_term(UFID));
[ corrCoef, matchedDoc, index ] = searchEngine( searchTerms );
disp(['The matched document for the search term ' searchTerms ' is: ' matchedDoc])
disp(['Which is the ' num2str(index) '-th content'])
disp(['The corresponding correlation coefficient is ' num2str(corrCoef)])