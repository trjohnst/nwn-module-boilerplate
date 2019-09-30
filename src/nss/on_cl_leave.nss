#include "discord_status"

void main()
{
    object oPC = GetEnteringObject();
    
    QueueLeaveNotification(oPC);
}