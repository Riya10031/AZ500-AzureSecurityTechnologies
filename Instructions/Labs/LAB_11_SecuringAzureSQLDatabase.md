# Lab 11 - Securing Azure SQL Database

## Lab scenario

You have been asked to review security features for Azure SQL database. Specifically, you are interested in:

- Protection against attacks such as SQL injection and data exfiltration. 
- Ability to discover and classify database information into categories such as Confidential. 
- Ability to audit database server and database queries and log events. 

> For all the resources in this lab, we are using the **East US** region. Verify with your instructor this is the region to use for class. 

## Lab objectives

In this lab, you will complete the following exercise:

- Exercise 1: Implement SQL Database security features

## Estimated timing: 30 minutes

## Architecture diagram

![](../Labs/Lab-Scenario-Preview/media/AZ-500-LSP-Mod-3-2.png)

## Exercise 1: Implement SQL Database security features

In this exercise, you will complete the following tasks:

- Task 1: Deploy an Azure SQL Database.
- Task 2: Configure Advanced Data Protection.
- Task 3: Configure Data Classification.
- Task 4: Configure Auditing.

### Task 1: Deploy an Azure SQL Database

In this task, you will use a template to deploy the lab infrastructure. 

1. In the Azure portal, in the **Search resources, services, and docs** text box at the top of the Azure portal page, type **Deploy a custom template** and **Select** it.

1. On the **Custom deployment** blade, click the **Build your own template in the editor** option.
    ![](../Labs/images/CUS.png)

1. On the **Edit template** blade, click **Load file**, locate the **C:\AllFiles\AZ500-AzureSecurityTechnologies-prod\Allfiles\Labs\\11\\azuredeploy.json** file and click **Open**.

    >**Note**: Review the content of the template and note that it deploys an Azure SQL database.

1. On the **Edit template** blade, click **Save**.

1. On the **Custom deployment** blade, ensure that the following settings are configured (leave rest with the default values):

   |Setting|Value|
   |---|---|
   |Subscription|the name of the Azure subscription you will be using in this lab|
   |Resource group|click **Create new** and type the name **AZ500LAB11**|
   |Location|**(US) East US**|

1. Click **Review + Create** and then click **Create**.

    >**Note**: Wait for the deployment to complete. It might take upto 5 minutes.

### Task 2: Configure Advanced Data Protection

1. In the Azure portal, in the **Search resources, services, and docs** text box at the top of the Azure portal page, type **Resource groups** and **Select** it

2. On the **Resource groups** blade, in the list of resource group, click the **AZ500LAB11** entry.

3. On the **AZ500LAB11** blade, click the entry representing the newly created SQL Server.

4. On the SQL server blade, in the **Security** section, click **Microsoft Defender for Cloud**, select **Enable Microsoft Defender for SQL**.

   ![](../Labs/images/microsoftdefenersql-1.png)

      >**Note**: Wait until notification indicates Azure Defender for SQL has been successfully enabled.

6. On the SQL server blade, under the **Security** section and within the **Microsoft Defender for Cloud** page, notice the **Enablement Status: Enabled at the server-level (Configure)** parameter, click **(configure)**. 
    
7. On the **Server Settings** blade, review the information about pricing and the trial period, **VULNERABILITY ASSESSMENT SETTINGS** and **ADVANCED THREAT PROTECTION SETTINGS**.

8. Back to **Microsoft Defender for Cloud** blade, review **Recommendations** and **Security incidents and alerts**.

      >**Note**: It may take 10-15 minutes for recommendations to appear on the **Microsoft Defender for Cloud** blade. Rather than waiting, proceed to the next task but consider returning to this blade once you complete all the remaining tasks.

### Task 3: Configure Data Classification

In this task, you will discover and classify information in SQL database for GPDR and data protection compliance.

1. On the SQL server blade, in the **Settings** section, click **SQL Databases**.

2. In the list of databases, select the **AZ500LabDb** entry. 

3. On the **AZ500LabDb** SQL database blade, in the **Security** section, click **Data Discovery & Classification**.

4. On the **Data Discovery & Classification** blade, click the **Classification** tab.

    >**Note**: The classification engine scans your database for columns containing potentially sensitive data and provides a list of recommended column classifications.

5. Click the text message **15 columns with classification recommendations** displayed on blue bar at the top of the blade.
    ![](../Labs/images/bluebar.png)

7. Review the listed columns and the recommended sensitivity label. 

8. Enable the **Select all** checkbox and then click **Accept Selected Recommendations**.

    >**Note**: Alternatively, you could select only certain columns and dismiss others. 

    >**Note**: You have the option to change the information type and sensitivity label. 

9. Once you have completed your review click **Save**. 

    >**Note**: This will complete the classification and persistently label the database columns with the new classification metadata. 

10. Back on the **Data Discovery & Classification** blade **Overview** tab, note that it has been updated to account for the latest classification information. 

### Task 4 : Configure auditing 

In this task, you will first configure server level auditing and then configure database level auditing. 

1. In the Azure portal, navigate back to the SQL Server blade.

2. On the SQL Server blade, in the **Security** section, click **Auditing**.
    ![](../Labs/images/auditing.png)

    >**Note**: This is server level auditing. The default auditing settings include all the queries and stored procedures executed against the database, as well as successful and failed logins.

4. Set the **Enable Azure SQL Auditing** switch to **ON** to enable auditing. 

5. Select the **Storage** checkbox and entry boxes for **Subscription** and **Storage Account** will display.	

6. Choose your **Subscription** from the dropdown list.	

7. Click **Storage account** and choose **Create new**.	

8. On the **Create storage account** blade, in the **Name** box, type a globally unique name consisting of between 3 and 24 lower case letters and digits, click **OK**. 

9. On the server blade, in the **Settings** section, click **SQL Databases**.

10. In the list of databases, select the **AZ500LabDb** entry. 

11. On the **AZ500LabDb** SQL database blade, in the **Security** section, click **Auditing**.
     ![](../Labs/images/savedb.png)

    >**Note**: This is database level auditing. Server-level auditing is already enabled. 
  
    >**Note**: Audits can be written to an Azure storage account, to a Log Analytics workspace, or to the Event Hub. You can configure any combination of these options.

    >**Note**: If storage-based auditing is enabled on the server, it will always apply to the database, regardless of the database settings.

13. Click **View Audit Logs**.

14. On the **Audit records** blade, note that you can switch between Server audit and Database audit. 

    >**Note**: Since this SQL server and database were created recently, it is unlikely that any events will be available at this point. 

    > **Results:** You have created a SQL server and database, configured data classification, and auditing. 

    > **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
     > - Navigate to the Lab Validation Page, from the upper right corner in the lab guide section.
     > - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task. 
     > - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
     > - If you need any assistance, please contact us at labs-support@spektrasystems.com. We are available 24/7 to help you out.

### Review

In this lab, you have completed:

- Deployed an Azure SQL Database.
- Configured Advanced Data Protection.
- Configured Data Classification.
- Configured Auditing.

### You have successfully completed the lab
