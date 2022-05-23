program Payroll;
var HourlyRate, Wage, Tax : real;
    NoOfHours : integer;

procedure GetData( var NoOfHours : integer;
                   var HourlyRate : real );
{ Get and return the number of hours worked,
  NoOfHours and the hourly rate, HourlyRate }
begin
  write( 'Enter Number of Hours worked: ' );
  readln( NoOfHours );
  write( 'Enter Hourly Rate: ' );
  readln( HourlyRate )
end;

procedure CalculateWage( NoOfHours : integer;
                         HourlyRate : real;
                         var Total : real );
{ Input   : NoOfHours, HourlyRate
  Process : Base on NoOfHours, calculate the allowance
  Output  : Total }
var Allowance, RegularWage : real;
    Overtime : integer;
begin
  RegularWage := HourlyRate * NoOfHours;
  Overtime := NoOfHours - 7;
  if Overtime > 0
    then Allowance := HourlyRate * 0.40 * Overtime
    else Allowance := 0;
  Total := RegularWage + Allowance;
end;

procedure OutputWage( Total : real );
{ Input   : Total wage
  Process : Display wage }
begin
  writeln( 'The wage is $', Total:1:2 )
end;

procedure CalculateTax( Totalincome : real; var PaidTax : real);
begin
     if Totalincome>3000 then
     begin
          PaidTax:=PaidTax+(ToTalincome-3000)*0.12;
          Totalincome:=3000;
     end;
     if Totalincome>2000 then
     begin
          PaidTax:=PaidTax+(ToTalincome-2000)*0.09;
          Totalincome:=2000;
     end;
     if Totalincome>1000 then
     begin
          PaidTax:=PaidTax+(ToTalincome-1000)*0.07;
          Totalincome:=1000;
     end;
     PaidTax:=PaidTax+Totalincome*0.05;
end;

procedure Outputtax(PaidTax:real;Wage:real);
begin
     writeln('The tax is $',PaidTax:1:2);
     writeln('The net wage is $', Wage-PaidTax:1:2);
end;

begin
  GetData( NoOfHours, HourlyRate );
  CalculateWage(NoOfHours,HourlyRate,Wage);
  OutputWage(Wage);
  CalculateTax(Wage,Tax);
  Outputtax(Tax,Wage);
end.
