--library IEEE; --use     IEEE.STD_LOGIC_1164.ALL; 

package Lib is

  type Float is range-99999999999999999.99999999999999999 to 99999999999999999.99999999999999999; 
  --type  ptr_string is access string;
  --subtype mystring is string(1 to 20);

  function POWER(left:float;right:float)return Float;
  function iTc(num:integer) return character;
  function fact(d:Float)return Float; 
  function realToString(d:Float)return string; 
   
end package; 

package body Lib is

  function POWER(
    left:Float;
    right:Float
  )return Float is
    begin
      if(right = 0.0) then
        return 1.0;
      end if;
      return left * POWER(left,right - 1.0);
    end
  function;

  function iTc(num:integer) return character is
  begin
    case num is
      when 0 => 
        return '0'; 
      
      when 1 => 
        return '1'; 
      
      when 2 => 
        return '2'; 

      when 3 => 
        return '3'; 

      when 4 => 
        return '4'; 

      when 5 => 
        return '5'; 

      when 6 => 
        return '6'; 

      when 7 => 
        return '7'; 

      when 8 => 
        return '8'; 

      when 9 => 
        return '9'; 
      
      when others => return '0'; 

    end case; 
  end function; 

  function fact(d:Float)return Float is
    variable res:Float; 
    begin
      if (d = 0.0 or d = 1.0)then
        res := 1.0; 
      else
        res:= d * fact(d - 1.0); 
      end if; 
      return res; 
  end function; 

  function realToString(d:Float)return string is
    variable intData:integer:= 0; 
    variable floatData:Float:= 0.0; 
    variable OutPut:string(1 to 30) := (others=>' ');
    variable DL :integer :=2;
    begin
      --intData:= integer(d); 
      --floatData:= d - Float(intData); 
      report "d: "&Float'image(d);
      floatData := d;
      report "fD: "&Float'image(floatData);

      while(floatData >= 1.0) loop
        floatData := floatData - 1.0;
        intData := intData + 1;
      end loop;      

      while ( intData > 0 ) loop
        report "start-int--------------";
        report "-in1: " & integer'image(intData);
        report "-in2: " & integer'image(integer(intData rem 10));
        OutPut(1 to DL) := iTc(integer(intData rem 10)) & OutPut(1 to DL-1); 
        report "-in3: " & OutPut(1 to DL);
        intData := (intData/10); 
        report "-in4: " & integer'image(intData);
        DL := DL+1;
        report "end-int--------------";
      end loop;

      OutPut(1 to DL-1) := OutPut(1 to DL-2) & '.';
      --DL := DL+1;

      if(floatData <= 0.0) then
        OutPut(1 to DL) := output(1 to DL-1) & '0';
      end if;

      while(floatData > 0.0) loop
        report "Start-float-----------------------";
        report "-in1: "&Float'image(floatData);
        floatData := floatData * 10.0;
        report "-in2: "&Float'image(floatData);
        report "-in3: "& integer'image(integer((floatData)));
        report "-in4: "& iTc(integer'value(Float'image(floatData)(1 to 1)));
        OutPut(1 to DL) := OutPut(1 to DL-1) & iTc(integer'value(Float'image(floatData)(1 to 1)));
        floatData := floatData - Float(integer'value(Float'image(floatData)(1 to 1)));
        DL := DL+1;
        report "End-float-----------------------";
      end loop;

      return output;

    end
  function; 


end package body; 