SELECT posted_books.barcode, posted_books.title, posted_books.pub_year FROM posted_books
	INNER JOIN posted_files ON posted_files.file_id = posted_books.file_id
	WHERE posted_files.month > '2020-01-15' 
		AND posted_files.month < '2020-02-15';