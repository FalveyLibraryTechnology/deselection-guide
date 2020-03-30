# SQL examples

## `annual_report_1.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label           | # of Items in Subject Area | # of Items in Subject Area Identified for Review by Greenglass | # of Items Reviewed in Subject Area |
| --------------- | -------------------------- | -------------------------------------------------------------- | ----------------------------------- |
| STEM            | 96782                      | 33433                                                          | 32901                               |
| Humanities      | 251083                     | 109711                                                         | 83958                               |
| Social Sciences | 197526                     | 100398                                                         | 110413                              |
| Business        | 91368                      | 32915                                                          | 31946                               |

## `annual_report_faculty_retained.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label           | # of Items Retained By Faculty |
| --------------- | ------------------------------ |
| STEM            | 81                             |
| Humanities      | 8559                           |
| Social Sciences | 2578                           |
| Business        | 33                             |

## `annual_report_personal.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label           | # of Items Sent By Faculty |
| --------------- | -------------------------- |
| STEM            | 298                        |
| Humanities      | 452                        |
| Social Sciences | 577                        |
| Business        | 156                        |

## `annual_report_posted.sql`

Together with the other `annual_report` scripts provided numbers that fleshed out our annual report.

| label           | # of Items in Subject Area Posted |
| --------------- | --------------------------------- |
| STEM            | 19614                             |
| Humanities      | 45301                             |
| Social Sciences | 59703                             |
| Business        | 19981                             |

## `autocomplete_month.sql`

Exports the data used in the barcode autocomplete demo. Editting the dates in the SQL is essential to getting the correct month(s) of posts. ie. February lists posted on Feb 1, 2020 and thus match `'2020-01-15' < posted_files.month < '2020-02-15'`.

| barcode        | title                                                                     | pub_year |
| -------------- | ------------------------------------------------------------------------- | -------- |
| 39346000033847 | Cyrus Hall McCormick : Harvest, 1856-1884 ; \[by\] William T. Hutchinson. | 1930     |
| 39346000041477 | The Schuman plan : a study in economic cooperation, 1950-1959.            | 1959     |
| 39346000041980 | The Evening post;                                                         | 1922     |

## `extension_requests.sql`

Itemizes books that were retained in the library during an extension. Essentially, the cost of the extension.

| name         | department | extended |
| ------------ | ---------- | -------- |
| John Keating | English    | 21       |
| Sean Maguire | Philosophy | 13       |
| Dewey Finn   | Music      | 1        |

## `individual_progress.sql`

Estimates the progress of each of the subject librarians.

| NAME           | NUMBER OF BOOKS POSTED | EST. REVIEWED | GG RECOMMENDED | TOTAL COLLECTION COUNT | # OF SECTIONS ASSIGNED | ASSIGNED SECTIONS |
| -------------- | ---------------------- | ------------- | -------------- | ---------------------- | ---------------------- | ----------------- |
| Rupert Giles   | 27.4305348072901       | 5367          | 19566          | 20082                  | 66298                  | 29                | A, Q, QA, QB, QC, QD, QE, S, SB, SD, SF, SH, SK, T, TA, TC, TD, TE, TF, TG, TH, TJ, TK, TL, TN, TP, TS, TT, TX |
| Mark Thackeray | 99.8375084631009       | 5851          | 7373           | 7385                   | 15090                  | 11                | L, LA, LB, LC, LD, LE, LF, LG, LH, LJ, LT |
| Edna Krabappel | 85.452565870654        | 22475         | 26301          | 27554                  | 95826                  | 11                | BL, BM, BP, BQ, BR, BS, BT, BV, BX, PA, ZA |

## `retention_by_callnumber.sql`

Details a specific callnumber (edit in SQL) to list all removal candidates with the faculty requests for all of them.

| callnumber      | uses_item | last_charge_item | title                                                                                                                                               | pub_year | author               | publisher                                                                                                                       | barcode        | Faculty Request | callnumber_sort              |
| --------------- | --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------- | --------------- | ---------------------------- |
| QA1 .R33 no. 90 | 0         |                  | Index theory, coarse geometry, and topology of manifolds / John Roe [editor].                                                                       | 1996     |                      | Providence, RI : American Mathematical Society, 1996.                                                                           | 39346006991675 |                 | QA 00010000R330 000 000 NO90 |
| QA1 .R33 no. 91 | 0         |                  | Equivariant homotopy and cohomology theory : dedicated to the memory of Robert J. Piacenza / J.P. May ; with contributions by M. Cole ... [et al.]. | 1996     | May, J. Peter.       | Providence, R.I. : Published for the Conference Board of the Mathematical Sciences by the American Mathematical Society, c1996. | 39346007290317 | 0 (retain)      | QA 00010000R330 000 000 NO91 |
| QA1 .R33 no. 93 | 0         |                  | Euler products and Eisenstein series / Goro Shimura.                                                                                                | 1997     | Shimura, Gorō, 1930- | Providence, R.I. : Published for the Conference Board of the Mathematical Sciences by the American Mathematical Society, c1997. | 39346007156187 | 1 (personal)    | QA 00010000R330 000 000 NO93 |

## `retention_totals_by_role.sql`

Returns counts of the books excluded from deselection by who requested it stay in the library (subject librarians/staff or faculty).

| gg_total | staff_retained | faculty_retained |
| -------- | -------------- | ---------------- |
| 276286   | 132695         | 13742            |
