import 'package:flutter/material.dart';
import 'package:unit_converter/util/converter.dart';

class ConversionPage extends StatefulWidget {
  final String category;

  ConversionPage({required this.category});

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  TextEditingController inputController = TextEditingController();
  String convertedValue = '';
  String fromUnit = '';
  String toUnit = '';

  @override
  void initState() {
    super.initState();
    // Initialize units based on category
    fromUnit = _getDefaultFromUnit();
    toUnit = _getDefaultToUnit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert ${widget.category}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input TextField for entering the value to convert from
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter ${widget.category} value',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _convertUnit(value);
              },
            ),
            SizedBox(height: 20),
            // Dropdown for selecting the 'from' unit
            DropdownButton<String>(
              value: fromUnit,
              items: _getUnits().map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  fromUnit = value!;
                  _convertUnit(inputController.text);
                });
              },
            ),
            SizedBox(height: 20),
            // Dropdown for selecting the 'to' unit
            DropdownButton<String>(
              value: toUnit,
              items: _getUnits().map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  toUnit = value!;
                  _convertUnit(inputController.text);
                });
              },
            ),
            SizedBox(height: 20),
            // Disabled TextField for displaying the converted value
            TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Converted Value',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: convertedValue),
            ),
          ],
        ),
      ),
    );
  }

  void _convertUnit(String value) {
    double inputValue = double.tryParse(value) ?? 0;

    setState(() {
      switch (widget.category) {
        case 'Length':
          convertedValue = _convertLength(inputValue).toString();
          break;
        case 'Weight':
          convertedValue = _convertWeight(inputValue).toString();
          break;
        case 'Temperature':
          convertedValue = _convertTemperature(inputValue).toString();
          break;
        case 'Volume':
          convertedValue = _convertVolume(inputValue).toString();
          break;
        case 'Speed':
          convertedValue = _convertSpeed(inputValue).toString();
          break;
        case 'Area':
          convertedValue = _convertArea(inputValue).toString();
          break;
        default:
          convertedValue = '';
      }
    });
  }

  String _convertLength(double value) {
    switch (fromUnit) {
      case 'Meters':
        if (toUnit == 'Kilometers') return metersToKilometers(value).toString();
        if (toUnit == 'Centimeters') return metersToCentimeters(value).toString();
        if (toUnit == 'Inches') return metersToInches(value).toString();
        if (toUnit == 'Feet') return metersToFeet(value).toString();
        break;
      case 'Kilometers':
        if (toUnit == 'Meters') return kilometersToMeters(value).toString();
        if (toUnit == 'Centimeters') return kilometersToCentimeters(value).toString();
        if (toUnit == 'Inches') return kilometersToInches(value).toString();
        if (toUnit == 'Feet') return kilometersToFeet(value).toString();
        break;
      case 'Centimeters':
        if (toUnit == 'Meters') return centimetersToMeters(value).toString();
        if (toUnit == 'Kilometers') return centimetersToKilometers(value).toString();
        if (toUnit == 'Inches') return centimetersToInches(value).toString();
        if (toUnit == 'Feet') return centimetersToFeet(value).toString();
        break;
      case 'Inches':
        if (toUnit == 'Meters') return inchesToMeters(value).toString();
        if (toUnit == 'Kilometers') return inchesToKilometers(value).toString();
        if (toUnit == 'Centimeters') return inchesToCentimeters(value).toString();
        if (toUnit == 'Feet') return inchesToFeet(value).toString();
        break;
      case 'Feet':
        if (toUnit == 'Meters') return feetToMeters(value).toString();
        if (toUnit == 'Kilometers') return feetToKilometers(value).toString();
        if (toUnit == 'Centimeters') return feetToCentimeters(value).toString();
        if (toUnit == 'Inches') return feetToInches(value).toString();
        break;
    }
    return value.toString();
  }

  String _convertWeight(double value) {
    switch (fromUnit) {
      case 'Kilograms':
        if (toUnit == 'Grams') return kilogramsToGrams(value).toString();
        if (toUnit == 'Pounds') return kilogramsToPounds(value).toString();
        break;
      case 'Grams':
        if (toUnit == 'Kilograms') return gramsToKilograms(value).toString();
        if (toUnit == 'Pounds') return gramsToPounds(value).toString();
        break;
      case 'Pounds':
        if (toUnit == 'Kilograms') return poundsToKilograms(value).toString();
        if (toUnit == 'Grams') return poundsToGrams(value).toString();
        break;
    }
    return value.toString();
  }

  String _convertTemperature(double value) {
    switch (fromUnit) {
      case 'Celsius':
        if (toUnit == 'Fahrenheit') return celsiusToFahrenheit(value).toString();
        if (toUnit == 'Kelvin') return celsiusToKelvin(value).toString();
        break;
      case 'Fahrenheit':
        if (toUnit == 'Celsius') return fahrenheitToCelsius(value).toString();
        if (toUnit == 'Kelvin') return fahrenheitToKelvin(value).toString();
        break;
      case 'Kelvin':
        if (toUnit == 'Celsius') return kelvinToCelsius(value).toString();
        if (toUnit == 'Fahrenheit') return kelvinToFahrenheit(value).toString();
        break;
    }
    return value.toString();
  }

  String _convertVolume(double value) {
    switch (fromUnit) {
      case 'Liters':
        if (toUnit == 'Milliliters') return litersToMilliliters(value).toString();
        if (toUnit == 'Gallons') return litersToGallons(value).toString();
        break;
      case 'Milliliters':
        if (toUnit == 'Liters') return millilitersToLiters(value).toString();
        if (toUnit == 'Gallons') return millilitersToGallons(value).toString();
        break;
      case 'Gallons':
        if (toUnit == 'Liters') return gallonsToLiters(value).toString();
        if (toUnit == 'Milliliters') return gallonsToMilliliters(value).toString();
        break;
    }
    return value.toString();
  }

  String _convertSpeed(double value) {
    switch (fromUnit) {
      case 'Kilometers per hour':
        if (toUnit == 'Miles per hour') return kilometersPerHourToMilesPerHour(value).toString();
        if (toUnit == 'Meters per second') return kilometersPerHourToMetersPerSecond(value).toString();
        break;
      case 'Miles per hour':
        if (toUnit == 'Kilometers per hour') return milesPerHourToKilometersPerHour(value).toString();
        if (toUnit == 'Meters per second') return milesPerHourToMetersPerSecond(value).toString();
        break;
      case 'Meters per second':
        if (toUnit == 'Kilometers per hour') return metersPerSecondToKilometersPerHour(value).toString();
        if (toUnit == 'Miles per hour') return metersPerSecondToMilesPerHour(value).toString();
        break;
    }
    return value.toString();
  }

  String _convertArea(double value) {
    switch (fromUnit) {
      case 'Square meters':
        if (toUnit == 'Square kilometers') return squareMetersToSquareKilometers(value).toString();
        if (toUnit == 'Square feet') return squareMetersToSquareFeet(value).toString();
        if (toUnit == 'Acres') return squareMetersToAcres(value).toString();
        break;
      case 'Square kilometers':
        if (toUnit == 'Square meters') return squareKilometersToSquareMeters(value).toString();
        if (toUnit == 'Square feet') return squareKilometersToSquareFeet(value).toString();
        if (toUnit == 'Acres') return squareKilometersToAcres(value).toString();
        break;
      case 'Square feet':
        if (toUnit == 'Square meters') return squareFeetToSquareMeters(value).toString();
        if (toUnit == 'Square kilometers') return squareFeetToSquareKilometers(value).toString();
        if (toUnit == 'Acres') return squareFeetToAcres(value).toString();
        break;
      case 'Acres':
        if (toUnit == 'Square meters') return acresToSquareMeters(value).toString();
        if (toUnit == 'Square kilometers') return acresToSquareKilometers(value).toString();
        if (toUnit == 'Square feet') return acresToSquareFeet(value).toString();
        break;
    }
    return value.toString();
  }

  List<String> _getUnits() {
    switch (widget.category) {
      case 'Length':
        return ['Meters', 'Kilometers', 'Centimeters', 'Inches', 'Feet'];
      case 'Weight':
        return ['Kilograms', 'Grams', 'Pounds'];
      case 'Temperature':
        return ['Celsius', 'Fahrenheit', 'Kelvin'];
      case 'Volume':
        return ['Liters', 'Milliliters', 'Gallons'];
      case 'Speed':
        return ['Kilometers per hour', 'Miles per hour', 'Meters per second'];
      case 'Area':
        return ['Square meters', 'Square kilometers', 'Square feet', 'Acres'];
      default:
        return [];
    }
  }

  String _getDefaultFromUnit() {
    return _getUnits().first;
  }

  String _getDefaultToUnit() {
    return _getUnits().last;
  }
}
