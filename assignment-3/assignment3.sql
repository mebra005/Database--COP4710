SELECT	title
FROM	book AS B
WHERE	B.publishercode IN (SELECT	publishercode
			   FROM		publisher
			   WHERE	publishername = 'Penguin USA')
			   ORDER BY	title;

(SELECT	title
FROM	book AS B
WHERE	type ='PSY')
UNION		
(SELECT title
FROM	book
WHERE	publishercode='JP')
ORDER BY title;	


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


SELECT	title
FROM	author AS A, book AS B, wrote AS W
WHERE	A.authornum = W.authornum AND B.bookcode = W.bookcode
	AND A.authorlast ='Steinbeck' AND A.authorfirst ='John'
ORDER BY title;


SELECT	title, publishercode, type, authorfirst, authorlast
FROM	book AS B, author AS A, wrote as W
WHERE	A.authornum = W.authornum AND B.bookcode = W.bookcode
ORDER BY B.title, W.sequence;


SELECT	COUNT(price)
FROM 	copy AS C
WHERE	price > 20 AND price < 25;


SELECT	P.publishername, COUNT(*)
FROM	book AS B, publisher AS P
WHERE	B.publishercode = P.publishercode
GROUP BY P.publishername
HAVING	COUNT(*) > 2;
			   


SELECT  B.title, A.authorfirst, A.authorlast
FROM	author AS A, book AS B
WHERE	(B.bookcode, A.authornum) IN (
	SELECT	W.bookcode, W.authornum
	FROM	wrote as W
	WHERE	W.bookcode IN (
		(SELECT bookcode 
		FROM	wrote AS W) 
		INTERSECT ALL
		(SELECT	 C.bookcode
		FROM	copy AS C, branch AS BR
		WHERE	C.branchnum = BR.branchnum AND C.quality = 'Excellent' AND BR.branchname = 'Henry on the Hill')))
		ORDER BY	title;



SELECT bookcode 
FROM	wrote AS W
where W.bookcode in (
SELECT	 C.bookcode
FROM	copy AS C, branch AS BR
WHERE	C.branchnum = BR.branchnum AND C.quality = 'Excellent' AND BR.branchname = 'Henry on the Hill');

CREATE TABLE FictionCopies
(bookcode	CHAR(4),
 title		CHAR(40),
 branchNum	DECIMAL(2,0),
 copyNum	DECIMAL(2,0),
 quality	CHAR(20),
 price		DECIMAL(8,2))
 ;








