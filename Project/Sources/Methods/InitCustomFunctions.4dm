//%attributes = {}
var $customFunctions:={}


// Declaration of authorized custom functions in the 4D View Pro area
var $creator:=cs:C1710.CustomFunctionsCreator.new()
$customFunctions.MY_DIFFERENCE:=$creator.difference()
$customFunctions.MY_PERCENTAGEDIFFERENCE:=$creator.percentageDifference()
$customFunctions.MY_AVERAGENONZEROVALUES:=$creator.averageNonZeroValues()
$customFunctions.MY_MODIFICATIONS:=$creator.modified()

VP SET CUSTOM FUNCTIONS("ViewProArea"; $customFunctions)
