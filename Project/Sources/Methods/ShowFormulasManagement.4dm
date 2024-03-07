//%attributes = {}
// Shows the formula in place of the value and vice versa
Form:C1466.showFormulas:=Not:C34(Form:C1466.showFormulas)

var $res:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; "Utils.spread.getActiveSheet().options.showFormulas = "+(Form:C1466.showFormulas ? "true" : "false")+";")

EnableButtons()