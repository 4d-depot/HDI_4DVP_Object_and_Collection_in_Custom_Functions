//%attributes = {}

InitCustomFunctions()

Form:C1466.trace:=False:C215
Form:C1466.people:=ds:C1482.People.all().slice(0; 10).first()

Form:C1466.showFormulas:=False:C215
EnableButtons()

OBJECT SET VISIBLE:C603(*; "ViewProArea"; False:C215)
OBJECT SET VISIBLE:C603(*; "Trace"; False:C215)