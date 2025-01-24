/* 
 * File:   Lab05_p2m.c
 * Created on October 4, 2022, 9:00 AM
 */

#include <xc.h>
#include "ece212.h"

int main() {
    
    ece212_lafbot_setup();
    while(1){
        move();      
    }
    return (EXIT_SUCCESS);
}

int move(){
RBACK = 0;
LBACK = 0;
RFORWARD = 0x7FFF;
LFORWARD = 0x7FFF;
delayms(500);
RBACK = 0;
LBACK = 0;
RFORWARD = 0;
LFORWARD = 0;
delayms(1000);
RBACK = 0x7FFF;
LBACK = 0x7FFF;
RFORWARD = 0;
LFORWARD = 0;
delayms(500);
RBACK = 0;
LBACK = 0;
RFORWARD = 0;
LFORWARD = 0;
delayms(1000);

    
}

    
    
    
    

