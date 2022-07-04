function [wartosc, wartoscPochodnej] = metodaHornera(wspolczynniki, z) 
    %       funkcja zwraca:
    % wartość wielomianu w danym punkcie z oraz wartość pochodnej wielomianu w
    % tym punkcie
    %       funkcja przyjmuje jako argument:
    % wspolczynniki -> wektor współczynników wielomianu, gdzie wspolczynniki(1)=a_{n} jest
    % współczynnikiem przy n-tej, najwyższej potędze, czyli od najwyższej potęgi do
    % najmniejszej    ( współczynniki(i) = a(n+1-i), gdzie a(n+1-i) jest
    % współczynnikiem przy x^(n+1-i) )
    % z -> liczba, dla której wyliczamy wartość wielomianu

    n = length(wspolczynniki); 
    if n == 0       % pusta lista
        error("Lista współczynników nie może być pusta");
    end
    if n == 1       % wielomiany stopnia 0
        wartosc = wspolczynniki(1);
        wartoscPochodnej = 0;
        return
    end
    % wielomiany stopnia >=1:
    wartoscTmp = wspolczynniki(1); % zaczyna od a_{0}, czyli od najbardziej wewnętrznego nawiasu
    pochodnaTmp = wartoscTmp; % analogicznie zaczyna w najbardziej wewnętrznym nawiasie
    for iterator = 2:1:n-1  %oblicza wartość iteracyjnie, zgodnie z algorytmem Hornera
        wartoscTmp = wartoscTmp*z + wspolczynniki(iterator); 
        pochodnaTmp = pochodnaTmp*z + wartoscTmp;
    end
    wartosc = wspolczynniki(n) + wartoscTmp*z; %dodajemy poza pętlą, bo przy obliczaniu wartości wielomianu
    %jest o jeden nawias więcej niż w przypadku obliczania wartości
    %pochodnej wielomianu
    wartoscPochodnej = pochodnaTmp; 
