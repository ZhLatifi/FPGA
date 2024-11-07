----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:09 05/18/2023 
-- Design Name: 
-- Module Name:    MSProcessor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MCProcessor is

    Port ( clk : in  STD_LOGIC;
			  FB : out  std_logic_vector(31 downto 0));
	 
end MCProcessor;

architecture Behavioral of MCProcessor is

	COMPONENT CtrlUnit
	PORT(
		Op : IN std_logic_vector(5 downto 0);
		Funct : IN std_logic_vector(5 downto 0);
		clk : IN std_logic;          
		PCSrc : OUT std_logic_vector(1 downto 0);
		PCWrite : OUT std_logic;
		RegDst : OUT std_logic;
		Branch : OUT std_logic;
		MemtoReg : OUT std_logic;
		ALUctrl : OUT std_logic_vector(3 downto 0);
		MemWrite : OUT std_logic;
		IorD : OUT std_logic;
		IRWrite : OUT std_logic;
		ALUSrcA : OUT std_logic;
		ALUSrcB : OUT std_logic_vector(1 downto 0);
		RegWrite : OUT std_logic
		);
	END COMPONENT;

	signal A: std_logic_vector(31 downto 0) := (others => '0');
	signal B: std_logic_vector(31 downto 0) := (others => '0');
	signal readdata1 : std_logic_vector(31 downto 0) := (others => '0');
	signal readdata2 : std_logic_vector(31 downto 0) := (others => '0');

	COMPONENT ABreg
	PORT(
		readdata1 : IN std_logic_vector(31 downto 0);
		readdata2 : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		A : OUT std_logic_vector(31 downto 0);
		B : OUT std_logic_vector(31 downto 0)
		);	
	END COMPONENT;
	
	signal imm32 : std_logic_vector(31 downto 0) := (others => '0');
	signal PC : std_logic_vector(31 downto 0) := (others => '0');
	signal ALUSrcA : std_logic;
	signal ALUSrcB : std_logic_vector(1 downto 0) := (others => '0');          
	signal SrcA : std_logic_vector(31 downto 0) := (others => '0');
	signal SrcB : std_logic_vector(31 downto 0) := (others => '0');
	
	COMPONENT ALUMUX
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		imm32 : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		ALUSrcA : IN std_logic;
		ALUSrcB : IN std_logic_vector(1 downto 0);          
		SrcA : OUT std_logic_vector(31 downto 0);
		SrcB : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal ALUResult : std_logic_vector(31 downto 0) := (others => '0');
	signal ALUOut : std_logic_vector(31 downto 0);
	signal ALUctrl : std_logic_vector(3 downto 0) := (others => '0');  
	signal Data : std_logic_vector(31 downto 0) := (others => '0');
	signal zero : std_logic := '0';

	COMPONENT ALUReg
	PORT(
		ALUResult : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		ALUOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	

	COMPONENT ALU
	PORT(
		SrcA : IN std_logic_vector(31 downto 0);
		SrcB : IN std_logic_vector(31 downto 0);
		ALUctrl : IN std_logic_vector(3 downto 0);          
		ALUResult : OUT std_logic_vector(31 downto 0);
		zero : OUT std_logic
		);
	END COMPONENT;

	COMPONENT DataReg
	PORT(
		RD : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		Data : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal Instr : std_logic_vector(31 downto 0) := (others => '0');
	signal RegDst : std_logic;          
	signal readreg1 : std_logic_vector(4 downto 0) := (others => '0');
	signal readreg2 : std_logic_vector(4 downto 0) := (others => '0');
	signal writereg : std_logic_vector(4 downto 0) := (others => '0');
	signal Op : std_logic_vector(5 downto 0) := (others => '0');
	signal Funct : std_logic_vector(5 downto 0) := (others => '0');
	signal imm16 : std_logic_vector(15 downto 0) := (others => '0');
	signal Addr : std_logic_vector(25 downto 0) := (others => '0');
	signal IRWrite : std_logic;
	
	COMPONENT InstDec
	PORT(
		Instr : IN std_logic_vector(31 downto 0);
		RegDst : IN std_logic;          
		readreg1 : OUT std_logic_vector(4 downto 0);
		readreg2 : OUT std_logic_vector(4 downto 0);
		writereg : OUT std_logic_vector(4 downto 0);
		Op : OUT std_logic_vector(5 downto 0);
		Funct : OUT std_logic_vector(5 downto 0);
		imm16 : OUT std_logic_vector(15 downto 0);
		Addr : OUT std_logic_vector(25 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstReg
	PORT(
		RD : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		IRWrite : IN std_logic;          
		Instr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal IorD : std_logic;
	signal Adr : std_logic_vector(31 downto 0) := (others => '0');
	signal MemWrite : std_logic;
	signal RD : std_logic_vector(31 downto 0) := (others => '0');
	
	COMPONENT MemMUX
	PORT(
		IorD : IN std_logic;
		ALUOut : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);          
		Adr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Memory
	PORT(
		Adr : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		MemWrite : IN std_logic;          
		RD : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal PCSrc : std_logic_vector(1 downto 0) := (others => '0');         
	signal PCin : std_logic_vector(31 downto 0)  := (others => '0');
	signal PCEn : std_logic;  
	
	COMPONENT PCMUX
	PORT(
		ALUResult : IN std_logic_vector(31 downto 0);
		ALUOut : IN std_logic_vector(31 downto 0);
		PCSrc : IN std_logic_vector(1 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		Addr : IN std_logic_vector(25 downto 0);          
		PCin : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ProgCnt
	PORT(
		PCin : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		PCEn : IN std_logic;          
		PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal writedata : std_logic_vector(31 downto 0) := (others => '0');
	signal RegWrite : std_logic;   
	signal MemtoReg : std_logic;  
	
	COMPONENT RegFile
	PORT(
		readreg1 : IN std_logic_vector(4 downto 0);
		readreg2 : IN std_logic_vector(4 downto 0);
		writereg : IN std_logic_vector(4 downto 0);
		writedata : IN std_logic_vector(31 downto 0);
		clk :       IN std_logic;
		RegWrite : IN std_logic;          
		readdata1 : OUT std_logic_vector(31 downto 0);
		readdata2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegMUX
	PORT(
		ALUOut : IN std_logic_vector(31 downto 0);
		Data : IN std_logic_vector(31 downto 0);
		MemtoReg : IN std_logic;          
		writedata : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal PCWrite: std_logic;
	signal Branch:  std_logic;
	
	COMPONENT SgnExt
	PORT(
		imm16 : IN std_logic_vector(15 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	

begin

	Inst_CtrlUnit: CtrlUnit PORT MAP(
		Op => Op,
		Funct => Funct,
		clk => clk,
		PCSrc => PCSrc,
		PCWrite => PCWrite,
		RegDst => RegDst,
		Branch => Branch,
		MemtoReg => MemtoReg,
		ALUctrl => ALUctrl,
		MemWrite => MemWrite,
		IorD => IorD,
		IRWrite => IRWrite,
		ALUSrcA => ALUSrcA,
		ALUSrcB => ALUSrcB,
		RegWrite => RegWrite
	);

	Inst_ABreg: ABreg PORT MAP(
		readdata1 => readdata1,
		readdata2 => readdata2,
		clk => clk,
		A => A,
		B => B
	);
	
	Inst_ALUMUX: ALUMUX PORT MAP(
		A => A,
		B => B,
		imm32 => imm32,
		PC => PC,
		ALUSrcA => ALUSrcA,
		ALUSrcB => ALUSrcB,
		SrcA => SrcA,
		SrcB => SrcB
	);
	
	Inst_ALUReg: ALUReg PORT MAP(
		ALUResult => ALUResult,
		clk => clk,
		ALUOut => ALUOut
	);
	
	Inst_ALU: ALU PORT MAP(
		SrcA => SrcA,
		SrcB => SrcB,
		ALUctrl => ALUctrl,
		ALUResult => ALUResult,
		zero => zero
	);
	
	Inst_DataReg: DataReg PORT MAP(
		RD => RD,
		clk => clk,
		Data => Data
	);
	
	Inst_InstDec: InstDec PORT MAP(
		Instr => Instr,
		RegDst => RegDst,
		readreg1 => readreg1,
		readreg2 => readreg2,
		writereg => writereg,
		Op => Op,
		Funct => Funct,
		imm16 => imm16,
		Addr => Addr
	);
	
	Inst_InstReg: InstReg PORT MAP(
		RD => RD,
		clk => clk,
		IRWrite => IRWrite,
		Instr => Instr
	);
	
	Inst_MemMUX: MemMUX PORT MAP(
		IorD => IorD,
		ALUOut => ALUOut,
		PC => PC,
		Adr => Adr
	);
	
	Inst_Memory: Memory PORT MAP(
		Adr => Adr,
		B => B,
		clk => clk,
		MemWrite => MemWrite,
		RD => RD
	);
	
	Inst_PCMUX: PCMUX PORT MAP(
		ALUResult => ALUResult,
		ALUOut => ALUOut,
		PCSrc => PCSrc,
		PC => PC,
		Addr => Addr,
		PCin => PCin
	);
	
	Inst_PC: ProgCnt PORT MAP(
		PCin => PCin,
		clk => clk,
		PCEn => PCEn,
		PC => PC
	);
	
	
	Inst_RegFile: RegFile PORT MAP(
		readreg1 => readreg1,
		readreg2 => readreg2,
		writereg => writereg,
		writedata => writedata,
		clk => clk,
		RegWrite => RegWrite,
		readdata1 => readdata1,
		readdata2 => readdata2
	);
	
	Inst_RegMUX: RegMUX PORT MAP(
		ALUOut => ALUOut,
		Data => Data,
		MemtoReg => MemtoReg,
		writedata => writedata
	);
	
	Inst_SgnExt: SgnExt PORT MAP(
		imm16 => imm16,
		imm32 => imm32
	);
	
 PCEn <= PCwrite or (Branch and zero);
 FB <= ALUResult;
end Behavioral;

