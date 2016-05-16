public class Payment {
	
	//PROPERTIES
	public Date payment_date;
	private Decimal amount;//currency is not an actual datatype?
	public Opportunity opportunity;
	public String dueMonth;
    public static Map<String, Integer> monthsMap = new Map<String, Integer>{
		'January' => 1,
    	'February' => 2,
    	'March' => 3,
    	'April' => 4,
    	'May' => 5,
    	'June' => 6,
    	'July' => 7,
    	'August' => 8,
    	'September' => 9,
    	'October' => 10,
    	'November' => 11,
    	'December' => 12
	};	
		
	//I wrote this reverse map because I was up against the clock and couldn't immediately
	//find an appropriate data type for bi-directional key/value lookups.  There is likely
	//a much better way to have written these two maps as a single variable in some different
	//data structure.
    public static Map<Integer, String> reverseMonthsMap = new Map<Integer, String>{
		1 => 'January',
    	2 => 'February',
    	3 => 'March',
    	4 => 'April',
    	5 => 'May',
    	6 => 'June',
    	7 => 'July',
    	8 => 'August',
    	9 => 'September',
    	10 => 'October',
    	11 => 'November',
    	12 => 'December'
	};	
	
	//SETTERS & GETTERS
	//amount
	public void setAmount(Decimal amountToSet){
		amount = amountToSet;
	}
	public Decimal getAmount(){
		return amount.setScale(2);
	}
	
	//METHODS
	
	//I initially thought that the requirement here was to accept a full month name and 
	//return the next full month name. I wrote that but then re-read the description in the 
	//project docs and it just says "Text value for the month of the Payment Date field."
	//I don't know what that means so I'm leaving it this like this.
	public String month(String newMonth){
		
		//I tried both Date.parse('March') and Date.valueOf('March') from the Apex 
		//docs and found that month name as the string argument doesn't work.  Took the 
		//following approach from stackoverflow
				
		//get month as int
		Integer incrementedMonthInt = monthsMap.get(newMonth);
		
		//increment month int
		incrementedMonthInt++;
		
		//make sure that Dec plus one becomes Jan
		if(incrementedMonthInt == 13){
			incrementedMonthInt = 1;
		}
		
		//get month name from month int
		String incrementedMonth = reverseMonthsMap.get(incrementedMonthInt);
		
		return incrementedMonth;
		
	}
	
	

}