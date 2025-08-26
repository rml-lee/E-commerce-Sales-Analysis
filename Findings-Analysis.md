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

## 6. What is the profit margin for each city?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/Map?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

![Map](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/assets/160198611/ddececed-14ff-40b0-9b0d-e9797c33047b)

**Findings:**

- **Arizona, California, Colorado, Florida, Illinois, Massachusetts, North Carolina, Ohio, Oregon, Pennsylvania, Tennessee, Texas, and Maryland** all have locations that aren’t generating a profit. This tends to be the case consistently year over year.

**Recommendations:** 

- Examine the shipping and logistics costs to these cities. The longer the distance from the fulfillment centers, the more expensive the delivery becomes, affecting margin.

- Customers in these cities may be consistently placing small, low-value orders. Look into Average Order Value of these cities.

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
