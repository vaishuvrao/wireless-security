BEGIN {

    seqno = -1;    
    count = 0;

}

{

    if($4 == "AGT" && $1 == "s" && seqno < $6) {

          seqno = $6;

    } 

    #end-to-end delay

    if($4 == "AGT" && $1 == "s") {

          start_time[$6] = $2;

    } else if(($7 == "cbr") && ($1 == "r")) {

        end_time[$6] = $2;

    } else if($1 == "D" && $7 == "cbr") {

          end_time[$6] = -1;

    } 

}

 
END {        
  
    for(i=0; i<=seqno; i++) {

          if(end_time[i] > 0) {

              delay[i] = end_time[i] - start_time[i];

        }

            else

            {

                  delay[i] = -1;

            }

    }

    for(i=0; i<=seqno; i++) {

	time = int(start_time[i]);
	end_to_delay = 0;
	for(j=i;j<=seqno;j++) {
		
		if ( int(start_time[j]) > time)
			break
		else {	  	
        	
			if(delay[j] > 0) {
				
				end_to_delay+=delay[j];
        	      		#print start_time[j],delay[j]
		
        		}     
		}    
	}
	print time,end_to_delay/(j-i)
	i=j;
    }
} 
