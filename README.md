# VHDL_Calculator
calculator with vhdl for SIMULATOR(ModelSim)


this is my first VHDL program that is written for simulating.
the `Calc.vhd` is the main Code and the `lib.vhd` is its library.

i write it in `ModelSim Simulator`

codes are in `Src` Folder.

the `RunSimulate.html` in Folder `CodeGenerator` is a code generator to generate the simulation commands for ModelSim.

open the `html` file and open console and write down fucntions like this:

```javascript
toCode("2+5=")

/**
 * Output:
 *
 * force -freeze sim:/calculator/input 2 0;force -freeze sim:/calculator/isButtonPushed 1 0;run -continue;
 *
 * force -freeze sim:/calculator/input + 0;force -freeze sim:/calculator/isButtonPushed 0 0;run -continue;
 *
 * force -freeze sim:/calculator/input 5 0;force -freeze sim:/calculator/isButtonPushed 1 0;run -continue;
 *
 * force -freeze sim:/calculator/input = 0;force -freeze sim:/calculator/isButtonPushed 0 0;run -continue;
 *
 */
```
this code will generate commands to run the simulator and see the output

```javascript
toCode("2+5=",true)

/**
 * Output:
 * force -freeze sim:/calculator/input 2 0;force -freeze sim:/calculator/isButtonPushed 1 0;step -over;
 *
 * force -freeze sim:/calculator/input + 0;force -freeze sim:/calculator/isButtonPushed 0 0;step -over;
 *
 * force -freeze sim:/calculator/input 5 0;force -freeze sim:/calculator/isButtonPushed 1 0;step -over;
 *
 * force -freeze sim:/calculator/input = 0;force -freeze sim:/calculator/isButtonPushed 0 0;step -over;
 *
 */
```
and this code is same as above but the commands will evaluate with Debug option