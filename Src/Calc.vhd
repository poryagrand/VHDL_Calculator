Library Calc; 
Library ieee; 

use ieee.MATH_REAL.all;
use Calc.Lib.all; 

entity CalCulator is
  port ( 
    input:in Character; 
    isButtonPushed : in bit;
    --output:out real;
    output:out string(1 to 30) := (others=>' ')
  ); 
end entity CalCulator; 

--this is the architecture
architecture CalCulator_Arc of CalCulator is
  procedure calc(
    variable op:character;  
    variable left:Float; 
    variable right:Float; 
    save:out Float
  )is
  begin
    --if (op /= 'N')then
      case op is
        when '+' => 
          save:= left + right; 
        
        when '-' => 
          save:= left - right; 
        
        when '*' => 
          save:= left * right; 
        
        when '/' => 
          save:= left / right; 
        
        when '^' => 
          save:= POWER(left , right); 
        
        --when '~' => 
          --save:= SQRT(left); 

        --when 'L' => 
          --save:= LOG10(left); 
        
        --when 'S' => 
          --save:= SIN(left); 
        
        --when 'C' => 
          --save:= COS(left); 
        
        --when 'T' => 
          --save:= TAN(left); 
        
        when '!' =>
          save := fact(left);
        
        when others => save:= right; 
      end case; 
    --end if; 
  end procedure; 

  procedure toReal(
    num:in character; 
    save:out Float)is
  begin
    case num is
      when '0' => 
        save:= 0.0; 
      
      when '1' => 
        save:= 1.0; 
      
      when '2' => 
        save:= 2.0; 

      when '3' => 
        save:= 3.0; 

      when '4' => 
        save:= 4.0; 

      when '5' => 
        save:= 5.0; 

      when '6' => 
        save:= 6.0; 

      when '7' => 
        save:= 7.0; 

      when '8' => 
        save:= 8.0; 

      when '9' => 
        save:= 9.0; 
      
      when others => save:= -1.0; 

    end case; 
  end procedure; 
  
  begin
    
    
  process(isButtonPushed)
    variable op:Character:= 'N'; 
    
    variable temp:Float:= 0.0; 
    variable tempOut:Float:=0.0;
    variable count:Float:=0.0;
    
    variable isOneSide:boolean := false;
    variable OneSideOP: Character := 'N';

		variable left:Float:= 0.0; 
    variable right:Float:= 0.0; 
    
    variable isFloat:boolean := false;
    variable FloatCount:Float := 1.0;
  begin


      toReal(input,temp);

      if(input = '.') then
        isFloat := true;

      else 
        if( isFloat and (temp >= 0.0 and temp <= 9.0) ) then
          report Float'image(FloatCount);
          report "temp: "&Float'image(temp);
          report Float'image(right);
          right := right + (temp * POWER(0.1, FloatCount) );
          FloatCount:=FloatCount + 1.0;
          report "right-float-out: "&Float'image(right);

        else 
          if(temp >= 0.0 and temp <= 9.0) then 
          report "int-temp: "&Float'image(temp);
          report "int-right: "&Float'image(right);
            right := temp + (right * (10.0));
            report "right-int-out: "&Float'image(right);
            --count:=count + 1.0;
          else
            if(input = '=') then
              if(isOneSide)then
                isOneSide := false;
                calc(OneSideOP,right,left,tempOut);
                report "onsideCalc-out: "&Float'image(tempOut);
                right := tempOut;
              end if;

              calc(op,left,right,tempOut);
              report "eq-out: "&Float'image(tempOut);
              op:='N';
              left := 0.0;
              right := 0.0;
              count := 0.0;
              FloatCount := 1.0;
              isFloat := false;
              output<=realToString(tempOut);
            else

              if(input = '~' or input = 'L' or input = 'S' or input = 'C' or input = 'T' or input = '!')then
                isOneSide := true;
                OneSideOP := input;
              else

                calc(op,left,right,tempOut);
                report "isNot1Side-out: "&Float'image(tempOut);
                op := input;

                left := tempOut;
              end if;

              if(isOneSide)then
                isOneSide := false;
                calc(OneSideOP,right,left,tempOut);
                report "onsideCalc2-out: "&Float'image(tempOut);
                right := tempOut;
              else
                right := 0.0;
              end if;

              count := 0.0;
              FloatCount := 1.0;
              isFloat := false;

            end if;
          end if;

        end if;
      end if;
					
		--end if;
	end process;

end architecture CalCulator_Arc;

