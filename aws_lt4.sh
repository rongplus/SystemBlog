#!/bin/bash
goku="pinterest-fresno/goku_data3/"
#22312/3/4784
verify()
{
	shard=$1
	tier=$2
	bucket=$3
	echo "$shard-$tier-$bucket"
	verify2 $((shard + 2 + 3))    $((tier + 2 + 3))   $((bucket + 2 + 3))   

}

check_needed()
{
	shard=$1
	tier=$2
	nb=$3   #needed bucket
	count=$4
	arr=$5
	checklt=()

	#echo "check_needed\n $goku$shard/$tier/$nb/$count" 

	for (( c=0; c<$4; c++ ))
	do  	   
	   new_nd=$((nb+c))	   
	   checklt+=("$new_nd")
	done

	#echo "check---------"
	#echo ${checklt[@]}	
    #echo "end check---------"


	#echo "check $goku$shard/$tier/$nb/"
	
	dirs=$(aws s3 ls "$goku$shard/$tier/")   #"$gokua$line"
    ret=()
    for d in $dirs
    do
      #echo "$d"   
      for str in "${checklt[@]}"; do      
        
        if (grep -q "$str" <<< $d) #for tier3 = 19136 tier 1 =76544
        then
            ret+=("$str")
        fi
      done
    done

    #echo "check---ret------"
	#echo ${ret[@]}	
    #echo "end check---------"

    for str in "${ret[@]}"; do      
      #echo $str
      checklt=("${checklt[@]/$str}")
    done

    #echo "check---final------"
	echo "bucket is missed "$goku$shard/$tier/${checklt[@]}	
	for str in "${checklt[@]}"; do
		if [ "$str" != "" ];then
	       #echo $str
	       #missed , check_needed again
	       if [ $tier -ne 0 ]
	       then
	       	check_missed $shard $tier $str
	   	   fi

	    fi
	done
    #echo "end check---------"


}


check_needed2()
{
	shard=$1
	tier=$2
	checklt=$3   #needed buckets
		
	echo "check_needed\n $goku$shard/$tier/" 
	echo ${checklt[@]}	

	
	#echo "check---------"
	#echo ${checklt[@]}	
    #echo "end check---------"


	#echo "check $goku$shard/$tier/$nb/"
	
	dirs=$(aws s3 ls "$goku$shard/$tier/")   #"$gokua$line"
    ret=()
    for d in $dirs
    do
      #echo "$d"   
      for str in "${checklt[@]}"; do      
        
        if (grep -q "$str" <<< $d) #for tier3 = 19136 tier 1 =76544
        then
            ret+=("$str")
        fi
      done
    done

    #echo "check---ret------"
	#echo ${ret[@]}	
    #echo "end check---------"

    for str in "${ret[@]}"; do      
      #echo $str
      checklt=("${checklt[@]/$str}")
    done

    #echo "check---final------"
	echo "bucket is missed "$goku$shard/$tier/${checklt[@]}	
	for str in "${checklt[@]}"; do
		if [ "$str" != "" ];then
	       #echo $str
	       #missed , check_needed again
	       if [ $tier -ne 0 ]
	       then
	       	check_missed $shard $tier ${checklt[@]}
	   	   fi

	    fi
	done
    #echo "end check---------"


}


check_missed()
{
	shard=$1
	tier=$2	
	arr=$3
	#echo ${arr[@]}	 
	#echo "missed $shard-$tier-$mb"

	if [ $tier -eq 1 ]
	then
		#echo "check tier 0"		
		for str in "${arr[@]}"; do      
	      echo $str	      
	    done

		#check_needed $shard 0 $nb 3		
	else
		#echo "not 0"
		ret=()	
		for str in "${arr[@]}"; do      
	      for (( c=0; c<4; c++ ))
			do  	   
			   new_nd=$((str*4+c))	   
			   ret+=("$new_nd")
			done      
	    done

	    #echo ${ret[@]}	  
		check_needed2 $shard $((tier -1)) ${ret[@]}
	fi
	

}
arr=(4784)  #"${array[@]}"

check_missed 10641 3 ${arr[@]}

#!/bin/bash


#aws s3 ls pinterest-fresno/goku_data3/22312/2/

checkT4784()
{
  echo "dd"


  
  while IFS= read -r line
  
  do
    ret=()

    #t="one,two,three"
	a=($(echo $line | tr '/' "\n"))

    echo ${a[@]}

    break
  done < "$input"
 
}
input="m4784check.log"
checkT4784 