SELECT (SELECT COUNT(barcode) FROM gg_books) as gg_total,
(SELECT COUNT(barcode) FROM gg_books)-(SELECT COUNT(barcode) FROM posted_books) as staff_retained,
(SELECT COUNT(barcode) FROM faculty_books) as faculty_retained
;