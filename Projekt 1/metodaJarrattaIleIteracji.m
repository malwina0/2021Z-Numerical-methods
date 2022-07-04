function licznik = metodaJarrattaIleIteracji(wspolczynniki, x_0, przyblizenie)
    %       funkcja zwraca:
    % liczbę iteracji, dla których różnica między kolejnymi wyznaczonymi
    % punktami jest mniejsza niż zadana wartość "przyblizenie"
    %       funkcja przyjmuje jako argument:
    % wspolczynniki -> wektor współczynników wielomianu, gdzie wspolczynniki(1)=a_{n} jest
    % współczynnikiem przy n-tej, najwyższej potędze, czyli od najwyższej potęgi do
    % najmniejszej    ( współczynniki(i) = a(n-i+1) gdzie a(n-i+1) jest
    % współczynnikiem przy x^(n-i+1) )
    % x_0 -> przybliżenie początkowe
    % przyblizenie - jeśli różnica między kolejnymi wyznaczonymi punktami jest 
    % mniejsza od tej wartości to następuje przerwanie pętli (warunek stopu)
    n = length(wspolczynniki); 
    if n == 0       % pusta lista
        error("Lista współczynników nie może być pusta");
    end
    if n == 1       % wielomiany stopnia 0
        if wspolczynniki == 0 % funkcja stała równa 0
            warning('Funkcja stała równa 0');
            licznik = 0;
            return
        else
            warning("Funkcja stała - brak miejsc zerowych");
            licznik = Inf;
        return
        end
    end
    x = complex(x_0);
    poprzednie = Inf; % początkowo wartość poprzedniego przybliżenia ustawiona jest na Inf
    % aby przy pierwszym przejściu pętli z niej nie wyjść
    licznik = 0; %licznik iteracji
    roznica = Inf; % początkowo wartość różnicy ustawiona jest na Inf
    % aby przy pierwszym przejściu pętli z niej nie wyjść
    while (roznica > przyblizenie && licznik < 100) 
        [f_x, fPrime_x] = metodaHornera(wspolczynniki, x); % wartość wielomianu i jego pochodnej w punkcie x
        nawias = x - f_x/(2*fPrime_x); % wartość nawiasu w mianowniku
        [~, fPrime_nawias] = metodaHornera(wspolczynniki, nawias); %wartość mianownika
        x = x - f_x/fPrime_nawias; % kolejne przybliżenie, jeśli pętla będzie się wykonywac dalej
         roznica = abs(x - poprzednie); % różnica między i-tym a (i-1)-wszym przybliżeniem miejsca zerowego
         poprzednie = x; % przy przejściu do nowej pętli zapisana zostaje wartość poprzedniego przybliżenia
         licznik = licznik +1;
    end
    if licznik == 100 %jeśli liczba iteracji przekoriczy 100 to uznaję, że z tego punktu nie ma zbieżności
        licznik = Inf;
    end