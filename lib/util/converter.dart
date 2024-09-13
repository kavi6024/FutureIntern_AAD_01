final List<String> categories = ['Length', 'Weight', 'Temperature', 'Volume', 'Speed', 'Area'];

double metersToKilometers(double meters) => meters / 1000;
double kilometersToMeters(double kilometers) => kilometers * 1000;

double metersToCentimeters(double meters) => meters * 100;
double centimetersToMeters(double centimeters) => centimeters / 100;

double metersToInches(double meters) => meters * 39.3701;
double metersToFeet(double meters) => meters * 3.28084;

double kilometersToCentimeters(double kilometers) => kilometers * 100000;
double kilometersToInches(double kilometers) => kilometers * 39370.1;
double kilometersToFeet(double kilometers) => kilometers * 3280.84;

double centimetersToKilometers(double centimeters) => centimeters / 100000;
double centimetersToInches(double centimeters) => centimeters / 2.54;
double centimetersToFeet(double centimeters) => centimeters / 30.48;

double inchesToMeters(double inches) => inches / 39.3701;
double inchesToKilometers(double inches) => inches * 0.0000254;
double inchesToCentimeters(double inches) => inches * 2.54;

double feetToMeters(double feet) => feet / 3.28084;
double feetToKilometers(double feet) => feet * 0.0003048;
double feetToCentimeters(double feet) => feet * 30.48;

// Conversion for Weight units
double kilogramsToGrams(double kilograms) => kilograms * 1000;
double gramsToKilograms(double grams) => grams / 1000;

double gramsToPounds(double grams) => grams * 0.00220462;
double poundsToGrams(double pounds) => pounds * 453.592;

double poundsToKilograms(double pounds) => pounds / 2.20462;
double kilogramsToPounds(double kilograms) => kilograms * 2.20462;

// Conversion for Temperature units
double celsiusToFahrenheit(double celsius) => (celsius * 9 / 5) + 32;
double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

double celsiusToKelvin(double celsius) => celsius + 273.15;
double kelvinToCelsius(double kelvin) => kelvin - 273.15;

double fahrenheitToKelvin(double fahrenheit) => (fahrenheit - 32) * 5 / 9 + 273.15;
double kelvinToFahrenheit(double kelvin) => (kelvin - 273.15) * 9 / 5 + 32;

// Conversion for Volume units
double litersToMilliliters(double liters) => liters * 1000;
double millilitersToLiters(double milliliters) => milliliters / 1000;

double millilitersToGallons(double milliliters) => milliliters * 0.000264172;
double gallonsToMilliliters(double gallons) => gallons * 3785.41;

double litersToGallons(double liters) => liters / 3.78541;
double gallonsToLiters(double gallons) => gallons * 3.78541;

// Conversion for Speed units
double kilometersPerHourToMilesPerHour(double kmph) => kmph / 1.60934;
double milesPerHourToKilometersPerHour(double mph) => mph * 1.60934;

double metersPerSecondToKilometersPerHour(double mps) => mps * 3.6;
double kilometersPerHourToMetersPerSecond(double kmph) => kmph / 3.6;

double milesPerHourToMetersPerSecond(double mph) => mph * 0.44704;
double metersPerSecondToMilesPerHour(double mps) => mps * 2.23694;

// Conversion for Area units
double squareMetersToSquareKilometers(double squareMeters) => squareMeters / 1e6;
double squareKilometersToSquareMeters(double squareKilometers) => squareKilometers * 1e6;

double squareFeetToSquareMeters(double squareFeet) => squareFeet / 10.7639;
double squareMetersToSquareFeet(double squareMeters) => squareMeters * 10.7639;

double squareKilometersToSquareFeet(double squareKilometers) => squareKilometers * 1.07639e7;
double squareKilometersToAcres(double squareKilometers) => squareKilometers * 247.105;

double squareFeetToSquareKilometers(double squareFeet) => squareFeet * 9.2903e-8;
double squareFeetToAcres(double squareFeet) => squareFeet / 43560;

double acresToSquareMeters(double acres) => acres * 4046.86;
double squareMetersToAcres(double squareMeters) => squareMeters / 4046.86;

double acresToSquareKilometers(double acres) => acres * 0.00404686;
double acresToSquareFeet(double acres) => acres * 43560;

double inchesToFeet(double inches) => inches / 12;
double feetToInches(double feet) => feet * 12;