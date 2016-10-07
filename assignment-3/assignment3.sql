SELECT	title
FROM	book
WHERE	publishercode IN (SELECT	publishercode
			  FROM		publisher
			  WHERE		publishername = 'Penguin USA')
			  ORDER BY title;
			  
(SELECT	title
FROM	book AS B
WHERE	type ='PSY')
UNION		
(SELECT title
FROM	book
WHERE	publishercode='JP')
ORDER BY title;
