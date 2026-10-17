# Health Communication Research: Processing of FOP Nutrition Labels & Interventions
Have you ever walked down a supermarket aisle, picked up an energy bar boasting a "High in Protein" claim, only to notice a bright red Nutri-Score 'E' right next to it?

This exact scenario, where nutrition claims conflict with objective Nutri-Score, leaves consumers overwhelmed and confused. How do people process this inconsistent nutritional information when making choices? What factors influence this behavior, and what interventions can empower them to make healthier decisions?

To answer these questions, this repository contains the complete quantitative analysis pipeline and reproducible R scripts for my Master of Science thesis: *"The Effect of Front-of-Pack Nutrition Label Congruency on Purchase Intentions: The Moderating Roles of Nutrition Literacy and a Nutri-Score Intervention Message"* at the University of Amsterdam.
<p align="center">
  <img src="https://github.com/user-attachments/assets/9ecceae6-e772-4105-8806-eef5de4bda0b" width="60%" />
</p>

## Experimental Design
A 2 (label congruency: incongruent vs. congruent) × 2 (nutrition literacy: low vs. high) × 2 (Nutri-Score intervention message: absent vs. present) between-subjects online experiment was conducted among 220 Dutch consumers, using an energy bar as the product stimulus. Based on the findings, this research proposes specific health intervention strategies tailored to diverse stakeholders, including policymakers, public health organizations, and food manufacturers.

<p>
  <img align="left" src="https://github.com/user-attachments/assets/0ab21cb5-34f5-4cd4-af15-8c219b68b8d7" width="48%" />
  <img src="https://github.com/user-attachments/assets/6a067693-9f57-4e07-812d-529dd4b029f2" width="36%" />
  <br><br>
  <img src="https://github.com/user-attachments/assets/25c710f6-30cd-42bd-a59b-5965b5518296" width="36%" />
</p>
<br clear="all" />

## Key findings & Visualizations


<p align="center">
  <img src="https://github.com/user-attachments/assets/72f6a1db-d2bd-4917-80dd-0b0007cd2352" width="55%" alt="Interaction Plot for Mean Purchase Intentions" />
</p>

## Tech Stack & Methodology

*   **Programming & Analysis:** 
    ![R](https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white) 
    ![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=flat-square&logo=RStudio&logoColor=white)
    ![SPSS](https://img.shields.io/badge/IBM_SPSS_v30-052FAD?style=flat-square&logo=ibm&logoColor=white)
*   **Core Packages:** 
*   **Methodology:** 2x2x2 Between-subjects Experimental Design, Moderation Analysis, Survey Design (Qualtrics)

## Repository Structure

```text
├── data/
│   ├── raw_data.csv          # Raw dataset exported from Qualtrics (anonymized)
│   └── cleaned_data.csv      # Processed dataset ready for analysis
├── scripts/
│   ├── 01_data_cleaning.R    # Data wrangling, reverse coding, and attention checks
│   ├── 02_descriptives.R     # Demographic stats and assumption testing
│   └── 03_anova_moderation.R # Main 2x2x2 ANOVA and simple slopes analysis
├── output/
│   └── interaction_plot.png  # High-res ggplot2 visualizations
└── README.md
```

## Code

The scripts in the `scripts` folder are structured modularly to represent the complete quantitative data analysis pipeline for this 2x2x2 experiment. All files are thoroughly commented to ensure full reproducibility and adherence to Open Science standards.
