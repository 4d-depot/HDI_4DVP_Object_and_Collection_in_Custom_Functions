If (Form:C1466.trace)
	TRACE:C157
End if 

// loads the previous record
Form:C1466.people:=Try(Form:C1466.people.previous()) || Form:C1466.people.last()
// Overwrites the data context with the previous people record
VP SET DATA CONTEXT("ViewProArea"; {People: Form:C1466.people})
// Forces recalculation of formulas
VP RECOMPUTE FORMULAS("ViewProArea")
