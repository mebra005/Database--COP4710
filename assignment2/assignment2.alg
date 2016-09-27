%
%Relational Model representation of the Henry Books Database:
%
%-------------------------------------------------------------------------------------------------------------------------------
% 	      RELATIONAL ALGEBRA
% -------------------------------------------------------------------------------------------------------------------------------
%	    HENRY BOOKS DATABASE
%
%  Author - (authorNum/numeric, authorLast/char, authorFirst/char) 			PK: authorNum
%  Book - (bookCode/char, title/char, publisherCode/char, type/char, price/numeric, paperback/char) 	PK: bookCode
%  Branch - (branchNum/numeric, branchName/char, branchLocation/char, numEmployees/numeric) 	PK: branchNum
%  Inventory - (bookCode/char, branchNum/numeric, onHand/numeric)			PK: bookCode
%  Publisher - (publisherCode/char, publisherName/char, city/char) 			PK: publisherCode
%  Wrote - (bookCode/char, authorNum/numeric, sequence/numeric) 			PK: bookCode,authorNum
%  Copy - (bookCode/char, branchNum/numeric, copyNum/numeric, quality/char, price/numeric) 	PK: bookCode, branchNum, copyNum
%
%--------------------------------------------------------------------------------------------------------------------------------
%
%


%------------------------------------------------------------Question 1-----------------------------------------------------------------------------------------

q1 := project bookCode, title, price,authorLast, authorFirst, sequence (select type = 'ART' (book njoin (author njoin wrote)));


%------------------------------------------------------------Question 2-----------------------------------------------------------------------------------------

resBook(type) :=  project bookCode (select (type = 'FIC') (book));
resAuth := resBook njoin author;
q2 := project authorLast, authorFirst(resAuth);


%------------------------------------------------------------Question 3-----------------------------------------------------------------------------------------

respub := (author njoin wrote) njoin (book njoin publisher);
q3 := project authorFirst, authorLast (select publisherName = 'Jove Publications' (respub));

%------------------------------------------------------------Question 4-----------------------------------------------------------------------------------------

q4:= project authorFirst, authorLast (((project authorNum (author)) difference (project authorNum (wrote))) njoin author); 

%------------------------------------------------------------Question5-----------------------------------------------------------------------------------------

copyBookCodeBranch :=(project bookCode,branchNum (select quality = 'Good' (copy))) njoin branch;
authorWroteBook := (author njoin wrote) njoin book;
combined := copyBookCodeBranch njoin authorWroteBook;
p5:= project title, branchName, authorFirst, authorLast, sequence ( combined);

%------------------------------------------------------------Question 6-----------------------------------------------------------------------------------------

authorNumBookCode(authorNum, bookCode):= project authorNum, bookCode (book njoin wrote);
authorNumBookCodeCopy(authorNum1, bookCode1):= authorNumBookCode;
writtenMoreThanOne:= project authorNum ( select authorNum = authorNum1 and bookCode <> bookCode1 (authorNumBookCode product authorNumBookCodeCopy));
q6:= project authorFirst,authorLast (writtenMoreThanOne njoin author);


%------------------------------------------------------------Question 7-----------------------------------------------------------------------------------------

copyQualityBookCode := project bookCode, quality (copy);
copyQulity := project quality(copy);
%copydif := copyQualityBookCode intersection copyQulity;

bookWithNotAllQuality :=  project bookCode ((project bookCode, quality (copy)) difference copyQualityBookCode);




