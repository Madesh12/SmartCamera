-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LF_valid_to_AXIS is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_in_V : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_valid : IN STD_LOGIC;
    line_valid : IN STD_LOGIC;
    outputStream_V_V_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    outputStream_V_V_TVALID : OUT STD_LOGIC;
    outputStream_V_V_TREADY : IN STD_LOGIC );
end;


architecture behav of LF_valid_to_AXIS is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "LF_valid_to_AXIS,hls_ip_2018_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu9eg-ffvb1156-2-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.000000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=26,HLS_SYN_LUT=68}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal outputStream_V_V_1_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal outputStream_V_V_1_vld_in : STD_LOGIC;
    signal outputStream_V_V_1_vld_out : STD_LOGIC;
    signal outputStream_V_V_1_ack_in : STD_LOGIC;
    signal outputStream_V_V_1_ack_out : STD_LOGIC;
    signal outputStream_V_V_1_payload_A : STD_LOGIC_VECTOR (7 downto 0);
    signal outputStream_V_V_1_payload_B : STD_LOGIC_VECTOR (7 downto 0);
    signal outputStream_V_V_1_sel_rd : STD_LOGIC := '0';
    signal outputStream_V_V_1_sel_wr : STD_LOGIC := '0';
    signal outputStream_V_V_1_sel : STD_LOGIC;
    signal outputStream_V_V_1_load_A : STD_LOGIC;
    signal outputStream_V_V_1_load_B : STD_LOGIC;
    signal outputStream_V_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal outputStream_V_V_1_state_cmp_full : STD_LOGIC;
    signal res : STD_LOGIC_VECTOR (0 downto 0) := "1";
    signal outputStream_V_V_TDATA_blk_n : STD_LOGIC;
    signal res_load_load_fu_66_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal frame_valid_read_read_fu_40_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal line_valid_read_read_fu_46_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal res_load_reg_76 : STD_LOGIC_VECTOR (0 downto 0);
    signal frame_valid_read_reg_80 : STD_LOGIC_VECTOR (0 downto 0);
    signal line_valid_read_reg_84 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op20_write_state1 : BOOLEAN;
    signal ap_block_state1_io : BOOLEAN;
    signal ap_predicate_op25_write_state2 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    outputStream_V_V_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                outputStream_V_V_1_sel_rd <= ap_const_logic_0;
            else
                if (((outputStream_V_V_1_ack_out = ap_const_logic_1) and (outputStream_V_V_1_vld_out = ap_const_logic_1))) then 
                                        outputStream_V_V_1_sel_rd <= not(outputStream_V_V_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    outputStream_V_V_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                outputStream_V_V_1_sel_wr <= ap_const_logic_0;
            else
                if (((outputStream_V_V_1_ack_in = ap_const_logic_1) and (outputStream_V_V_1_vld_in = ap_const_logic_1))) then 
                                        outputStream_V_V_1_sel_wr <= not(outputStream_V_V_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    outputStream_V_V_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                outputStream_V_V_1_state <= ap_const_lv2_0;
            else
                if ((((outputStream_V_V_1_state = ap_const_lv2_2) and (outputStream_V_V_1_vld_in = ap_const_logic_0)) or ((outputStream_V_V_1_state = ap_const_lv2_3) and (outputStream_V_V_1_vld_in = ap_const_logic_0) and (outputStream_V_V_1_ack_out = ap_const_logic_1)))) then 
                    outputStream_V_V_1_state <= ap_const_lv2_2;
                elsif ((((outputStream_V_V_1_state = ap_const_lv2_1) and (outputStream_V_V_1_ack_out = ap_const_logic_0)) or ((outputStream_V_V_1_state = ap_const_lv2_3) and (outputStream_V_V_1_ack_out = ap_const_logic_0) and (outputStream_V_V_1_vld_in = ap_const_logic_1)))) then 
                    outputStream_V_V_1_state <= ap_const_lv2_1;
                elsif (((not(((outputStream_V_V_1_vld_in = ap_const_logic_0) and (outputStream_V_V_1_ack_out = ap_const_logic_1))) and not(((outputStream_V_V_1_ack_out = ap_const_logic_0) and (outputStream_V_V_1_vld_in = ap_const_logic_1))) and (outputStream_V_V_1_state = ap_const_lv2_3)) or ((outputStream_V_V_1_state = ap_const_lv2_1) and (outputStream_V_V_1_ack_out = ap_const_logic_1)) or ((outputStream_V_V_1_state = ap_const_lv2_2) and (outputStream_V_V_1_vld_in = ap_const_logic_1)))) then 
                    outputStream_V_V_1_state <= ap_const_lv2_3;
                else 
                    outputStream_V_V_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    res_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                res <= ap_const_lv1_1;
            else
                if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (res_load_load_fu_66_p1 = ap_const_lv1_1) and (frame_valid_read_read_fu_40_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    res <= ap_const_lv1_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                frame_valid_read_reg_80 <= (0=>frame_valid, others=>'-');
                res_load_reg_76 <= res;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (frame_valid_read_read_fu_40_p2 = ap_const_lv1_1) and (res = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                line_valid_read_reg_84 <= (0=>line_valid, others=>'-');
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((outputStream_V_V_1_load_A = ap_const_logic_1)) then
                outputStream_V_V_1_payload_A <= data_in_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((outputStream_V_V_1_load_B = ap_const_logic_1)) then
                outputStream_V_V_1_payload_B <= data_in_V;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, outputStream_V_V_1_ack_in, ap_CS_fsm_state2, ap_block_state1_io, ap_block_state2_io)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((outputStream_V_V_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state1_io_assign_proc : process(outputStream_V_V_1_ack_in, ap_predicate_op20_write_state1)
    begin
                ap_block_state1_io <= ((outputStream_V_V_1_ack_in = ap_const_logic_0) and (ap_predicate_op20_write_state1 = ap_const_boolean_1));
    end process;


    ap_block_state2_io_assign_proc : process(outputStream_V_V_1_ack_in, ap_predicate_op25_write_state2)
    begin
                ap_block_state2_io <= ((outputStream_V_V_1_ack_in = ap_const_logic_0) and (ap_predicate_op25_write_state2 = ap_const_boolean_1));
    end process;


    ap_done_assign_proc : process(outputStream_V_V_1_ack_in, ap_CS_fsm_state2, ap_block_state2_io)
    begin
        if ((not(((outputStream_V_V_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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


    ap_predicate_op20_write_state1_assign_proc : process(res, frame_valid_read_read_fu_40_p2, line_valid_read_read_fu_46_p2)
    begin
                ap_predicate_op20_write_state1 <= ((frame_valid_read_read_fu_40_p2 = ap_const_lv1_1) and (line_valid_read_read_fu_46_p2 = ap_const_lv1_1) and (res = ap_const_lv1_0));
    end process;


    ap_predicate_op25_write_state2_assign_proc : process(res_load_reg_76, frame_valid_read_reg_80, line_valid_read_reg_84)
    begin
                ap_predicate_op25_write_state2 <= ((line_valid_read_reg_84 = ap_const_lv1_1) and (frame_valid_read_reg_80 = ap_const_lv1_1) and (res_load_reg_76 = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(outputStream_V_V_1_ack_in, ap_CS_fsm_state2, ap_block_state2_io)
    begin
        if ((not(((outputStream_V_V_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    frame_valid_read_read_fu_40_p2 <= (0=>frame_valid, others=>'-');
    line_valid_read_read_fu_46_p2 <= (0=>line_valid, others=>'-');
    outputStream_V_V_1_ack_in <= outputStream_V_V_1_state(1);
    outputStream_V_V_1_ack_out <= outputStream_V_V_TREADY;

    outputStream_V_V_1_data_out_assign_proc : process(outputStream_V_V_1_payload_A, outputStream_V_V_1_payload_B, outputStream_V_V_1_sel)
    begin
        if ((outputStream_V_V_1_sel = ap_const_logic_1)) then 
            outputStream_V_V_1_data_out <= outputStream_V_V_1_payload_B;
        else 
            outputStream_V_V_1_data_out <= outputStream_V_V_1_payload_A;
        end if; 
    end process;

    outputStream_V_V_1_load_A <= (outputStream_V_V_1_state_cmp_full and not(outputStream_V_V_1_sel_wr));
    outputStream_V_V_1_load_B <= (outputStream_V_V_1_state_cmp_full and outputStream_V_V_1_sel_wr);
    outputStream_V_V_1_sel <= outputStream_V_V_1_sel_rd;
    outputStream_V_V_1_state_cmp_full <= '0' when (outputStream_V_V_1_state = ap_const_lv2_1) else '1';

    outputStream_V_V_1_vld_in_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_predicate_op20_write_state1, ap_block_state1_io)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_predicate_op20_write_state1 = ap_const_boolean_1))) then 
            outputStream_V_V_1_vld_in <= ap_const_logic_1;
        else 
            outputStream_V_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    outputStream_V_V_1_vld_out <= outputStream_V_V_1_state(0);
    outputStream_V_V_TDATA <= outputStream_V_V_1_data_out;

    outputStream_V_V_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, outputStream_V_V_1_state, res, frame_valid_read_read_fu_40_p2, line_valid_read_read_fu_46_p2, ap_CS_fsm_state2, res_load_reg_76, frame_valid_read_reg_80, line_valid_read_reg_84)
    begin
        if ((((ap_start = ap_const_logic_1) and (frame_valid_read_read_fu_40_p2 = ap_const_lv1_1) and (line_valid_read_read_fu_46_p2 = ap_const_lv1_1) and (res = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((line_valid_read_reg_84 = ap_const_lv1_1) and (frame_valid_read_reg_80 = ap_const_lv1_1) and (res_load_reg_76 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            outputStream_V_V_TDATA_blk_n <= outputStream_V_V_1_state(1);
        else 
            outputStream_V_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    outputStream_V_V_TVALID <= outputStream_V_V_1_state(0);
    res_load_load_fu_66_p1 <= res;
end behav;
