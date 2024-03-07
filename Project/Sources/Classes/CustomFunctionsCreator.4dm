/* **********************************************************************************************************
  percentageDifference
********************************************************************************************************** */
Function percentageDifference()->$customFunction : Object
	// Declaration of MY_PERCENTAGEDIFFERENCE custom function with the VP SET CUSTOM FUNCTIONS command
	var $this : Object
	
	$customFunction:={}
	$this:=This:C1470
	
	// formula that will be called when the custom function is used in the spreadsheet
	$customFunction.formula:=Formula:C1597($this._percentageDifference($1; $2))
	// If a parameter is of collection type, the declaration of the custom function parameters is mandatory
	$customFunction.parameters:=[]
	$customFunction.parameters.push({name: "Original values"; type: Is collection:K8:32})
	$customFunction.parameters.push({name: "New values"; type: Is collection:K8:32})
	// Summary of the custom function using in the autocomplete popup
	$customFunction.summary:="Calculation of the percentage difference between the total of the 2 ranges"
	
Function _percentageDifference($originalvalues : Collection; $newValues : Collection) : Real
	// Difference in percent between sum of all the values of $originalvalues and the sum of all the values of $newValues parameters
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Sum of all the collections values
	var $totalOriginal:=$originalvalues.flat(2).sum()
	var $totalNew:=$newValues.flat(2).sum()
	
	// Returns the calculation result to be displayed in the cell
	return $totalOriginal>0 ? ($totalNew/$totalOriginal)-1 : 0
	
/* **********************************************************************************************************
  Difference (value)
********************************************************************************************************** */
Function difference()->$customFunction : Object
	// Declaration of MY_DIFFERENCE custom function with the VP SET CUSTOM FUNCTIONS command
	var $this : Object
	
	$customFunction:={}
	$this:=This:C1470
	
	// formula that will be called when the custom function is used in the spreadsheet
	$customFunction.formula:=Formula:C1597($this._difference($1; $2))
	// If a parameter is of collection type, the declaration of the custom function parameters is mandatory
	$customFunction.parameters:=[]
	$customFunction.parameters.push({name: "Original values"; type: Is collection:K8:32})
	$customFunction.parameters.push({name: "New values"; type: Is collection:K8:32})
	// Summary of the custom function using in the autocomplete popup
	$customFunction.summary:="Calculation of the difference between the total of the 2 ranges "
	
Function _difference($originalvalues : Collection; $newValues : Collection) : Real
	// Difference between sum of all the values of $originalvalues and the sum of all the values of $newValues parameters
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Sum of all the collections values
	var $totalOriginal:=$originalvalues.flat(2).sum()
	var $totalNew:=$newValues.flat(2).sum()
	
	// Returns the calculation result to be displayed in the cell
	return $totalNew-$totalOriginal
	
/* **********************************************************************************************************
  average Values of value different of 0 or Null
********************************************************************************************************** */
Function averageNonZeroValues()->$customFunction : Object
	// Declaration of MY_AVERAGENONZEROVALUES custom function options that will be used by the VP SET CUSTOM FUNCTIONS command
	var $this : Object
	
	$customFunction:={}
	$this:=This:C1470
	
	// formula that will be called when the custom function is used in the spreadsheet
	$customFunction.formula:=Formula:C1597($this._averageNonZeroValues($1))
	// If a parameter is of collection type, the declaration of the custom function parameters is mandatory
	$customFunction.parameters:=[{name: "Values"; type: Is collection:K8:32}]
	// Summary of the custom function using in the autocomplete popup 
	$customFunction.summary:="Returns the average of non zero values"
	// Expected number of parameters
	$customFunction.minParams:=1
	$customFunction.maxParams:=1
	
Function _averageNonZeroValues($values : Collection) : Real
	// Average of the non zero and non null values in the range
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Sum of all the collection values
	var $total:=$values.flat(2).sum()
	// Calculates the number of cells containing a value other than 0 or NUll
	var $NonZeroValueNumber : Integer:=$values.flat(2).count()-$values.flat(2).countValues(0)
	
	// Returns the calculation result to be displayed in the cell
	return $NonZeroValueNumber>0 ? $total/$NonZeroValueNumber : 0
	
	
/* **********************************************************************************************************
  Detect modifications done by the user on the current people object
********************************************************************************************************** */
Function modified()->$customFunction : Object
	// Declaration of MY_MODIFICATIONS custom function options that will be used by the VP SET CUSTOM FUNCTIONS command
	var $this : Object
	
	$customFunction:={}
	$this:=This:C1470
	
	// formula that will be called when the custom function is used in the spreadsheet
	$customFunction.formula:=Formula:C1597($this._modified($1))
	// Parameter declaration
	$customFunction.parameters:=[{name: "Values"; type: Is object:K8:27}]
	// Summary of the custom function using in the autocomplete popup 
	$customFunction.summary:="Displays the state 'Data modified' if the user has modified the information"
	// Expected number of parameters
	$customFunction.minParams:=1
	$customFunction.maxParams:=1
	
Function _modified($object : Object) : Text
	// Comparison between the data in the people table and the data in the spreadsheet
	var $isModified:=False:C215
	var $property : Text
	
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	var $myObject : Object:=$object.value
	var $alert:="Changes were made:"
	
	// Search the object attributes modified between the people data and the data in the spreadsheet
	For each ($property; $myObject)
		// comparison between the object returned by the spreasheet and the Form.people object
		If ($myObject[$property]#Form:C1466.people[$property])
			$alert+="\n - The "+$property+" has been modified from '"+String:C10(Form:C1466.people[$property])+"' to '"+String:C10($myObject[$property])+"'."
			$isModified:=True:C214
		End if 
		
	End for each 
	
	If ($isModified)
		ALERT:C41($alert)
		// Message displayed in the cell if data is modified
		return "Data modified"
	Else 
		return ""
	End if 
	
	