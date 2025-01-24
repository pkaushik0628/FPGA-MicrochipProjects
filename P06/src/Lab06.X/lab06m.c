/* 
 * File:   main.c
 * Author: pazerao
 *
 * Created on October 18, 2022, 8:09 AM
 */
#include "ece212.h"


/*
 * 
 */
int main() {
    
ece212_lafbot_setup();
LFORWARD = 0XFFFF;
LBACK = 0;
RFORWARD = 0XFFFF;
RBACK = 0;
int sense1, sense2;

 while(1){

     sense1 = (analogRead(LEFT_SENSOR) > 320);
     sense2 = (analogRead(RIGHT_SENSOR) > 320);
     writeLEDs(sense1 << 3 | sense2);

      
      
     if((sense1==0) && (sense2==0)){
       
         LFORWARD = 0XFFFF;
         RFORWARD = 0XFFFF;
     }
     if((sense1==1) && (sense2==1)){
       
         LFORWARD = 0X4FFF;
         RFORWARD = 0X4FFF;
     }
     
      
        if ((sense2==1)&&(sense1==0)){
            LFORWARD = 0XFFFF;
            RFORWARD = 0X000F; 
            
         }
       
         if ((sense1==1)&&(sense2==0)){
            RFORWARD = 0XFFFF;
            LFORWARD = 0X000F;
             
         }
      
      
      
     delayms(10);
 }
 return (EXIT_SUCCESS);
}

