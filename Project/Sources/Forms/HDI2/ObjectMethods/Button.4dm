If (Form:C1466.trace)
	TRACE:C157
End if 

// load the next record
Form:C1466.people:=Try(Form:C1466.people.next()) || Form:C1466.people.first()
// Overwrites the data context with the next people record
VP SET DATA CONTEXT("ViewProArea"; {People: Form:C1466.people})
// Forces recalculation of formulas
VP RECOMPUTE FORMULAS("ViewProArea")
