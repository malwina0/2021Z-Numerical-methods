function x = myLDLHsolve(diagA, dolnaDiagA, B)
% Funkcja ta przyjmuje jako argumenty:
% • diagA - jest to diagonala macierzy A, dla której rozwiązujemy równanie AX = B (zapisana jako wektor
% poziomy)
% • dolnaDiagA - jest to −1-wsza diagonala macierzy A, czyli te wyrazy macierzy, które znajdują się bezpośrednio
% pod główną przekątną macierzy A, dla której rozwiązujemy równanie AX = B (zapisana jako wektor poziomy)
% • B - wektor B, dla którego rozwiązujemy równanie AX = B (zapisany jako wektor poziomy)
% Funkcja ta zwraca wektor X, czyli szukane rozwiązanie równania macierzowego AX = B.
    n = length(diagA);
    if (length(dolnaDiagA)+1 ~= n) % dolna diagonala musi być o 1 krótsza niż główna
        error("Podano złe wymiary macierzy A") 
    end
    if (length(B) ~= n) % wymiar wektora B musi być zgodny z wymiarem macierzy A
        error("Nieprawidłowa długość wektora B.") 
    end

    L = complex(zeros(n,n)); %tworzę macierz L odpowiednich wymiarów, wypełnioną zerami
    for i = 1:n
        L(i,i)=1; %wstawiam jedynki na diagonalę macierzy L
    end
    
    D = complex(zeros(n,1)); %tworzę wektor D wypełniony zerami (który jest diagonalą macierzy D)
    z = complex(zeros(n,1)); %wektory z i y są pomocnicze przy rozwiązywaniu równania
    y = complex(zeros(n,1));
    x = complex(zeros(n,1));

    D(1) = diagA(1); %wstawiam wartości do macierzy D zgodnie z algorytmem
    z(1) = B(1); % obliczanie Lz = B
    y(1) = z(1)/D(1);  % Dy = z

    if length(diagA) > 1 %macierze większe niż 1x1:
    L(2, 1) = dolnaDiagA(1)/D(1); %wstawiam wartości do macierzy D zgodnie z algorytmem
        for i=2:n
              D(i) = diagA(i)-diagA(i-1)*L(i,i-1)*L(i,i-1);
              z(i) = B(i)-L(i, i-1)*z(i-1); % obliczanie Lz = B
              y(i) = z(i)/D(i); % obliczanie Dy = z
            if i+1 <= n
                j=i+1;
                    L(j,i)=dolnaDiagA(i)/D(i);
            end
        end 
    end
    LH = transpose(conj(L)); %macierz L* to macierz L sprzężona i transponowana
    x(n) = y(n);
    for i=n-1:-1:1
        x(i) = y(i)-LH(i, i+1)*x(i+1); %backward substitution czyli obliczanie L*x=y
    end