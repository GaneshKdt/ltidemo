package com.nmims.helpers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.time.YearMonth;
import java.util.Arrays;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class RegistrationHelper 
{
	
	private static final String[] PDDM_MASTERKEY_LIST = {"142","143","144","145","146","147","148","149"};
	
	public static final String FORMAT_ddMMMyyyy = "dd/MMM/yyyy";


	public static int checkCurrentCycleReg(String reg_date,String currentDate,String masterKey) {
		
		if(Arrays.asList(PDDM_MASTERKEY_LIST).contains(masterKey)) {
			
			SimpleDateFormat sdf1 = null;
			SimpleDateFormat sdf2 = null;
			Date d1 = null;
			Date d2 = null;
		
			sdf1 = new SimpleDateFormat(FORMAT_ddMMMyyyy);
			sdf2 = new SimpleDateFormat(FORMAT_ddMMMyyyy);
			
			try {
				d1 = sdf1.parse(reg_date);
				d2 = sdf2.parse(currentDate);
				if(d1.getTime() > d2.getTime()) 
					return 1;
			} catch (ParseException e) {
			// TODO Auto-generated catch block
			
			}

		}

		return 0;

	}
	
}
