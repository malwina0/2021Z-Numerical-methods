function X = wbudowanySolve(L, D, B)
% Funkcja ta przyjmuje jako argumenty:
% • L - macierz, która składa się na rozkład LDL∗
% rozważanej macierzy A, dla której rozwiązuję równanie macierzowe AX = B
% • D - macierz diagonalna, która składa się na rozkład LDL∗
% rozważanej macierzy A, dla której rozwiązuję
% równanie macierzowe AX = B
% • B wektor B, dla którego rozwiązuję równanie macierzowe AX = B zapisany jako wektor poziomy
% Funkcja ta zwraca X, czyli rozwiązanie równania AX = B
     n = length(D);
    if (length(B) ~= n) % wymiar wektora B musi być zgodny z wymiarem macierzy A
        error("Nieprawidłowa długość wektora B.") 
    end
    LH = transpose(conj(L));
    Y = linsolve(L, transpose(B));
    Z = linsolve(D, Y);
    X = linsolve(LH, Z);