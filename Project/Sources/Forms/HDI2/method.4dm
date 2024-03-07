Case of 
		
	: (FORM Event:C1606.code=On Load:K2:1)
		
		InitInfo
		
		Init
		
	: (FORM Event:C1606.code=On Page Change:K2:54)
		InitVPArea()
		
		var $isVisible:=(FORM Get current page:C276=2) || (FORM Get current page:C276=3)
		
		OBJECT SET VISIBLE:C603(*; "ViewProArea"; $isVisible)
		OBJECT SET VISIBLE:C603(*; "Trace"; $isVisible)
		OBJECT SET VISIBLE:C603(*; "ShowValues"; $isVisible)
		OBJECT SET VISIBLE:C603(*; "ShowFormulas"; $isVisible)
		
End case 