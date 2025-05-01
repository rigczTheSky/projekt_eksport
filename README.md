# ProjektEksport

## Opis

Projekt aplikacji, która po uruchomieniu wyświetla raport wykonanych
eksportów na podstawie tabeli sql. Za pomocą kontrolek
użytkownik może filtrować wyniki według przedziału czasowego 
oraz użytkownika, który eksportował dane. 

## Wymagania

- Delphi XE
- DevExpress VCL (projekt tworzony na wersji 20.2.6)
- UniDAC (wersja 10.4.0)
- MS SQL Server
- połączenie z bazą danych skonfigurowane w projekcie

## Instalacja 

- sklonuj repozytorium
- w katalogu projektu w pliku config.ini nadpisz pola "Server" oraz "Database"
- jeżeli potrzebujesz testowych danych do wypróbowania aplikacji, uruchom 
skrypt "tabela_i_probne_dane" wcześniej nadpisując "nazwa_bazy" 
- skompiluj i uruchom projekt
