SELECT subjects.label,
		COUNT(posted_books.barcode) AS "# of Items in Subject Area Posted"
	FROM subjects
	LEFT JOIN sections_subjects ON sections_subjects.subject_id = subjects.subject_id
	INNER JOIN posted_books ON posted_books.cn_section = sections_subjects.cn_section
	LEFT JOIN faculty_books ON faculty_books.barcode = posted_books.barcode
	GROUP BY subjects.subject_id