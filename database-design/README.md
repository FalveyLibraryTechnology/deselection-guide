# Database Schema

We've included two SQL files to initialize your database to the same structure as ours, which will allow you to easily use the [report SQLs](../report-sql) included in this database.

- [CREATE TABLE IF NOT EXISTS](./init-create-if-not.sql)
- [DROP TABLE IF EXISTS](./init-drop-create.sql)

## Table Structure

### faculty_books

| column     | type    | key/references      |
| ---------- | ------- | ------------------- |
| barcode    | INTEGER | KEY                 |
| request_id | INTEGER | KEY                 |
| personal   | BOOLEAN |                     |
| comment    | VARCHAR | requests.request_id |

### faculty_requests

| column     | type     | key/references      |
| ---------- | -------- | ------------------- |
| request_id | INTEGER  | KEY (autoincrement) |
| date       | DATETIME |                     |
| faculty_id | INTEGER  | faculty.faculty_id  |

### faculty

| column     | type    | key/references      |
| ---------- | ------- | ------------------- |
| faculty_id | INTEGER | KEY (autoincrement) |
| name       | VARCHAR |                     |
| address    | VARCHAR |                     |
| department | VARCHAR |                     |
| email      | VARCHAR |                     |

### subjects

| column     | type    | key/references      |
| ---------- | ------- | ------------------- |
| subject_id | INTEGER | KEY (autoincrement) |
| label      | VARCHAR |                     |

### sections_subjects

| column     | type       | key/references                      |
| ---------- | ---------- | ----------------------------------- |
| subject_id | INTEGER    | KEY, subjects.subject_id            |
| cn_section | VARCHAR(3) | KEY, callnumber_sections.cn_section |

### posted_files

| column       | type    | key/references          |
| ------------ | ------- | ----------------------- |
| file_id      | INTEGER | KEY (autoincrement)     |
| name         | VARCHAR |                         |
| month        | DATE    |                         |
| librarian_id | INTEGER | librarians.librarian_id |

### posted_books

| column          | type       | key/references                 |
| --------------- | ---------- | ------------------------------ |
| barcode         | INTEGER    | KEY                            |
| callnumber      | VARCHAR    |                                |
| callnumber_sort | VARCHAR    |                                |
| cn_section      | VARCHAR(3) | callnumber_sections.cn_section |
| title           | VARCHAR    |                                |
| author          | VARCHAR    |                                |
| pub_year        | TINYINT    |                                |
| file_id         | INTEGER    | posted_files.file_id           |

### librarian_assignments

| column       | type    | key/references                      |
| ------------ | ------- | ----------------------------------- |
| cn_section   | VARCHAR | KEY, callnumber_sections.cn_section |
| librarian_id | INTEGER | librarians.librarian_id             |

### librarians

| column       | type       | key/references      |
| ------------ | ---------- | ------------------- |
| librarian_id | INTEGER    | KEY (autoincrement) |
| name         | VARCHAR    |                     |
| initials     | VARCHAR(3) |                     |

### excluded_barcodes

| column  | type    | key/references            |
| ------- | ------- | ------------------------- |
| barcode | INTEGER | KEY                       |
| set_id  | INTEGER | KEY, excluded_sets.set_id |

### excluded_sets

| column | type    | key/references      |
| ------ | ------- | ------------------- |
| set_id | INTEGER | KEY (autoincrement) |
| reason | TEXT    |                     |

### callnumber_sections

| column           | type       | key/references          |
| ---------------- | ---------- | ----------------------- |
| cn_section       | VARCHAR(3) | KEY                     |
| collection_count | INTEGER    |                         |
| gg_recommended   | INTEGER    |                         |
| reviewed_count   | INTEGER    |                         |
| librarian_id     | INTEGER    | librarians.librarian_id |
