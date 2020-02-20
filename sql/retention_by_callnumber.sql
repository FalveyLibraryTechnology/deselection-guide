SELECT posted_books.callnumber,gg_books.uses_item,gg_books.last_charge_item,posted_books.title,posted_books.pub_year,posted_books.author,gg_books.publisher,posted_books.barcode,
		faculty_books.personal as 'Faculty Request',posted_books.callnumber_sort
	FROM posted_books
	LEFT JOIN faculty_books ON faculty_books.barcode = posted_books.barcode
	INNER JOIN gg_books ON gg_books.barcode = posted_books.barcode
	WHERE posted_books.callnumber LIKE 'QA%' 
		AND posted_books.barcode NOT IN (SELECT barcode FROM excluded_barcodes)
	ORDER BY posted_books.callnumber_sort;