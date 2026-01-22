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

![Dashboard Preview](assets/dashboard-preview.png)

### 2. 🔮 The Forecasting Studio (AI Configurator)
The crown jewel of the application. This module allows users to interact directly with the **Random Forest** model.
* **Real-Time Inference:** Users configure a vehicle (Brand, Year, Mileage, Gearbox), and the model calculates the estimated market value instantly.
* **Dynamic Visuals:** The 3D car render adapts its color via CSS filters based on user selection.
* **Market Context:** A gauge chart visualizes where the predicted price sits within the broader price spectrum.

![Forecasting Studio](assets/forecasting-studio-ui.png)

### 3. 🗂️ Inventory Explorer
Transparency is key. The Data Explorer module utilizes the `DT` library to provide a searchable, sortable view of the raw training data. It allows stakeholders to verify model inputs and explore specific car configurations manually.

![Data Table](assets/data-explorer.png)

---

## 🧠 The Science

### 🔍 1. Exploratory Data Analysis (EDA)
We conducted a deep dive into the dataset, revealing critical market trends regarding price distribution and skewness. We applied **Winsorization** to handle extreme outliers in Price and Mileage before modeling.

![Price Distribution](assets/price_dist.png)

### 📈 2. Market Dominance & Brand Positioning
Our analysis highlighted clear market leaders. Toyota dominates the inventory volume, while brands like Mercedes-Benz and Lexus command higher average price points, creating distinct market segments.

![Market Share](assets/market_share.png)

### 🧪 3. Statistical Inference
We moved beyond visualization to statistical proof using R's inference capabilities:
* **T-Tests:** Confirmed a statistically significant price difference between Left-Wheel and Right-Hand drive cars.
* **ANOVA:** Analyzed price variance across transmission types (Automatic vs. Manual vs. Tiptronic).
* **Chi-Square:** Validated the dependency between Gearbox types and Vehicle Categories.

### 🤖 4. Machine Learning Pipeline
* **Algorithm:** Random Forest Regressor (`randomForest` package).
* **Preprocessing:** Log-transformations for skewed features and label encoding for categorical variables.
* **Features:** Year, Mileage, Brand, Fuel, Category, Gearbox, Leather Interior, Turbo status.

---

## 🧬 Simulation Study: "The Digital Twin"
To test the robustness of our data cleaning pipelines, we engineered a synthetic dataset that mirrors the statistical properties of the real world.

* **Generation:** Created 19,237 records using Log-Normal distributions for Price and Exponential distributions for Mileage.
* **Controlled Chaos:** We intentionally injected specific error modes to test cleaning logic:
    * **5%** Missing Numeric Data (MCAR).
    * **2%** Typos in Categorical variables (e.g., "Toyota_typo").
    * **2%** Extreme Numeric Outliers.
* **Outcome:** The cleaning pipeline successfully recovered the original distribution properties from the corrupted synthetic data.

---

## 📂 Repository Structure

The project is organized into a modular structure to separate the **production application** from the **exploratory analysis**.

```text
onyx-auto-analytics/
│
├── 📂 app/                     # 🚀 The Production Dashboard
│   └── app.R                   #    Main Shiny application source code (UI & Server)
│
├── 📂 analysis/                # 🧠 Data Science & Research
│   ├── 01_eda_and_model.qmd    #    Full EDA, Hypothesis Testing & Random Forest Training
│   └── 02_simulation.qmd       #    Synthetic Data Study & Cleaning Pipeline Validation
│
├── 📂 scripts/                 # 🛠️ Utilities & Helpers
│   └── generate_simulation.R   #    Raw R script for generating the synthetic dataset
│
├── 📂 assets/                  # 📸 Project Documentation
│   ├── dashboard-preview.png   #    Home screen screenshot
│   ├── forecasting-studio.png  #    AI Configurator screenshot
│   ├── data-explorer.png       #    Data Table screenshot
│   ├── price-dist.png          #    EDA Plot screenshot
│   └── market-share.png        #    Market Analytics screenshot
│
└── 📜 README.md                # 📖 Project Documentation & Setup Guide
