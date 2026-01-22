# 💎 Onyx Auto Analytics
### *Precision Pricing & Market Intelligence Engine*

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Shiny](https://img.shields.io/badge/Shiny-0075b0?style=for-the-badge&logo=r&logoColor=white)
![Plotly](https://img.shields.io/badge/Plotly-3F4F75?style=for-the-badge&logo=plotly&logoColor=white)
![Status](https://img.shields.io/badge/Status-Production-success?style=for-the-badge)

---

## 📖 Executive Summary
**Onyx Auto Analytics** is an end-to-end data science ecosystem designed to analyze, visualize, and predict vehicle market values. Built on a dataset of **19,000+ automotive records**, this project bridges the gap between raw data and actionable intelligence.

The platform consists of three core pillars:
1.  **Statistical Inference:** Rigorous hypothesis testing to understand price determinants.
2.  **Machine Learning:** A Random Forest regressor for high-accuracy price estimation.
3.  **The Onyx Dashboard:** A production-grade `bs4Dash` application featuring a real-time AI Configurator and 3D visualization elements.

---

## 🖥️ The Interface (Onyx Dashboard)

### 1. 📊 Mission Control
The home dashboard provides an immediate pulse on the market, tracking KPIs like Total Volume, Average Levy, and Stock Levels. It visualizes the right-skewed nature of the market, identifying the dominance of budget-friendly vehicles versus luxury outliers.

![Dashboard Preview](assets/dashboard-preview.png.png)

### 2. 🔮 The Forecasting Studio (AI Configurator)
The crown jewel of the application. This module allows users to interact directly with the **Random Forest** model.
* **Real-Time Inference:** Users configure a vehicle (Brand, Year, Mileage, Gearbox), and the model calculates the estimated market value instantly.
* **Dynamic Visuals:** The 3D car render adapts its color via CSS filters based on user selection.
* **Market Context:** A gauge chart visualizes where the predicted price sits within the broader price spectrum.

![Forecasting Studio](assets/forecasting-studio-ui.png.png)

### 3. 🗂️ Inventory Explorer
Transparency is key. The Data Explorer module utilizes the `DT` library to provide a searchable, sortable view of the raw training data. It allows stakeholders to verify model inputs and explore specific car configurations manually.

![Data Table](assets/data-explorer.png.png)

---

## 🧠 The Science

### 🔍 1. Exploratory Data Analysis (EDA)
We conducted a deep dive into the dataset (`analysis/01_car_price_analysis.qmd`), revealing critical market trends:
* [cite_start]**Market Leaders:** Toyota dominates the inventory, followed by Hyundai and Mercedes-Benz[cite: 15].
* **Price Skewness:** The dataset is heavily right-skewed. [cite_start]We applied **Winsorization** to handle extreme outliers in Price and Mileage before modeling[cite: 12].
* [cite_start]**Fuel Trends:** Petrol is the dominant fuel type, though Hybrids show a strong presence in the mid-market segment[cite: 27].

![Price Distribution](assets/price_dist.png.png)
![Price Distribution](assets/price_dist2.png.png)

### 🧪 2. Statistical Inference
We moved beyond visualization to statistical proof using R's inference capabilities:
* [cite_start]**T-Tests:** Confirmed a statistically significant price difference between Left-Wheel and Right-Hand drive cars[cite: 126].
* [cite_start]**ANOVA:** Analyzed price variance across transmission types (Automatic vs. Manual vs. Tiptronic)[cite: 131].
* [cite_start]**Chi-Square:** Validated the dependency between Gearbox types and Vehicle Categories[cite: 130].

### 🤖 3. Machine Learning Pipeline
* **Algorithm:** Random Forest Regressor (`randomForest` package).
* [cite_start]**Preprocessing:** Log-transformations for skewed features and label encoding for categorical variables[cite: 104, 157].
* **Features:** Year, Mileage, Brand, Fuel, Category, Gearbox, Leather Interior, Turbo status.
* [cite_start]**Validation:** The model was evaluated using an 80/20 train-test split to ensure generalizability[cite: 135].

---

## 🧬 Simulation Study: "The Digital Twin"
To test the robustness of our data cleaning pipelines, we engineered a synthetic dataset (`analysis/02_simulation_study.qmd`) that mirrors the statistical properties of the real world.

* [cite_start]**Generation:** Created $n=19,237$ records using Log-Normal distributions for Price and Exponential distributions for Mileage[cite: 136].
* **Controlled Chaos:** We intentionally injected specific error modes to test cleaning logic:
    * [cite_start]**5%** Missing Numeric Data (MCAR)[cite: 140].
    * [cite_start]**2%** Typos in Categorical variables (e.g., "Toyota_typo")[cite: 140].
    * [cite_start]**2%** Extreme Numeric Outliers[cite: 140].
* **Outcome:** The cleaning pipeline successfully recovered the original distribution properties from the corrupted synthetic data.

---

## 🛠️ Tech Stack & Architecture

| Component | Technology | Description |
| :--- | :--- | :--- |
| **Core** | R 4.3+ | Primary language for analysis and app logic. |
| **UI Framework** | `shiny`, `bs4Dash` | Professional Bootstrap 4 dashboard framework. |
| **Data Wrangling** | `tidyverse`, `janitor` | ETL pipelines and cleaning. |
| **Visualization** | `ggplot2`, `plotly` | Static and interactive charts. |
| **Modeling** | `randomForest` | Predictive modeling engine. |
| **Tables** | `DT` | Interactive data tables. |

---

## 📂 Repository Structure

```text
onyx-auto-analytics/
│
├── app/
│   └── app.R                  # The Production Shiny Application
│
├── analysis/
│   ├── 01_eda_and_model.qmd   # Main Analysis, Hypothesis Testing & ML
│   └── 02_simulation.qmd      # Synthetic Data Study
│
├── scripts/
│   └── generate_simulation.R  # Raw script for data generation
│
├── assets/                    # Project Screenshots & Visuals
│   ├── dashboard-preview.png
│   ├── forecasting-studio-ui.png
│   └── ...
│
└── README.md                  # Project Documentation
