library IEEE;
use IEEE.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;

entity lcd_2parcial_tb is 
end lcd_2parcial_tb;

architecture arch of lcd_2parcial_tb is 

component lcd_2parcial is 
port (clk,reset,rs,rw_data: in bit; data: in unsigned(7 downto 0);
     rs_out, rw_out, en: out bit; data_out: out unsigned (7 downto 0));
end component;

signal clk,reset,rs,rw_data: bit := '1'; 
signal data: unsigned(7 downto 0);
signal rs_out, rw_out, en: bit; 
signal data_out: unsigned(7 downto 0);


begin
    UUT : lcd_2parcial port map (clk,reset,rs,rw_data,data,rs_out,rw_out,en,data_out);

    P0: process 
    begin    
    clk <= '0';
    wait for 5 ns;
    clk <= '1'; 
    wait for 5 ns;    
    end process;


    stimulus1: process
    use STD.TEXTIO.all;
    file fin: TEXT open READ_MODE is "input_test.txt";
   
    variable current_read_line: line;
    variable current_read_field1: bit;
    variable current_read_field2: bit;
    variable current_read_field3: bit_vector(7 downto 0);
    variable current_read_field4: bit;
    
    begin 
        wait for 34 ns;
        while(not endfile(fin)) loop
            readline(fin, current_read_line);
            read(current_read_line,current_read_field1);
            read(current_read_line,current_read_field2);
            read(current_read_line,current_read_field3);
            read(current_read_line,current_read_field4);

            rs <= current_read_field1;
            rw_data <= current_read_field2;
            data <= unsigned(current_read_field3);
            reset <= current_read_field4;
           
         wait for 10 ns;
        end loop;
        wait;
    end process;

end arch;