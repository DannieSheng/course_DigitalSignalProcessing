function [ corrCoef, matchedDoc, index ] = searchEngine( searchTerm )
%The function that is able to return the correlation coefficient and matched documents given an input searchTerm as a string
%   Input: searchTerm: a string
%   Output: corrCoef: the correlation coefficient corresponding to the best matched text
%           matchedDoc: the matched text
%           index: the index of the matched text
% Author: Huanyun Sheng
% email: hdysheng@ufl.edu
load('2018_eee5502_code01_q2.mat')
content     = split(searchTerm);
searchTermCount = zeros(1,length(vocabulary));
for i_C = 1:length(content)
    for i_voc = 1:length(vocabulary)
        if strcmpi(vocabulary{i_voc}, content{i_C})
            searchTermCount(i_voc) = searchTermCount(i_voc)+1;
        end
    end
end
corrCoefAll = [];
for i_D = 1:length(documents)
    corrCoefAll(i_D,:) = searchTermCount*counts(i_D,:)'/(norm(searchTermCount)*norm(counts(i_D,:)));
end
[~, index] = max(corrCoefAll);
corrCoef = corrCoefAll(index);
matchedDoc = documents{index};
% disp(['The matched document is ' matchedDoc])

% disp(['The corresponding correlation coefficient is ' num2str(corrCoef)])
end

