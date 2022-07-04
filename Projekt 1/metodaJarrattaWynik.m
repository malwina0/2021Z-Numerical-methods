function wynik = metodaJarrattaWynik(wspolczynniki, ile, x_0)
    %       funkcja zwraca:
    %przybliżenie pierwiastka wielomianu z wykorzystaniem metody Jarrata
    %       funkcja przyjmuje jako argument:
    % wspolczynniki -> wektor współczynników wielomianu, gdzie wspolczynniki(1)=a_{n} jest
    % współczynnikiem przy n-tej, najwyższej potędze, czyli od najwyższej potęgi do
    % najmniejszej    ( współczynniki(i) = a(n-i+1) gdzie a(n-i+1) jest
    % współczynnikiem przy x^(n-i+1) )
    % ile -> liczba iteracji, które mają się wykonać
    % x_0 -> przybliżenie początkowe
    n = length(wspolczynniki); 
    if n == 0       % pusta lista
        error('Lista współczynników nie może być pusta');
    end
    if n == 1 % wielomiany stopnia 0
        if wspolczynniki == 0 % funkcja stała równa 0
            warning('Funkcja stała równa 0');
            wynik = Inf;
            return
        else
            warning('Funkcja stała - brak miejsc zerowych');
        return
        end
    end
    x = complex(x_0); % zamienia podaną liczbę na zespoloną
    for i = 1:ile  
        [f_x, fPrime_x] = metodaHornera(wspolczynniki, x); % wartość wielomianu i jego pochodnej w punkcie x
        nawias = x - f_x/(2*fPrime_x); % wartość nawiasu w mianowniku
        [~, fPrime_nawias] = metodaHornera(wspolczynniki, nawias); %wartość mianownika
        x = x - f_x/fPrime_nawias; % kolejne przybliżenie, jeśli pętla będzie 
        % dalej wykonywać staje się to nowym punktem startowym
    end
    wynik = x;