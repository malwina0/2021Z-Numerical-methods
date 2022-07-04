function [L, D] = wbudowanyLDL(diagA, dolnaDiagA)
% Funkcja ta przyjmuje jako argumenty:
% • diagA - jest to diagonala macierzy A, zapisana jako wektor poziomy
% • dolnaDiagA - jest to −1-wsza diagonala macierzy A, czyli te wyrazy macierzy, które znajdują się bezpośrednio
% pod główną przekątną macierzy A, zapisana jako wektor poziomy
% Funkcja ta zwraca macierze L oraz D, które są rozkładem LDL∗ macierzy A.
    gornaDiagA = conj(dolnaDiagA);
    A = diag(dolnaDiagA, -1) + diag(diagA, 0) + diag(gornaDiagA, 1);
    [L, D]  = ldl(A);