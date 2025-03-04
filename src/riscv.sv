module riscv(input logic clk, reset,
            output logic [31:0] WriteData, DataAdr, WDFinal,
            output logic MemWrite,
            output logic Start);
    logic [31:0] PC, Instr, ReadData, AnsData;

    // instantiate processor, memories and coprocessor
    riscvsingle rvsingle( clk, reset, PC, Instr, MemWrite,
    DataAdr, WriteData, ReadData, WDFinal ,Start, AnsData);
    imem imem(PC, Instr);
    dmem dmem(clk, MemWrite, DataAdr, WDFinal, ReadData);
    coprocessor cop(clk, Start, WDFinal, AnsData);
endmodule