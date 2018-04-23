package com.demo.validator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PrevNextCalc {
	
	public static void main(String a[]){
		
		List<Integer>idSet=new ArrayList<Integer>();
		for(int i=0;i<10;i++)
		idSet.add(i);
		
		Collections.sort(idSet);
		
		int currentIndex=7;
		int nextId=0;
		int prevId=0;
		 int temp1=0;
		 int temp2=0;
		for(Integer index:idSet){
		 
		 
		  //Find Larger
		  if(index>currentIndex){
			  temp2=index;
			  break;
		  }else{
			  temp1=index;
		  }
		}
		nextId=temp2;
		System.out.println("NEXT OF "+currentIndex+" is "+nextId);
		temp1 =0;
		temp2=0;
		for(Integer index:idSet){
			
			if(index<currentIndex && index>temp1){
				temp1=index;
			}
		}
		prevId=temp1;
		System.out.println("PREV OF "+currentIndex+" is "+prevId);

	}

}
