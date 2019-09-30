#include "nw_i0_generic"
void main()
{
   if (!IsInConversation(OBJECT_SELF))
   {
      if (GetLocalInt(OBJECT_SELF, "InTrigger") == 0 &&
          GetLocalInt(OBJECT_SELF, "IsMoving") == 0)
      {
         ClearAllActions(TRUE);
         ActionMoveToObject(GetWaypointByTag("WP_GN1_Post"), FALSE, 1.0);
         SetLocalInt(OBJECT_SELF, "IsMoving", 10);
      }
   }
}
