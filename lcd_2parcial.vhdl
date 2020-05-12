library IEEE;
use IEEE.numeric_bit.all;

entity lcd_2parcial is 
port (clk,reset,rs,rw_data: in bit; data: in unsigned(7 downto 0);
     rs_out, rw_out, en: out bit; data_out: out unsigned (7 downto 0));
end lcd_2parcial;

architecture arch of lcd_2parcial is 
signal state: unsigned(2 downto 0) := "000";
signal nextstate: unsigned(2 downto 0);

--signal rs_in,rw_in: bit;
signal data_in: unsigned (7 downto 0);

begin
    en <= clk;
    data_out <= data_in;

    process(state,reset,rs,rw_data,data)
    use STD.TEXTIO.all;
    file fout: TEXT open WRITE_MODE is "output_test.txt";
    variable current_line : line;
    
    begin 
        if state /= "100" then
            rs_out <= '0'; 
            rw_out <= '0';
        end if;
        case state is 
            when "000" =>  -- clear LCD
                data_in <= "00000001";
                nextstate <= "001";
                write(current_line, string'("instr(1)"));
                writeline(fout,current_line);
            when "001" => --function set
                data_in <= "00111000";
                nextstate <= "010";
                write(current_line, string'("instr(56)"));
                writeline(fout,current_line);
            when "010" => -- display on/off control
                data_in <= "00001111";
                nextstate <= "011";
                write(current_line, string'("instr(15)"));
                writeline(fout,current_line);
            when "011" =>
                data_in <= "00000110";
                nextstate <= "100";
                write(current_line, string'("instr(6)"));
                writeline(fout,current_line);
            when "100" =>
                if reset = '0' then nextstate <= "000";
                else 
                    data_in <= data; 
                    rs_out <= rs; 
                    rw_out <= rw_data; 
            
                    if rs = '0' then write(current_line, string'("instr("));
                    else write(current_line, string'("data(")); end if;
                    
                    write(current_line, TO_INTEGER(unsigned(data)));
                    write(current_line,string'(")"));
                    writeline(fout,current_line);
                
                end if;
                
            
            when others => null;
        end case;
    
    end process;


    process(clk)
    begin
    if clk'event and clk = '1' then 
        state<= nextstate;
    end if;
    end process;

end arch;