function x = mySolve(L, D, B)
% Funkcja ta przyjmuje jako argumenty:
% • L - macierz, która składa się na rozkład LDL∗
% rozważanej macierzy A, dla której rozwiązuję równanie macierzowe AX = B
% • D - macierz diagonalna, która składa się na rozkład LDL∗
% rozważanej macierzy A, dla której rozwiązuję
% równanie macierzowe AX = B
% • B wektor B, dla którego rozwiązuję równanie macierzowe AX = B zapisany jako wektor poziomy
% Funkcja ta zwraca X, czyli rozwiązanie równania AX = B
    n = length(L);
    if (length(B) ~= n) % wymiar wektora B musi być zgodny z wymiarem macierzy A
        error("Nieprawidłowa długość wektora B.") 
    end
    z = complex(zeros(n,1)); %wektory z i y są pomocnicze przy rozwiązywaniu równania
    y = complex(zeros(n,1));
    x = complex(zeros(n,1));

    D = diag(D);
    z(1) = B(1); % obliczanie Lz = B
    y(1) = z(1)/D(1);  % Dy = z
    for i=2:n
              z(i) = B(i)-L(i, i-1)*z(i-1); % obliczanie Lz = B
              y(i) = z(i)/D(i); % obliczanie Dy = z 
    end
    LH = transpose(conj(L)); %macierz L* to macierz L sprzężona i transponowana
    x(n) = y(n);
    for i=n-1:-1:1
        x(i) = y(i)-LH(i, i+1)*x(i+1); %backward substitution czyli obliczanie L*x=y
    end