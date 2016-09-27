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


q1 := project bookCode, title, price,authorLast, authorFirst, sequence (select type = 'ART' (book njoin (author njoin wrote)));

resBook(type) :=  project bookCode (select (type = 'FIC') (book));
resAuth := resBook njoin author;
q2 := project authorLast, authorFirst(resAuth);

respub := (author njoin wrote) njoin (book njoin publisher);
q3 := project authorFirst, authorLast (select publisherName = 'Jove Publications' (respub));

q4:= project authorFirst, authorLast (((project authorNum (author)) difference (project authorNum (wrote))) njoin author); 

%q5a := author njoin (project sequence,authorNum (wrote));
%q5b := branch njoin (select quality = 'Good' (copy));
%q5c := book njoin q5b;
%q5d := q5a njoin q5b;
%q5 := project title, branchName, authorFirst, authorLast , sequence ((q5d) njoin book);


%author(authorFirst,authorLast,au)
%wrote(sequence)
%book(title)
%branch(branchName)
%copy(quality)
q5a := select quality = 'Good' (copy);
q5b := book njoin copy;
%q5c := project (copy);

authorNumBookCode(authorNum, bookCode):=
	project authorNum, bookCode (book njoin wrote);
authorNumBookCodeCopy(authorNum1, bookCode1):=
	authorNumBookCode;
writtenMoreThanOne:=
	project authorNum ( select authorNum = authorNum1 and bookCode <> bookCode1 (authorNumBookCode product authorNumBookCodeCopy));
q6:= 
	project authorFirst,authorLast (writtenMoreThanOne njoin author);








