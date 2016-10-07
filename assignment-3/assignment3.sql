SELECT	title
FROM	book
WHERE	publishercode IN (SELECT	publishercode
			  FROM		publisher
			  WHERE		publishername = 'Penguin USA')
			  ORDER BY title;
