package cars

const hourMinutes = 60

const singleCarCost = 10_000

const (
	carBatchCarsCount = 10
	carBatchCost      = 95_000
)

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * (successRate / 100)
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate) / hourMinutes)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	carBatches := carsCount / carBatchCarsCount

	remainingCars := carsCount % carBatchCarsCount

	return uint(carBatches*carBatchCost + remainingCars*singleCarCost)
}
