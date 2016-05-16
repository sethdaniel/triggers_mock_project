trigger Opportunity_Trigger on Opportunity (after insert, after update) {
    
    //INITIALIZE VARS
    List<Payment> paymentSchedules = new List<Payment>();
    Date todayDate = date.today();
    Integer todayMonthInt = todayDate.month();//attempting to combine this with the above always gave an error despite being an example in the docs
    
    //INSERT
    if(Trigger.isInsert){
    	
    	//this is me thinking that I'm bulkifying 
    	for(Opportunity o: Trigger.new){
    		
    		//get some vars separately so I can actually read them
    		String todayMonthName = Payment.reverseMonthsMap.get(todayDate.month());
    		Integer numOfPayments = todayDate.monthsBetween(o.closedate);//number of payments
    		Decimal monthlyPaymentAmount = o.amount/numOfPayments;
    		
    		
    		//I tried doing the following elegantly all in one shot and ended up wanting to hang myself
    		Payment currentPayment = new Payment();
    		currentPayment.payment_date = todayDate;
    		currentPayment.setAmount(monthlyPaymentAmount);
    		currentPayment.opportunity = o;
    		currentPayment.dueMonth = currentPayment.month(todayMonthName);
    		
    		
    		
    	}
    	
    	
    }
    
    //UPDATE
    if(Trigger.isUpdate){
    	
    }
    
    
}