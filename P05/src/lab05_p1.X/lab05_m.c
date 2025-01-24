/* 
 * File:   lab05_m.c
 * Created on October 4, 2022, 8:28 AM
 */

 #include "ece212.h"

int main() {
    
    ece212_setup();
    while(1){
       Hypnotizer();        
    }    
    return (EXIT_SUCCESS);
}

int Hypnotizer(){
     if (BTN11){
         writeLEDs(0x1);
         delayms(1000);
         writeLEDs(0x2);
         delayms(1000);
         writeLEDs(0x4);
         delayms(1000);
         writeLEDs(0x8);
         delayms(1000);
 
 } else {
         writeLEDs(0x8);
         delayms(1000);
         writeLEDs(0x4);
         delayms(1000);
         writeLEDs(0x2);
         delayms(1000);
         writeLEDs(0x1);
         delayms(1000);
         
 }
    
    
    
    
    
    
}



