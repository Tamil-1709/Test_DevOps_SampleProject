begin
  DECLARE my_cursor CURSOR FOR
  select*from heliostzqa.dbo.AcsysX_Accounts where UserID=10
end 
end
