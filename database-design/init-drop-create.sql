BEGIN TRANSACTION;
DROP TABLE IF EXISTS "faculty_books";
CREATE TABLE IF NOT EXISTS "faculty_books" (
	"barcode"	INTEGER,
	"personal"	BOOLEAN,
	"comment"	VARCHAR,
	"request_id"	INTEGER,
	PRIMARY KEY("barcode","request_id"),
	FOREIGN KEY("request_id") REFERENCES "requests"("request_id")
);
DROP TABLE IF EXISTS "faculty_requests";
CREATE TABLE IF NOT EXISTS "faculty_requests" (
	"request_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"date"	DATETIME,
	"faculty_id"	INTEGER,
	FOREIGN KEY("faculty_id") REFERENCES "faculty"("faculty_id")
);
DROP TABLE IF EXISTS "faculty";
CREATE TABLE IF NOT EXISTS "faculty" (
	"faculty_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR,
	"address"	VARCHAR,
	"department"	VARCHAR,
	"email"	VARCHAR
);
DROP TABLE IF EXISTS "subjects";
CREATE TABLE IF NOT EXISTS "subjects" (
	"subject_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"label"	VARCHAR
);
DROP TABLE IF EXISTS "sections_subjects";
CREATE TABLE IF NOT EXISTS "sections_subjects" (
	"subject_id"	INTEGER,
	"cn_section"	VARCHAR(3),
	PRIMARY KEY("subject_id","cn_section"),
	FOREIGN KEY("subject_id") REFERENCES "subjects"("subject_id"),
	FOREIGN KEY("cn_section") REFERENCES "callnumber_sections"("cn_section")
);
DROP TABLE IF EXISTS "posted_files";
CREATE TABLE IF NOT EXISTS "posted_files" (
	"file_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR,
	"month"	DATE,
	"librarian_id"	INTEGER,
	FOREIGN KEY("librarian_id") REFERENCES "librarians"("librarian_id")
);
DROP TABLE IF EXISTS "posted_books";
CREATE TABLE IF NOT EXISTS "posted_books" (
	"barcode"	INTEGER,
	"callnumber"	VARCHAR,
	"callnumber_sort"	VARCHAR,
	"cn_section"	VARCHAR(3),
	"title"	VARCHAR,
	"author"	VARCHAR,
	"pub_year"	TINYINT,
	"file_id"	INTEGER,
	PRIMARY KEY("barcode"),
	FOREIGN KEY("file_id") REFERENCES "posted_files"("file_id"),
	FOREIGN KEY("cn_section") REFERENCES "callnumber_sections"("cn_section")
);
DROP TABLE IF EXISTS "librarian_assignments";
CREATE TABLE IF NOT EXISTS "librarian_assignments" (
	"cn_section"	VARCHAR,
	"librarian_id"	INTEGER,
	PRIMARY KEY("cn_section"),
	FOREIGN KEY("cn_section") REFERENCES "callnumber_sections"("cn_section"),
	FOREIGN KEY("librarian_id") REFERENCES "librarians"("librarian_id")
);
DROP TABLE IF EXISTS "librarians";
CREATE TABLE IF NOT EXISTS "librarians" (
	"librarian_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR,
	"initials"	VARCHAR(3)
);
DROP TABLE IF EXISTS "excluded_barcodes";
CREATE TABLE IF NOT EXISTS "excluded_barcodes" (
	"barcode"	INTEGER,
	"set_id"	INTEGER,
	PRIMARY KEY("barcode","set_id"),
	FOREIGN KEY("set_id") REFERENCES "excluded_sets"("set_id")
);
DROP TABLE IF EXISTS "excluded_sets";
CREATE TABLE IF NOT EXISTS "excluded_sets" (
	"set_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"reason"	TEXT
);
DROP TABLE IF EXISTS "callnumber_sections";
CREATE TABLE IF NOT EXISTS "callnumber_sections" (
	"cn_section"	VARCHAR(3),
	"collection_count"	INTEGER,
	"gg_recommended"	INTEGER,
	"reviewed_count"	INTEGER,
	"librarian_id"	INTEGER,
	PRIMARY KEY("cn_section"),
	FOREIGN KEY("librarian_id") REFERENCES "librarians"("librarian_id")
);
COMMIT;
