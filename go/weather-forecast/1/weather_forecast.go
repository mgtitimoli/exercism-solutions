// Package weather provides tools to forecast the current weather condition of
// various cities in Goblinocus.
package weather

var (
	// CurrentCondition holds the current conditions for a specific location.
	CurrentCondition string
	// CurrentLocation holds the name of the currently forecasted city.
	CurrentLocation string
)

// Forecast function forecasts the weather conditions for a specific location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
