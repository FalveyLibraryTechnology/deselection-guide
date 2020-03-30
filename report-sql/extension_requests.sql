SELECT faculty.name,faculty.department,COUNT(faculty_books.barcode) as extended/*, faculty_requests.date, DATETIME(posted_files.month,'start of month','+1 month') as deadline */
	FROM posted_files
	INNER JOIN posted_books ON posted_books.file_id = posted_files.file_id
	INNER JOIN faculty_books ON faculty_books.barcode = posted_books.barcode
	INNER JOIN faculty_requests ON faculty_requests.request_id = faculty_books.request_id
	INNER JOIN faculty ON faculty.faculty_id = faculty_requests.faculty_id
	WHERE faculty_requests.date > DATETIME(posted_files.month,'start of month','+1 month')
	  AND faculty_books.personal = 0
	GROUP BY faculty.name
	ORDER BY extended DESC