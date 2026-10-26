
# Plot 2: Global Active Power over Time

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
png("plot2.png", width = 480, height = 480)

plot(
  datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()
