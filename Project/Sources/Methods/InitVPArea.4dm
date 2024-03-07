//%attributes = {}
If (Form:C1466.VP.ViewPro.inited=True:C214)
	// Example file import
	If (FORM Get current page:C276=2)
		VP IMPORT DOCUMENT("ViewProArea"; Folder:C1567(fk resources folder:K87:11).file("Budget.sjs").platformPath)
	End if 
	If (FORM Get current page:C276=3)
		VP IMPORT DOCUMENT("ViewProArea"; Folder:C1567(fk resources folder:K87:11).file("Object.sjs").platformPath; {formula: Formula:C1597(VP SET DATA CONTEXT("ViewProArea"; {People: Form:C1466.people.first()}))})
	End if 
	Form:C1466.showFormulas:=False:C215
	// Buttons displaying
	EnableButtons()
	
End if 
