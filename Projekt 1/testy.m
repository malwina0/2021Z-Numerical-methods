% przykłady działania zaimplementowanej metody Jarratta
format long

% Przykład 1
% wielomian stopnia 0
% w(z) = 0 dla 10 iterowań, z punktem początkowym z_0 = 8
metodaJarrattaWynik(0, 10, 8)
metodaJarrattaIleIteracji(0, 8, 0.01)
wizualizacja(0, -10, 10, 20, -10, 10, 20, 0.01)

% Przykład 2
% wielomian stopnia 0
% w(z) = 8 dla 5 iterowań, z punktem początkowym z_0 = -5
metodaJarrattaWynik(8, 5, -5)
metodaJarrattaIleIteracji(8, -5, 0.01)
wizualizacja(8, -10, 10, 20, -10, 10, 20, 0.01)
% Przykład 3
% wielomian stopnia 1
% w(z) = 2x-15 dla 3 iterowań, z punktem początkowym z_0 = 10
p3J = metodaJarrattaWynik([2, -15], 3, 10);
p3R = roots([2, -15]);
p3diff = abs(p3R - p3J);
p3Ile = metodaJarrattaIleIteracji([2, -15], 10, 0.01);
wizualizacja([2, -15], -10, 10, 20, -10, 10, 20, 0.01);
% Przykład 4 
% wielomian stopnia 2, 2 pierwiastki rzeczywiste
% w(z) = x^2 + x - 6 dla 5 iterowań, z punktem początkowym z_0 = 20
p4J = metodaJarrattaWynik([1, 1, -6], 5, 20);
p4R = roots([1, 1, -6]);
p4Ile = metodaJarrattaIleIteracji([1, 1, -6], 20, 0.005);
wizualizacja([1, 1, -6], -10, 10, 20, -10, 10, 20, 0.005);
% Przykład 5 
% wielomian stopnia 2, 1 pierwiastek rzeczywisty
% w(z) = 9x^2 -36x + 36 dla 8 iterowań, z punktem początkowym z_0 = -16
p5J = metodaJarrattaWynik([9, -36, 36], 8, -16)
p5R = roots([9, -36, 36])
p5diff = abs(p5R(1:1) - p5J)
p5Ile = metodaJarrattaIleIteracji([9, -36, 36], -16, 0.00001)
wizualizacja([9, -36, 36], -30, 30, 60, -10, 10, 20, 0.00001)
% Przykład 6 
% wielomian stopnia 2, brak pierwiastków rzeczywistych
% w(z) = 64x^2 - 28x + 652 dla 20 iterowań, z punktem początkowym z_0 = 1
p6J = metodaJarrattaWynik([64, -28, 652], 20, 1)
p6R = roots([64, -28, 652])
p6Ile = metodaJarrattaIleIteracji([64, -28, 652], 1, 0.008)
wizualizacja([64, -28, 652], -10, 40, 60, -20, 10, 31, 0.008)
p6J2 = metodaJarrattaWynik([64, -28, 652], 20, 2+3i)
p6Ile2 = metodaJarrattaIleIteracji([64, -28, 652], 2+3i, 0.001)
p6diff = abs(p6R(1,1) - p6J2)

% Przykład 7 
% wielomian stopnia 4
% w(z) = 87x^4 + 2x^3 - 10x^2 - x + 14 dla 12 iterowań, z punktem
% początkowym z_0 = -40
p7J = metodaJarrattaWynik([87, 2, -10, -1, 14], 12, -40)
p7R = roots([87, 2, -10, -1, 14])
p7J2 = metodaJarrattaWynik([87, 2, -10, -1, 14], 12, 13-4i)
p7diff = abs(p6R(1:1) - p6J2)
p7Ile = metodaJarrattaIleIteracji([87, 2, -10, -1, 14], 13-4i, 0.001)
wizualizacja([87, 2, -10, -1, 14], -30, 30, 100, -20, 20, 123, 0.01)


% Przykład 8 
% wielomian stopnia 6
% w(z) = 12x^6 + 11x^5 - 358x^4 - 840x^3 - 48x^2 +96x + 1152 dla 7 iterowań, z punktem
% początkowym z_0 = 34
p8J = metodaJarrattaWynik([12, 11, -358, -840, -48, 96, 1152], 5, 34)
p8R = roots([12, 11, -358, -840, -48, 96, 1152])
p8J2 = metodaJarrattaWynik([12, 11, -358, -840, -48, 96, 1152], 12, 13-4i)
p8diff = abs(p6R(1:1) - p6J2)
p8Ile = metodaJarrattaIleIteracji([12, 11, -358, -840, -48, 96, 1152], 34, 0.01)
wizualizacja([12, 11, -358, -840, -48, 96, 1152], -30, 30, 500, -20, 20, 287, 0.001)


% przykład 9
% w(z) = 381x^9 - 8x^8 + 128x^7 + 5x^6 + 4x^5 + 8x^4 + 9x^3 + 1x^2 + 13x + 25
% dla 8 iterowań, z punktem początkowym 16+2i
p9J = metodaJarrattaWynik([381, -8, 128, 5, 4, 8, 9, 1, 13, 25], 8, 16+2i)
p9R = roots([381, -8, 128, 5, 4, 8, 9, 1, 13, 25])
p9Ile = metodaJarrattaIleIteracji([381, -8, 128, 5, 4, 8, 9, 1, 13, 25], 16+2i, 0.001)
wizualizacja([381, -8, 128, 5, 4, 8, 9, 1, 13, 25], -30, 30, 500, -20, 20, 287, 0.001)

% przykład 10
% w(z) = -56x^13 + 333x^12 + 147x^11 + 999x^10 - 12x^9 + 32x^7 + 97x^6 + 5x^5 + 6x^4 + 1x^2 + 3x + 51
% dla 13 iterowań, z punktem początkowym 12+6i
p10J = metodaJarrattaWynik([-56, 333, 147, 999, -12, 0, 32, 97, 5, 6, 0, 1, 3,  51], 13, 12+6i)
p10R = roots([-56, 333, 147, 999, -12, 0, 32, 97, 5, 6, 0, 1, 3,  51])
p10Ile = metodaJarrattaIleIteracji([-56, 333, 147, 999, -12, 0, 32, 97, 5, 6, 0, 1, 3,  51], 12+6i, 0.001)
wizualizacja([-56, 333, 147, 999, -12, 0, 32, 97, 5, 6, 0, 1, 3,  51], -30, 30, 900, -30, 30, 900, 0.001)
