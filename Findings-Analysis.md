# Findings & Analysis

## 5. What is the monthly gross margin percentage in 2016 for each category?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/LineGraph?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

![Line Graph](https://github.com/rml-lee/E-commerce-Sales-Analysis/assets/160198611/0788d32a-3593-4184-9a93-4e6038f7cbf5)


- **Furniture**: This department has earned a negative gross margin percentage four times throughout 2016. This is likely due to the pricing strategies implemented within this department.

- **Office Supplies**: At the start of the second quarter, office supplies experienced the largest negative gross margin of the year but managed to recover significantly during the latter half of the year.

- **Technology**: This department has performed the best consistently reaching almost a 40% high in gross margin during October.

- **Recommendations**:

- **Option 1**: Re-evaluate pricing strategies for the Furniture department. Increase prices to better reflect the cost of goods sold and market value. 
- **Option 2**: Analyze and control the cost of goods sold by negotiating better terms with suppliers, finding alternative suppliers, or bulk purchasing. Improve operational efficiency by optimizing production processes, reducing waste, and implementing lean manufacturing practices.


## 6. What is the profit margin for each city?

Tableau - [Link](https://public.tableau.com/views/Workbook4_SuperStoreProject/Map?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

![Map](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/assets/160198611/ddececed-14ff-40b0-9b0d-e9797c33047b)

- **Arizona, California, Colorado, Florida, Illinois, Massachusetts, North Carolina, Ohio, Oregon, Pennsylvania, Tennessee, Texas, and Maryland** all have locations that aren’t generating a profit. This tends to be the case consistently year over year.

- **Recommendations**: Examine the cities of those specific locations to determine if any products being sold are incurring a profit loss.

- Investigate the operational costs at those locations. 

- Consider closing those locations if they continue to incur a profit loss.

## What is the correlation between profit and sales? Are we receiving a profit loss from any particular product?

Tableau - [Link](https://public.tableau.com/shared/QHYX4N94G?:display_count=n&:origin=viz_share_link)

![Scatter Plot](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/assets/160198611/3660d849-e704-4ce1-be25-8f870b1a4fb2)

- There is a **negative correlation** between sales and profit for the **Cubify CubeX 3D Printer (Double Head Print)** in the **Technology** category within the **East** region.

- The **negative correlation** for this printer becomes stronger going from 2015 to 2016, generating a higher profit loss.

- Items incurring the most profit loss (i.e., most negatively correlated) come from **Furniture** and **Technology**.

- **Recommendations**: Refer to the Tableau link above for more details on which specific products are experiencing a profit loss and the regions they are located in.

- Look into product returns and/or overhead in those regions for products generating a profit loss.
