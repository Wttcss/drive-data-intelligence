# simulation##

set.seed(123)
n <- 18924  # same as your real dataset

# Simulate numeric columns (skewed)
sim_numeric <- data.frame(
  Price = round(rlnorm(n, meanlog = 9.5, sdlog = 0.6), 0),
  Levy = round(rlnorm(n, meanlog = 6, sdlog = 0.8), 0),
  Engine_volume = round(rlnorm(n, meanlog = 0.5, sdlog = 0.3) + 1, 1),
  Mileage = round(rexp(n, rate = 1/100000)),
  Cylinders = sample(3:8, n, replace = TRUE),
  Airbags = sample(2:12, n, replace = TRUE),
  Prod_year = sample(1995:2023, n, replace = TRUE)
)

# Simulate categorical columns
sim_cat <- data.frame(
  Manufacturer = sample(c("TOYOTA","HONDA","FORD","HYUNDAI","LEXUS","CHEVROLET","OPEL","MERCEDES-BENZ"), n, replace = TRUE),
  Model = sample(c("Prius","Camry","CHR","RX 450","RX 350","E 220","Vectra","Elantra","Transit","Santa FE"), n, replace = TRUE),
  Category = sample(c("Sedan","Hatchback","Jeep","Goods wagon","Microbus"), n, replace = TRUE),
  Leather_interior = sample(c("Yes","No"), n, replace = TRUE, prob = c(0.4,0.6)),
  Fuel_type = sample(c("Petrol","Diesel","Hybrid","CNG","Plug-in Hybrid"), n, replace = TRUE),
  Gear_box_type = sample(c("Automatic","Manual","Tiptronic","Variator"), n, replace = TRUE),
  Drive_wheels = sample(c("4x4","Front","Rear"), n, replace = TRUE),
  Doors = sample(c("2-Mar","4-May"), n, replace = TRUE),
  Wheel = sample(c("Left wheel","Right-hand drive"), n, replace = TRUE),
  Color = sample(c("White","Black","Silver","Blue","Grey","Green"), n, replace = TRUE),
  turbo = sample(c("Yes","No"), n, replace = TRUE, prob = c(0.1,0.9))
)

# Combine numeric and categorical
sim_data <- cbind(sim_numeric, sim_cat)

################################################################################
set.seed(123)

# ---- Parameters ----
na_frac_numeric <- 0.05   # 5% missing for numeric
na_frac_cat <- 0.1        # 10% missing for categorical
outlier_frac <- 0.02      # 2% outliers for numeric
typo_frac <- 0.02         # 2% typos for categorical
dup_frac <- 0.005         # 0.5% duplicate rows

# ---- Identify numeric and categorical columns ----
numeric_cols <- names(sim_data)[sapply(sim_data, is.numeric)]
cat_cols <- names(sim_data)[sapply(sim_data, function(x) is.character(x) | is.factor(x))]

# ---- Introduce missing values ----
sim_data[numeric_cols] <- lapply(sim_data[numeric_cols], function(x){
  x[sample(length(x), floor(length(x) * na_frac_numeric))] <- NA
  x
})
sim_data[cat_cols] <- lapply(sim_data[cat_cols], function(x){
  x[sample(length(x), floor(length(x) * na_frac_cat))] <- NA
  x
})

# ---- Introduce numeric outliers ----
sim_data[numeric_cols] <- lapply(sim_data[numeric_cols], function(x){
  idx <- sample(length(x), floor(length(x) * outlier_frac))
  x[idx] <- x[idx] * runif(length(idx), 2, 10)
  x
})

# ---- Introduce categorical inconsistencies (typos) ----
sim_data[cat_cols] <- lapply(sim_data[cat_cols], function(x){
  idx <- sample(length(x), floor(length(x) * typo_frac))
  x[idx] <- paste0(x[idx], sample(c("", " ", "_typo"), 1))
  x
})

# ---- Add duplicate rows ----
dup_rows <- sim_data[sample(1:nrow(sim_data), size = floor(nrow(sim_data) * dup_frac)), ]
sim_data <- rbind(sim_data, dup_rows)

# ---- Preview ----
head(sim_data)
summary(sim_data)
