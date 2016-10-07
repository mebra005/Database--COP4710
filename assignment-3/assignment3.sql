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
			   










