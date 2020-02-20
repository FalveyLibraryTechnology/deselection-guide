SELECT subjects.label,
		COUNT(DISTINCT posted_books.barcode) AS "# of Items Retained By Faculty"
	FROM subjects
	LEFT JOIN sections_subjects ON sections_subjects.subject_id = subjects.subject_id
	INNER JOIN posted_books ON posted_books.cn_section = sections_subjects.cn_section
	LEFT JOIN faculty_books ON faculty_books.barcode = posted_books.barcode
	WHERE faculty_books.personal = 0
	GROUP BY subjects.subject_id