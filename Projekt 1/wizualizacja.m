function obrazek = wizualizacja(wspolczynniki, a, b, n, c, d, m, dokladnosc) 

    
    %siatka punktów początkowych, dla których będę badać zbieżność:
    x = linspace(a, b, n); % n wartości na osi liczb rzeczywistych, rozłożonych równo na przedziale [a, b]
    y = linspace(c, d, m); % m wartości na osi liczb zespolonych, rozłożonych równo na przedziale [c, d]
    [X,Y] = meshgrid(x, y); % X to macierz, w której każdy wiersz jest kopią x, 
    % a Y, w której każda kolumna jest kopią y
    points = [X(:), Y(:)]; % tworzy macierz, w której w pierwszej kolumnie są wartości na osi rzeczywistej,
    % a w drugiej na zespolonej, każdy wiersz reprezentuje jakiś punkt początkowy
    poczatkowePunkty = complex(points(:, 1), points(:, 2)); % wektor tych punktów jako liczb zepolonych
    A = zeros(m, n); % macierz zer o m wierszach i n kolumnach 
    for iterator = 1:length(poczatkowePunkty) % iteruję po kolejnych punktach 
        if mod(iterator, m) == 0 %jeśli element znajduje się w pierwszym wierszu
            indeksWiersza = 1; % obliczam na jakim miejscu w macierzy będzie trzeba wstawić wartość
            indeksKolumny = fix(iterator/m);
        else  
            indeksWiersza = m-mod(iterator, m)+1;
            indeksKolumny = fix(iterator/m)+1;
        end
        if metodaJarrattaIleIteracji(wspolczynniki, poczatkowePunkty(iterator), 0.001) > 30 %jeśli po 30 iteracjach 
            % nie będzie spełniony warunek stopu to pole będzie pokolorowane na
            % maksymalną wartość
            A(indeksWiersza, indeksKolumny) = Inf;
        else
            % jeśli warunek stopu będzie szybciej niż w 30 iteracji to tę
            % liczbę iteracji wpisuję w odpowiednią komórkę macierzy
            A(indeksWiersza, indeksKolumny) = metodaJarrattaIleIteracji(wspolczynniki, poczatkowePunkty(iterator), dokladnosc);
        end
    end
    colormap(flipud(hot)); %zmiana kolorowania, flipud odwraca oś kolorowania
    obrazek = imagesc(x, flip(y), A); % wyświetla szybkość zbieżności dla wybranych punktów
    % z osiami podpisanynmi wartościami na osi rzeczywistej (poziomej) i
    % zespolonej (pionowej)
    colorbar %wyświetla pasek legendy
