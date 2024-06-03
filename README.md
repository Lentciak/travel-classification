# Klasyfikacja ogólnych ocen przejazdów

## Cel badania

Celem badania jest zbudowanie optymalnego modelu klasyfikacyjnego do określenia ogólnej oceny przejazdu przez pasażera.


## Opis zbioru danych

Pod uwagę wziąłem zmienne ilościowe `speed`, `distance` i `time` oraz zmienne nominalne `rating_bus`, `rating_weather` i `car_or_bus`. Zmienną objaśnianą było `rating`. Dwie zmienne nominalne były w dużej części wybrakowane, co stanowiło duży problem. 

## Przeprowadzenie badania

Zastosowałem imputację danych, która poprawiła wyniki względem pierwotnego modelu lasu losowego.

Oprócz niego pod uwagę wziąłem modele lasu boostingu, baggingu, wektorów nośnych oraz regularyzowanej analizy dyskryminacyjnej.

## Wnioski

Ostatecznie najlepiej dopasował się model RDA, ale inne wyniki były zbliżone. Dodatkowo proporcje zbioru testowego nie są równe względem klas, więc wyniki nie są stabilne i mogą się zmienić.
