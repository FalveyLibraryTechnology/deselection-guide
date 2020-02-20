# Falvey Library Deselection Guide

> This repository is an appendix to our white paper detailing our comprehensive deselection process, currently in review.

    This repository is still being built! There are many things still to be done:

    - Detail database structures.
    X Include SQL files with descriptions.
    - Include form autocomplete example.

## Updated Analytical Method

The outline and figures below consolidate all of the lessons learned and represents the final state of our analytical process after two years of progressive changes.

1.	Decide on criteria
    1.	Identify static and dynamic criteria (updated monthly)
2.	Perform quantitative analysis (GreenGlass)
    1.	Remove exempt formats
    1.	Remove exempt collections
3.	Divide by call numbers for appropriate subject librarians
4.	Qualitative analysis/Staff Review (iteratively over months)
    1.	Subject librarians remove significant works or books that meet a self-determined qualitative standard
    1.	Larger chunks removed with quantitative tools
    1.	Subject librarians submit postable chunks for quantitative analysis (end of the month)
        1.	Apply dynamic quantitative criteria (ie. Remove recently checked out items)
        1.	Remove exempt collections (if updated)
5.	Faculty review
    1.	Post lists to faculty (start of the month)
    1.	Give faculty one month to submit retention and personal collection requests through the online, autocompleting form.
    1.	Generate reports detailing final retention (end of the month)
6.	Physical Removal
    1.	Use reports to pull items for donation and personal collection
        1.	Items for donation are reviewed manually by Special Collection director
    1.	Send out items
        1.	Donated items are boxed for Better World Books
        1.	Personal collection items are sent via campus mail or voluntarily picked up in person.


## Anecdotes and Rationale

### Microfilm and VHS

Early in the process, VHS, microfilm, or government documents were noticed in the posted faculty lists. These items are outside of the scope of this project and should have been deselected previously. While this helped identify VHS cassettes that were previously missed, it placed an extra burden on our subject librarians by increasing the number of items they had to quantitatively review.

The project developer duplicated and filtered the GreenGlass quantitative report to only include books. When subject librarians create their monthly lists for faculty, they now draw from these filtered template lists.

### Changes to Monthly Process

#### Automated emails

One of the members of the project was tasked with emailing faculty to inform them of which books they should expect to receive for their personal collections. It became apparent that gathering the information for these emails and sending them individually was repetitive and tedious.

To address this, we added an additional report to our monthly reports that automatically formulates the email from a template and lists it next to the important information. While this information is still copied and pasted, it is now significantly less burdensome to complete.

#### Recently Checked Out Items

When the project started, there was pushback about methodology from faculty. One particularly memorable moment involved the head of the department questioning our quantitative analysis. They claimed that our system wasn’t matching our own quantitative criteria. They then dramatically placed a book on the university librarian’s desk, saying they found this book in a posted faculty list, even though it had been sitting, recently checked out, on their desk.

This department head was correct: we were posting a few books that had been checked out in the last ten years, against our own criteria. We had not accounted for library circulation for any days since the data was submitted and the quantitative GreenGlass report was received. At the point of this anecdote, the circulation data we were using was six months out of date.

To address this issue, the project developer added a monthly quantitative update. This update was run on all the lists we were about to post to the faculty and allowed for the labeling and exclusion of books by barcode. Books excluded this way were filtered from the posted faculty lists and from future monthly and cumulative reports. Each month, a list of every barcode that had been checked out since the GreenGlass report was created and included in the monthly exclusion process. This monthly exclusion process became crucial for solving many future incidents, from saving small collections for an exhibit to pausing entire call number sections for periods of time.

#### Collections We Cannot Remove

We discovered during the physical removal process that some books had paper stamps on the inside covers highlighting which person, organization, or institution donated that book. This caused us to realize that we had not factored in donation agreements that contractually obligated the library to retain materials for longer periods of time regardless of use.

Once these collections were identified and their books itemized, they were added to the monthly quantitative updates. Our special collections director also offered to take the extra step to look over the deselected books. This extra step saved a few rare books right before they were removed from the system.

### Many ad-hoc progress requests

One of the issues with the original way that the analysis was done was with the rigid nature of how the data was stored – in plain text files and Excel spreadsheets. This made the addressing of ad-hoc information requests difficult as a new Python script had to be constructed for most. Some examples include “how many books have this person submitted so far?”, “what criteria led to this book being marked for donation?”, “can we exempt all books from this publisher?”

To make these requests easier to handle, the project developer was refactored with the aid of a graduate assistant to store the books and requests in a relational database. Now, most requests and reports can be generated with SQL queries and exported to Excel spreadsheets.

For this project, we did not take the step of hosting the database on a staff-accessible server. We learned from another project that making the relational database accessible to the staff resulted in more parallel work. Many of our project staff are familiar with relational databases and being able to generate their own ad-hoc reports and update the data on their own was very beneficial to that project.

### Faults with the GreenGlass reports

Near the end of the process, the staff of the physical removal process discovered a few books that were purchased after 2006, breaking one of our quantitative criteria. The project developer tracked down the problem to a few master lists incorrectly derived from the GreenGlass report. In the end, 2,250 books were affected (<1%) and only 276 of those had already been sent off to faculty or our partner charity.

The conversion of the data structure from text files to a database made these reports and corrections easy and the issue was resolved within a day. It turns out that the list had been generated intentionally using different criteria. Only a few hundred books had to be re-reviewed (as a precaution) by the appropriate subject librarian. In the future, intentional diversions from the established criteria will be better documented.

### Missing Data for Progress Reports

One point of data in the monthly progress reports was the number of books reviewed thus far. This important piece of information had to be estimated. Definitive numbers were available for how many books were recommended to the librarians, how many books the librarians sent for posting, and how many were removed during the month exclusion process. The number of items the librarians started with for each posted list or removed from each posted list was not available. The number of removed items was estimated by comparing the items in the posted file to a sorted list of all GreenGlass recommended items and counting the omissions across the range of the posted file. This method could not account for items removed from the start or the end of a posted file. In the end, this method had a margin of error of ~3%. In future deselections, a method for capturing the items initially in or removed from a posted list will be designed to help improve this metric.

## Faculty Burden

### Faculty Deadline Extensions

It was our discovery that giving faculty deadline extensions for posted lists was an effective way to improve relations with faculty without dramatically increasing the number of retained books. Only 18% of the books faculty retained were requested during an extension, accounting for ~1.4% of all qualitatively retained items. On the other hand, faculty reacted very positively to receiving extensions. Once the numbers came in, the project staff became generous with extensions. All project staff remained firm that all requests must be given through the web form, regardless of the deadline. Extensions are also effective because physical processing takes longer than analysis and faculty input. Physically processing books at least two months after they are posted allows for flexible extensions and larger corrections.

### Faculty Request Entry

One aspect that we struggled with was designing the way faculty make their requests. The process was designed to honor all faculty requests, but we wanted to avoid the 98% retention CSUF experienced with their user-friendly, checkbox interface. However, the individual entry form that we landed on was perhaps overly burdensome. Faculty often hired student workers to enter the data in the required form. The fields we required were the minimum necessary to prevent errors but an autocomplete system built around the book barcodes would reduce errors and balance the burdens places on the faculty and their student workers. The project developer intends to add an autocomplete system that presents the matching title of the book once a barcode has been pasted in. This feedback will prevent mismatch and duplication errors and prevent incorrect data like call numbers from being submitted.
