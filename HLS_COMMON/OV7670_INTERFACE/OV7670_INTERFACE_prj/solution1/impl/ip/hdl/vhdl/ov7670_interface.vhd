-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ov7670_interface is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_in_V : IN STD_LOGIC_VECTOR (7 downto 0);
    href_V : IN STD_LOGIC_VECTOR (0 downto 0);
    vsync_V : IN STD_LOGIC_VECTOR (0 downto 0);
    data_out_V : OUT STD_LOGIC_VECTOR (7 downto 0);
    line_valid_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_valid_V : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of ov7670_interface is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "ov7670_interface,hls_ip_2018_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu9eg-ffvb1156-2-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.672000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=66,HLS_SYN_LUT=219}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_1E0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111100000";
    constant ap_const_lv32_500 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000010100000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal count_lines : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal first : STD_LOGIC_VECTOR (0 downto 0) := "1";
    signal count_readings : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal brmerge_fu_113_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_cond_fu_137_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_cond1_fu_149_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_177_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal href_V_read_read_fu_60_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_4_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_189_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_not1_fu_107_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_131_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_not_fu_125_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_143_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_121 : BOOLEAN;
    signal ap_condition_55 : BOOLEAN;
    signal ap_condition_71 : BOOLEAN;
    signal ap_condition_60 : BOOLEAN;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    count_lines_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                count_lines <= ap_const_lv32_0;
            else
                if ((ap_const_boolean_1 = ap_condition_55)) then
                    if ((ap_const_boolean_1 = ap_condition_121)) then 
                        count_lines <= tmp_5_fu_177_p2;
                    elsif (((or_cond1_fu_149_p2 = ap_const_lv1_0) and (or_cond_fu_137_p2 = ap_const_lv1_0))) then 
                        count_lines <= ap_const_lv32_0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    count_readings_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                count_readings <= ap_const_lv32_0;
            else
                if ((ap_const_boolean_1 = ap_condition_71)) then
                    if ((href_V_read_read_fu_60_p2 = ap_const_lv1_1)) then 
                        count_readings <= tmp_3_fu_189_p2;
                    elsif (((href_V_read_read_fu_60_p2 = ap_const_lv1_0) and (tmp_4_fu_165_p2 = ap_const_lv1_1))) then 
                        count_readings <= ap_const_lv32_0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    first_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                first <= ap_const_lv1_1;
            else
                if (((ap_start = ap_const_logic_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    first <= ap_const_lv1_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_condition_121_assign_proc : process(or_cond_fu_137_p2, href_V_read_read_fu_60_p2, tmp_4_fu_165_p2)
    begin
                ap_condition_121 <= ((href_V_read_read_fu_60_p2 = ap_const_lv1_0) and (tmp_4_fu_165_p2 = ap_const_lv1_1) and (or_cond_fu_137_p2 = ap_const_lv1_1));
    end process;


    ap_condition_55_assign_proc : process(ap_start, ap_CS_fsm_state1, brmerge_fu_113_p2)
    begin
                ap_condition_55 <= ((ap_start = ap_const_logic_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1));
    end process;


    ap_condition_60_assign_proc : process(brmerge_fu_113_p2, or_cond_fu_137_p2, href_V_read_read_fu_60_p2)
    begin
                ap_condition_60 <= ((href_V_read_read_fu_60_p2 = ap_const_lv1_1) and (or_cond_fu_137_p2 = ap_const_lv1_1) and (brmerge_fu_113_p2 = ap_const_lv1_1));
    end process;


    ap_condition_71_assign_proc : process(ap_start, ap_CS_fsm_state1, brmerge_fu_113_p2, or_cond_fu_137_p2)
    begin
                ap_condition_71 <= ((ap_start = ap_const_logic_1) and (or_cond_fu_137_p2 = ap_const_lv1_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    brmerge_fu_113_p2 <= (vsync_V or p_not1_fu_107_p2);

    data_out_V_assign_proc : process(ap_start, ap_CS_fsm_state1, data_in_V, brmerge_fu_113_p2, ap_condition_60)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
            if ((ap_const_boolean_1 = ap_condition_60)) then 
                data_out_V <= data_in_V;
            elsif ((brmerge_fu_113_p2 = ap_const_lv1_0)) then 
                data_out_V <= ap_const_lv8_0;
            else 
                data_out_V <= "XXXXXXXX";
            end if;
        else 
            data_out_V <= "XXXXXXXX";
        end if; 
    end process;


    frame_valid_V_assign_proc : process(ap_start, ap_CS_fsm_state1, brmerge_fu_113_p2, or_cond_fu_137_p2)
    begin
        if (((ap_start = ap_const_logic_1) and (or_cond_fu_137_p2 = ap_const_lv1_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            frame_valid_V <= ap_const_lv1_1;
        elsif ((((ap_start = ap_const_logic_1) and (brmerge_fu_113_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_start = ap_const_logic_1) and (or_cond_fu_137_p2 = ap_const_lv1_0) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            frame_valid_V <= ap_const_lv1_0;
        else 
            frame_valid_V <= "X";
        end if; 
    end process;

    href_V_read_read_fu_60_p2 <= href_V;

    line_valid_V_assign_proc : process(ap_start, ap_CS_fsm_state1, brmerge_fu_113_p2, or_cond_fu_137_p2, href_V_read_read_fu_60_p2)
    begin
        if (((ap_start = ap_const_logic_1) and (href_V_read_read_fu_60_p2 = ap_const_lv1_1) and (or_cond_fu_137_p2 = ap_const_lv1_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            line_valid_V <= ap_const_lv1_1;
        elsif ((((ap_start = ap_const_logic_1) and (brmerge_fu_113_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_start = ap_const_logic_1) and (href_V_read_read_fu_60_p2 = ap_const_lv1_0) and (or_cond_fu_137_p2 = ap_const_lv1_1) and (brmerge_fu_113_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            line_valid_V <= ap_const_lv1_0;
        else 
            line_valid_V <= "X";
        end if; 
    end process;

    or_cond1_fu_149_p2 <= (tmp_2_fu_143_p2 and p_not_fu_125_p2);
    or_cond_fu_137_p2 <= (tmp_1_fu_131_p2 and p_not_fu_125_p2);
    p_not1_fu_107_p2 <= (first xor ap_const_lv1_1);
    p_not_fu_125_p2 <= (vsync_V xor ap_const_lv1_1);
    tmp_1_fu_131_p2 <= "1" when (unsigned(count_lines) < unsigned(ap_const_lv32_1E0)) else "0";
    tmp_2_fu_143_p2 <= "1" when (count_lines = ap_const_lv32_1E0) else "0";
    tmp_3_fu_189_p2 <= std_logic_vector(unsigned(count_readings) + unsigned(ap_const_lv32_1));
    tmp_4_fu_165_p2 <= "1" when (count_readings = ap_const_lv32_500) else "0";
    tmp_5_fu_177_p2 <= std_logic_vector(unsigned(count_lines) + unsigned(ap_const_lv32_1));
end behav;
