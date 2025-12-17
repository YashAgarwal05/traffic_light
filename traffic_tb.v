module traffic_tb();
reg clk;
wire [2:0]NS,EW;
wire [1:0]state,nextstate;
wire [2:0] count;
traffic_light uut(.clk(clk),.NS(NS),.EW(EW),.state(state),.nextstate(nextstate),.count(count));
initial clk=0;
always #5 clk=~clk;
initial begin
#200
$finish;
end
endmodule