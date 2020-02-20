# SQL examples

## `annual_report_1.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label | # of Items in Subject Area | # of Items in Subject Area Identified for Review by Greenglass | # of Items Reviewed in Subject Area |
| ----- | -------------------------- | -------------------------------------------------------------- | ----------------------------------- |


## `annual_report_faculty_retained.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label | # of Items Retained By Faculty |
| ----- | ------------------------------ |


## `annual_report_personal.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label | # of Items Sent By Faculty |
| ----- | -------------------------- |


## `annual_report_posted.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label | # of Items in Subject Area Posted |
| ----- | --------------------------------- |


## `autocomplete_month.sql`

Exports the data used in the barcode autocomplete demo. Editting the dates in the SQL is essential to getting the correct month(s) of posts. ie. February lists posted on Feb 1, 2020 and thus match `'2020-01-15' < posted_files.month < '2020-02-15'`.

| barcode | title | pub_year |
| ------- | ----- | -------- |


## `extension_requests.sql`

Itemizes books that were retained in the library during an extension. Essentially, the cost of the extension.

| name | department | extended |
| ---- | ---------- | -------- |


## `individual_progress.sql`

Estimates the progress of each of the subject librarians.

| NAME | NUMBER OF BOOKS POSTED | EST. REVIEWED | GG RECOMMENDED | TOTAL COLLECTION COUNT | # OF SECTIONS ASSIGNED | ASSIGNED SECTIONS |
| ---- | ---------------------- | ------------- | -------------- | ---------------------- | ---------------------- | ----------------- |


## `retention_by_callnumber.sql`

Details a specific callnumber (edit in SQL) to list all removal candidates with the faculty requests for all of them.

| callnumber | uses_item | last_charge_item | title | pub_year | author | publisher | barcode | Faculty Request | callnumber_sort |
| ---------- | --------- | ---------------- | ----- | -------- | ------ | --------- | ------- | --------------- | --------------- |


## `retention_totals_by_role.sql`

Returns counts of the books excluded from deselection by who requested it stay in the library (subject librarians/staff or faculty).

| gg_total | staff_retained | faculty_retained |
| -------- | -------------- | ---------------- |
