

/*---------------------Query 1-------------------*/
SELECT	title
FROM	book AS B
WHERE	B.publishercode IN (SELECT	publishercode
			   FROM		publisher
			   WHERE	publishername = 'Penguin USA')
			   ORDER BY	title;
			   
/*---------------------Query 2-------------------*/			   
(SELECT	title
FROM	book AS B
WHERE	type ='PSY')
UNION		
(SELECT title
FROM	book
WHERE	publishercode='JP')
ORDER BY title;	


/*---------------------Query 3-------------------*/
(SELECT	title
FROM	book AS B
WHERE	type ='CMP')
UNION		
(SELECT title
FROM	book
WHERE	type ='HIS')
UNION
(SELECT title
FROM	book
WHERE	type ='SCI')
ORDER BY title;	


/*---------------------Query 4-------------------*/
SELECT	title
FROM	author AS A, book AS B, wrote AS W
WHERE	A.authornum = W.authornum AND B.bookcode = W.bookcode
	AND A.authorlast ='Steinbeck' AND A.authorfirst ='John'
ORDER BY title;

/*---------------------Query 5-------------------*/
SELECT	title, publishercode, type, authorfirst, authorlast
FROM	book AS B, author AS A, wrote as W
WHERE	A.authornum = W.authornum AND B.bookcode = W.bookcode
ORDER BY B.title, W.sequence;

/*---------------------Query 6-------------------*/
SELECT	COUNT(price)
FROM 	copy AS C
WHERE	price BETWEEN 20 and 25;

/*---------------------Query 7-------------------*/
SELECT	P.publishername, COUNT(*)
FROM	book AS B, publisher AS P
WHERE	B.publishercode = P.publishercode
GROUP BY P.publishername
HAVING	COUNT(*) > 2;

/*---------------------Query 8-------------------*/
SELECT	title, authorfirst, authorlast
FROM	book AS B, author AS A, copy AS C, branch AS BR, wrote as W
WHERE	(BR.branchnum = C.branchnum) AND B.bookcode = W.bookcode 
AND 	(branchname = 'Henry on the Hill') AND (quality = 'Excellent')
AND 	(c.bookcode = b.bookcode) AND (w.authornum = a.authornum)
ORDER BY title, sequence;

/*---------------------Query 9-------------------*/
CREATE TABLE FictionCopies
(bookcode	CHAR(4),
 title		CHAR(40),
 branchNum	DECIMAL(2,0),
 copyNum	DECIMAL(2,0),
 quality	CHAR(20),
 price		DECIMAL(8,2))
 ;
 
INSERT INTO	fictioncopies (bookcode, title, branchnum, copynum, quality, price)
SELECT		b.bookcode, title, branchnum, copynum, quality, price
FROM		book AS B, copy AS C
WHERE		B.bookcode = C.bookcode AND B.type = 'FIC';


/*---------------------Query 10-------------------*/
SELECT	bookcode, title, 1.1 * price
FROM	fictioncopies AS F
WHERE	F.quality = 'Excellent'









