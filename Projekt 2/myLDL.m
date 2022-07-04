function [L, D] = myLDL(diagA, dolnaDiagA)
% Funkcja ta przyjmuje jako argumenty:
% • diagA - jest to diagonala macierzy A, zapisana jako wektor poziomy
% • dolnaDiagA - jest to −1-wsza diagonala macierzy A, czyli te wyrazy macierzy, które znajdują się bezpośrednio
% pod główną przekątną macierzy A, zapisana jako wektor poziomy
% Funkcja ta zwraca macierze L oraz D, które są rozkładem LDL∗ macierzy A.
    if (length(dolnaDiagA)+1 ~= length(diagA))
        error("Podano złe wymiary macierzy A") 
    end
    n = length(diagA);
    L = complex(zeros(n,n)); %tworzę macierz L odpowiednich wymiarów, wypełnioną zerami
    for i = 1:n
        L(i,i)=1; %wstawiam jedynki na diagonalę macierzy L
    end
    
    D = complex(zeros(n,1)); %tworzę wektor D wypełniony zerami (który jest diagonalą macierzy D)

    D(1) = diagA(1); %wstawiam wartości do macierzy D zgodnie z algorytmem
    if length(diagA) > 1 %macierze większe niż 1x1:
    L(2, 1) = dolnaDiagA(1)/D(1); %wstawiam wartości do macierzy D zgodnie z algorytmem
        for i=2:n
            D(i) = diagA(i)-diagA(i-1)*L(i,i-1)*L(i,i-1);
            if i+1 <= n
                j=i+1;
                    L(j,i)=dolnaDiagA(i)/D(i);
            end
        end 
    end
    D = diag(D);