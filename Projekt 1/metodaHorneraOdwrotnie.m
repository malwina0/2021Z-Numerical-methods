function [wartosc, wartoscPochodnej] = metodaHorneraOdwrotnie(wspolczynniki, z) 
    %       funkcja zwraca:
    % wartość wielomianu w danym punkcie z oraz wartość pochodnej wielomianu w
    % tym punkcie
    %       funkcja przyjmuje jako argument:
% wspolczynniki -> wektor współczynników wielomianu, gdzie wspolczynniki(1)=a_{n} jest
% współczynnikiem przy n-tej, najwyższej potędze, czyli od najwyższej potęgi do
% najmniejszej    ( współczynniki(i) = a(n-i+1) gdzie a(n-i+1) jest
% współczynnikiem przy x^(n-i+1) )
    % z -> liczba, dla której wyliczamy wartość wielomianu
    n = length(wspolczynniki); 
    if n == 0       % pusta lista
        error("Lista współczynników nie może być pusta")
    end
    if n == 1       % wielomiany stopnia 0
        wartosc = wspolczynniki(1);
        wartoscPochodnej = 0;
        return
    end
    % wielomiany stopnia >=1:
    wartoscTmp = wspolczynniki(n); % zaczyna od a_{n}, czyli od najbardziej wewnętrznego nawiasu
    pochodnaTmp = wartoscTmp; % analogicznie zaczyna w najbardziej wewnętrznym nawiasie
    for iterator = n-1:-1:2  %oblicza wartość iteracyjnie, zgodnie z algorytmem Hornera
        wartoscTmp = wartoscTmp*z + wspolczynniki(iterator); 
        pochodnaTmp = pochodnaTmp*z + wartoscTmp;
    end
    wartosc = wspolczynniki(1) + wartoscTmp*z; %dodajemy poza pętlą, bo przy obliczaniu wartości wielomianu
    %jest o jeden nawias więcej niż w przypadku obliczania wartości
    %pochodnej wielomianu
    wartoscPochodnej = pochodnaTmp; 
