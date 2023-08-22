pragma circom 2.0.0; 

template bhaktiCircuit () {  
   signal input a;
   signal input b;
   signal x;
   signal y;
   signal output q;

   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();


   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   q <== orGate.out;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}



component main = bhaktiCircuit();