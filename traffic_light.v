module traffic_light(input clk,output reg [2:0]NS,EW,output reg 
[1:0]state,nextstate, output reg [2:0] count);
parameter A=0,B=1,C=2,D=3;

initial begin
count=0;
state=0;
nextstate=0;
end
always@(*)begin
case(state)
    A:begin
        nextstate=(count==5)?B:A;
       // if(nextstate==B)
         //   count=0;
       end
    B:begin
        nextstate=(count==2)?C:B;
        //if(nextstate==C)
          //  count=0;
       end
        
    C:begin
    nextstate=(count==5)?D:C;
        //if(nextstate==D)
          //  count=0;
      end
    D:begin
    nextstate=(count==2)?A:D;
        //if(nextstate==A)
          //  count=0;
     end 
endcase
end
always@(posedge clk)begin
if(state!=nextstate)
    count<=0;
else
    count<=count+1;
state<=nextstate;
end
always@(*)begin
case(state)
A:begin
    NS=3'b001;
    EW=3'b100;
    end
 B:begin
    NS=3'b010;
    EW=3'b100;
   end
  C:begin
    NS=3'b100;
    EW=3'b001;
   end
   D:begin
    NS=3'b100;
    EW=3'b010;
   end
   default:begin
   NS=3'b000;
   EW=3'b000;
   end
   endcase
   end
 
endmodule

