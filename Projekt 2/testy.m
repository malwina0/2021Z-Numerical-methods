%testy
%Przykład 1
czyDodatnioOkreslona([4 9], [1])
[L1, D1] = wbudowanyLDL([4 9], [1]);
[myL1, myD1] = myLDL([4 9], [1]);
[L1, D1] == [myL1, myD1]
X1 = wbudowanySolve(L1, D1, [8 12]);
myX1 = mySolve(L1, D1, [8 12]);
X1 == myX1
mojX1 = myLDLHsolve([4 9], [1], [8 12]);
X1 == mojX1
heatmap(abs(L1-myL1))
heatmap(abs(D1-myD1))
%Przykład 2
czyDodatnioOkreslona([13 2], [1i])
[L2, D2] = wbudowanyLDL([13 2], [1i]);
[myL2, myD2] = myLDL([13 2], [1i]);
[L2, D2] == [myL2, myD2]
X2 = wbudowanySolve(L2, D2, [10 3])
myX2 = mySolve(L2, D2, [10 3])
X2 == myX2
mojX2 = myLDLHsolve([13 2], [1i], [10 3]);
X2 == mojX2
heatmap(abs(L2-myL2))
heatmap(abs(D2-myD2))
%Przykład 3
czyDodatnioOkreslona([4 15 12], [1 8])
[L3, D3] = wbudowanyLDL([4 15 12], [1 8])
[myL3, myD3] = myLDL([4 15 12], [1 8]);
[L3, D3] == [myL2, myD2]
X3 = wbudowanySolve(myL3, myD3, [6 3 20]);
myX3 = mySolve(L3, D3, [6 3 20])
X3 == myX3
mojX3 = myLDLHsolve([4 15 12], [1 8], [6 3 20]);
X3 == mojX3
heatmap(abs(L3-myL3))
heatmap(abs(D3-myD3))

%Przykład 4
czyDodatnioOkreslona([25 2 11], [5i -2i])
[L4, D4] = wbudowanyLDL([25 2 11], [5i -2i])
[myL4, myD4] = myLDL([25 2 11], [5i -2i]);
[L4, D4] == [myL4, myD4]
X4 = wbudowanySolve(myL4, myD4, [50 20 4]);
myX4 = mySolve(L4, D4, [50 20 4])
X4 == myX4
mojX4 = myLDLHsolve([25 2 11], [5i -2i], [50 20 4]);
X4== mojX4
heatmap(abs(L4-myL4))
heatmap(abs(D4-myD4))
%Przykład 5
czyDodatnioOkreslona([0.82 0.43 0.12], [0.05 0.1])
[L5, D5] = wbudowanyLDL([0.82 0.43 0.12], [0.05 0.1])
[myL5, myD5] = myLDL([0.82 0.43 0.12], [0.05 0.1])
[L5, D5] == [myL5, myD5]
X5 = wbudowanySolve(myL5, myD5, [50 20 4])
myX5 = mySolve(L4, D4, [50 20 4])
X5 == myX5
mojX5 = myLDLHsolve([0.82 0.43 0.12], [0.05 0.1], [50 20 4]);
X5 == mojX5
heatmap(abs(L5-myL5))
heatmap(abs(D5-myD5))

%Przykład 6
czyDodatnioOkreslona([135 10 0.12 34], [8.4 0.3 1])
[L6, D6] = wbudowanyLDL([135 10 0.12 34], [8.4 0.3 1])
[myL6, myD6] = myLDL([135 10 0.12 34], [8.4 0.3 1])
[L6, D6] == [myL6, myD6]
myL6*myD6*transpose(conj(myL6))
X6 = wbudowanySolve(myL6, myD6, [0.34 76 9 30])
mojX6 = myLDLHsolve([135 10 0.12 34], [8.4 0.3 1], [0.34 76 9 30])
X6 == mojX6
heatmap(abs(L6-myL6))
heatmap(abs(D6-myD6))

%Przykład 7
czyDodatnioOkreslona([135 10 0.12 34], [8.4i -0.3i 1i])
[L7, D7] = wbudowanyLDL([135 10 0.12 34], [8.4i -0.3i 1i])
[myL7, myD7] = myLDL([135 10 0.12 34],[8.4i -0.3i 1i])
[L7, D7] == [myL7, myD7]
myL7*myD7*transpose(conj(myL7))
X7 = wbudowanySolve(myL7, myD7, [0.34 76 9 30])
mojX7 = myLDLHsolve([135 10 0.12 34], [8.4i -0.3i 1i], [0.34 76 9 30])
X7 == mojX7
heatmap(abs(L7-myL7))
heatmap(abs(D7-myD7))

%Przykład 8
czyDodatnioOkreslona([7098 1234 673 784 2034], [38 83 32 71])
[L8, D8] = wbudowanyLDL([7098 1234 673 784 2034], [38 83 32 71])
[myL8, myD8] = myLDL([7098 1234 673 784 2034], [38 83 32 71])
[L8, D8] == [myL8, myD8]
myL8*myD8*transpose(conj(myL8))
X8 = wbudowanySolve(myL8, myD8, [14 894 204 1054 9821]);
mojX8 = myLDLHsolve([7098 1234 673 784 2034], [38 83 32 71], [14 894 204 1054 9821])
X8 == mojX8
heatmap(abs(L8-myL8))
heatmap(abs(D8-myD8))

%Przykład 9
czyDodatnioOkreslona([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i])
[L9] = wbudowanyLDL([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i])
[myL9] = myLDL([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i])
[~, D9] = wbudowanyLDL([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i])
[~, myD9] = myLDL([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i])
[L9, D9] == [myL9, myD9]
myL9*myD9*transpose(conj(myL9))
X9 = wbudowanySolve(myL9, myD9, [12i 32 198-1i 23-62i 178 -37i 2+3i 98]);
mojX9 = myLDLHsolve([70 134 673 84 204 902 475 160], [12+38i 83 -32i 71-2i 23 9-23i 32+98i], [12i 32 198-1i 23-62i 178 -37i 2+3i 98])
X9 == mojX9
heatmap(abs(L9-myL9))
heatmap(abs(D9-myD9))
