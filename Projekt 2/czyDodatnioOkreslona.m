function isDodatnioOkreslona = czyDodatnioOkreslona(diagA, dolnaDiagA)
% Funkcja ta przyjmuje jako argumenty:
% • diagA - jest to diagonala macierzy A, zapisana jako wektor poziomy
% • dolnaDiagA - jest to −1-wsza diagonala macierzy A, czyli te wyrazy macierzy, które znajdują się bezpośrednio
% pod główną przekątną macierzy A
% Funkcja ta zwraca wartość logiczną, która mówi czy macierz trójdiagonalna A jest macierzą dodatnio określoną.
    gornaDiagA = conj(dolnaDiagA);
    A = diag(dolnaDiagA, -1) + diag(diagA, 0) + diag(gornaDiagA, 1);
    d = eig(A);
    if all(d > 0)
        isDodatnioOkreslona = true;
    else
        isDodatnioOkreslona = false;
    end
   