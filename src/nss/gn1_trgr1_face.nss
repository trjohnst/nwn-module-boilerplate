void main()
{
   object GN1 = GetEnteringObject();

   if (GetTag(GN1) == "Gangster_No1")
   {
      SetLocalInt(GN1, "InTrigger", 10);
      SetLocalInt(GN1, "IsMoving", 0);
   }
}
