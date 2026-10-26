
# Plot 4: Four-panel household power plot

# Read the household power data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Keep only February 1 and 2, 2007
data <- data[
  data$Date %in% c("1/2/2007", "2/2/2007"),
]

# Create date-time values
datetime <- strptime(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Create the PNG plot
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Panel 1: Global active power
plot(
  datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Panel 2: Voltage
plot(
  datetime,
  data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# Panel 3: Energy sub-metering
plot(
  datetime,
  data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

# Panel 4: Global reactive power
plot(
  datetime,
  data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global Reactive Power"
)

dev.off()

