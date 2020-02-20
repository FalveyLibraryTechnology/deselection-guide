SELECT subjects.label, 
		SUM(callnumber_sections.collection_count) AS "# of Items in Subject Area",
		SUM(callnumber_sections.gg_recommended) AS "# of Items in Subject Area Identified for Review by Greenglass",
		SUM(callnumber_sections.reviewed_count) AS "# of Items Reviewed in Subject Area"
	FROM subjects
	LEFT JOIN sections_subjects ON sections_subjects.subject_id = subjects.subject_id
	INNER JOIN callnumber_sections ON callnumber_sections.cn_section = sections_subjects.cn_section
	GROUP BY subjects.subject_id