<h1 align="center">Findings & Analysis</h1>



<p align="center">Note: Click the Tableau link above a chart to view a detailed, interactive version.</p> 

## 5. What is the monthly gross margin percentage in 2016 for each category?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/LineGraph?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<img width="3858" height="2414" alt="Line Graph" src="https://github.com/user-attachments/assets/609280c8-3566-46c7-bad1-483205eb4469" />


**Note**: Because this dataset does not include unit cost or expense details, gross margin analysis is an approximation only.

**Findings:**

- **Furniture**: This department has the **most consistently poor performance**, recording a negative gross margin percentage four times throughout the year.

- **Office Supplies**: At the start of the second quarter, office supplies experienced the largest negative gross margin of the year but managed to recover significantly during the latter half of the year.

- **Technology**: This department has performed the best consistently reaching almost a 40% high in gross margin during October.

**Recommendations:**

- **Option 1**: Re-evaluate pricing strategies for the Furniture department. Increase prices to better reflect the cost of goods sold and market value.
  
- **Option 2**: Analyze and control the cost of goods sold by negotiating better terms with suppliers, finding alternative suppliers, or bulk purchasing. Improve operational efficiency by optimizing production processes, reducing waste, and implementing lean manufacturing practices.

---

## 6. What is the profit margin for each state? Are any states incurring a profit loss?

Tableau - [Link](https://public.tableau.com/shared/SK8KNPF9H?:display_count=n&:origin=viz_share_link)


<img width="4974" height="2414" alt="Map" src="https://github.com/user-attachments/assets/8167d8fc-ee41-4dca-8204-44fc37498817" />



**Findings:**

- **Arizona, Colorado, Florida, Illinois, North Carolina, Ohio, Oregon, Pennsylvania, Tennessee, and Texas** are incuring a profit loss. This tends to be the case consistently year over year.

**Recommendations:** 

- Examine shipping and logistics costs. The longer the distance from the fulfillment centers, the more expensive the delivery becomes, affecting margin.

- Investigate the effect discounts are having in these states. We are probably running promotions that are too aggressive for the underlying economics of those states.

---

## 6.2 - Diagnostic Analysis (Root Cause): Let's compare the profit margin to the average discount rate in each state. Do our promotion strategies significantly contribute to losses in low-performing states?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/ScatterPlot2?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<img width="4972" height="2368" alt="Scatter Plot 2" src="https://github.com/user-attachments/assets/63c8fd24-99d3-409e-99a5-2c1623c7f02e" />


**Findings:**

- Yes, the data shows a strong correlation between higher discount rates and negative profit margins, indicating that **discounts are a contributor to profit loss**. This relationship is clear when comparing states: those with low discount rates tend to be profitable, while those with high discount rates are consistently unprofitable.

- Despite this, discount rates were actually lower in problem states in 2016, yet those states were still unprofitable. This indicates that while discounts exacerbate the problem, they are not the root cause. Reducing them lessens the loss but does not eliminate it.

**Recommendations:** 

- Investigate the value of orders per state. Orders with low sales value cannot absorb the fixed costs of fulfillment (e.g., picking, packing, shipping), leading to thin or negative margins, even without discounts.

---

## 6.3 - Diagnostic Analysis (Root Cause): Let's compare the profit margin to the average order value. Are our pricing strategies and order structure contributing to profitability issues?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/ScatterPlot3?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<img width="4972" height="2320" alt="Scatter Plot 3" src="https://github.com/user-attachments/assets/defcd02a-83b9-4f0a-80e9-5b972d652ac4" />


**Findings:**


**Recommendations:** 



---
## 6.4 Diagnostic Analysis (Root Cause): Let's compare the profit margin to the costs per order in each state. Are our fulfillment and shipping costs the primary driver of profitability issues in low-performing states?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/BarChart?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

<img width="4972" height="2320" alt="Bar Chart" src="https://github.com/user-attachments/assets/78d9a9a2-662f-4d6c-925d-9165cf92239a" />



**Findings:**


**Recommendations:** 


---

## 7. What is the correlation between profit and sales? Are we incurring a loss on our best-selling products?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/ScatterPlot?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

![Scatter Plot](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/assets/160198611/3660d849-e704-4ce1-be25-8f870b1a4fb2)

**Findings:**

- The products incurring the largest losses year-over-year are predominantly from the **Technology** and **Office Supplies** departments.

- Specifically, printers within the **Technology** department show the most consistent year-over-year profitability declines. Key examples include:

  - **Cubify CubeX 3D Printer (Double Head Print)**
  - **Cubify CubeX 3D Printer (Triple Head Print)**
  - **Lexmark MX611dhe Monochrome Laser Printer**

**Recommendations:**

Note: Due to the high volume of products, please refer to the Tableau link above for details on specific products experiencing profit losses and their respective regions.

- **High Priority**: Investigate product returns and overhead costs for the listed printers, and monitor these metrics across the broader **Technology** and **Office Supplies** departments.
