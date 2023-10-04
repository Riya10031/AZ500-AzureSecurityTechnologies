# Lab 01 - Role-Based Access Control

## Lab scenario

You have been asked to create a proof of concept showing how Azure users and groups are created. Also, how role-based access control is used to assign roles to groups. Specifically, you need to:

- Create a Senior Admins group containing the user account of Joseph Price as its member.
- Create a Junior Admins group containing the user account of Isabel Garcia as its member.
- Create a Service Desk group containing the user account of Dylan Williams as its member.
- Assign the Virtual Machine Contributor role to the Service Desk group.  

## Lab objectives

In this lab, you will complete the following exercises

- Exercise 1: Create the Senior Admins group with the user account Joseph Price as its member (the Azure portal). 
- Exercise 2: Create the Junior Admins group with the user account Isabel Garcia as its member (PowerShell).
- Exercise 3: Create the Service Desk group with the user Dylan Williams as its member (Azure CLI). 
- Exercise 4: Assign the Virtual Machine Contributor role to the Service Desk group.

## Estimated timing: 40 minutes

## Architecture diagram

![](../Labs/Lab-Scenario-Preview/media/AZ-500-LSP-Mod-1(1).png)


## Exercise 1: Create the Senior Admins group with the user account Joseph Price as its member

## Estimated timing: 10 minutes

In this exercise, you will complete the following tasks:

- Task 1: Use the Azure portal to create a user account for Joseph Price.
- Task 2: Use the Azure portal to create a Senior Admins group and add the user account of Joseph Price to the group.

### Task 1: Use the Azure portal to create a user account for Joseph Price 

In this task, you will create a user account for Joseph Price.

1. In the **Search resources, services, and docs** text box at the top of the Azure portal page, type **Microsoft Entra ID** and press the **Enter** key.

2. On the **Overview** blade of the Microsoft Entra ID tenant, in the **Manage** section, select **Users**, and then select **+ New user**, then, in the drop-down menu, click on **Create new user**.

3. On the **Create new user** blade, specify the following settings:

   |Setting|Value|
   |---|---|
   |User principal name|**Joseph**|
   |Display name|**Joseph Price**|

![](../images/task1-1.png)

4. Click on the copy icon next to the **User principal name** to copy the full user.

5. Ensure that the **Auto-generate password**  is selected, and Click on the copy icon next to the **password** to identify the automatically generated password. You would need to provide this password, along with the user name to Joseph. 

6. Click on **Review + create** and then select **Create**

7. Refresh the **Users \| All users** blade to verify the new user was created in your Microsoft Entra ID tenant.

![](../images/task1-2.png)

### Task 2: Use the Azure portal to create a Senior Admins group and add the user account of Joseph Price to the group

In this task, you will create the *Senior Admins* group, add the user account of Joseph Price to the group, and configure it as the group owner.

1. In the Azure portal, navigate back to the blade displaying your Microsoft Entra ID tenant. 

2. In the **Manage** section, click on **Groups**, and then select **+ New group**.
 
3. On the **New Group** blade, specify the following settings (leave others with their default values):

   |Setting|Value|
   |---|---|
   |Group type|**Security**|
   |Group name|**Senior Admins**|
   |Membership type|**Assigned**|

![](../images/task2-1.png)
    
4. Click on the **No owner selected** link, on the **Owners** blade, select **Joseph Price**, and click on **Select**.

5. Click on the **No members selected** link, on the **Members** blade, select **Joseph Price**, and click on **Select**.

6. Back on the **New Group** blade, click on **Create**.

![](../images/task2-2-1.png)

> **Result:** You used the Azure Portal to create a user and a group, and assigned the user to the group. 

## Exercise 2: Create a Junior Admins group containing the user account of Isabel Garcia as its member

## Estimated timing: 10 minutes

In this exercise, you will complete the following tasks:

- Task 1: Use PowerShell to create a user account for Isabel Garcia.
- Task 2: Use PowerShell to create the Junior Admins group and add the user account of Isabel Garcia to the group. 

### Task 1: Use PowerShell to create a user account for Isabel Garcia

In this task, you will create a user account for Isabel Garcia by using PowerShell.

1. Open the Cloud Shell by clicking the first icon in the top right of the Azure Portal. If prompted, select **PowerShell** and **Create storage**.

![](../images/task2-3-1.png)

2. Ensure **PowerShell** is selected in the drop-down menu in the upper-left corner of the Cloud Shell pane.

   >**Note**: To paste copied text into the Cloud Shell, right-click within the pane window and select **Paste**. Alternatively, you can use the **Shift+Insert** key combination.

3. In the PowerShell session within the Cloud Shell pane, run the following to create a password profile object:

    ```powershell
    $passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    ```

4. In the PowerShell session within the Cloud Shell pane, run the following to set the value of the password within the profile object:
    ```powershell
    $passwordProfile.Password = 'Pa55w.rd1234'
    ```

5. In the PowerShell session within the Cloud Shell pane, run the following to connect to Microsoft Entra ID:

    ```powershell
    Connect-AzureAD
    ```
      
6. In the PowerShell session within the Cloud Shell pane, run the following to identify the name of your Microsoft Entra ID tenant: 

    ```powershell
    $domainName = ((Get-AzureAdTenantDetail).VerifiedDomains)[0].Name
    ```

7. In the PowerShell session within the Cloud Shell pane, run the following to create a user account for Isabel Garcia: 

    ```powershell
    New-AzureADUser -DisplayName 'Isabel Garcia' -PasswordProfile $passwordProfile -UserPrincipalName "Isabel@$domainName" -AccountEnabled $true -MailNickName 'Isabel'
    ```

8. In the PowerShell session within the Cloud Shell pane, run the following to list Microsoft Entra ID users (the accounts of Joseph and Isabel should appear on the listed): 

    ```powershell
    Get-AzureADUser 
    ```

### Task 2: Use PowerShell to create the Junior Admins group and add the user account of Isabel Garcia to the group

In this task, you will create the Junior Admins group and add the user account of Isabel Garcia to the group by using PowerShell.

1. In the same PowerShell session within the Cloud Shell pane, run the following to create a new security group named Junior Admins:
	
    ```powershell
    New-AzureADGroup -DisplayName 'Junior Admins' -MailEnabled $false -SecurityEnabled $true -MailNickName JuniorAdmins
    ```

1. In the PowerShell session within the Cloud Shell pane, run the following to list the groups in your Microsoft Entra ID tenant (the list should include the Senior Admins and Junior Admins groups):

    ```powershell
    Get-AzureADGroup
    ```

1. In the PowerShell session within the Cloud Shell pane, run the following to obtain a reference to the user account of Isabel Garcia:

    ```powershell
    $user = Get-AzureADUser -Filter "MailNickName eq 'Isabel'"
    ```

1. In the PowerShell session within the Cloud Shell pane, run the following to add a user account of Isabel to the Junior Admins group:
	
    ```powershell
    Add-AzADGroupMember -MemberUserPrincipalName $user.userPrincipalName -TargetGroupDisplayName "Junior Admins" 
    ```

1. In the PowerShell session within the Cloud Shell pane, run the following to verify that the Junior Admins group contains a user account of Isabel:

    ```powershell
    Get-AzADGroupMember -GroupDisplayName "Junior Admins"
    ```

> **Result:** You used PowerShell to create a user and a group account, and added the user account to the group account. 


## Exercise 3: Create a Service Desk group containing the user account of Dylan Williams as its member

## Estimated timing: 10 minutes

In this exercise, you will complete the following tasks:

- Task 1: Use Azure CLI to create a user account for Dylan Williams.
- Task 2: Use Azure CLI to create the Service Desk group and add a user account of Dylan to the group. 

### Task 1: Use Azure CLI to create a user account for Dylan Williams

In this task, you will create a user account for Dylan Williams.

1. In the drop-down menu in the upper-left corner of the Cloud Shell pane, select **Bash**, and, when prompted, click on **Confirm**. 

1. In the Bash session within the Cloud Shell pane, run the following to identify the name of your Microsoft Entra ID tenant:

    ```cli
    DOMAINNAME=$(az ad signed-in-user show --query 'userPrincipalName' | cut -d '@' -f 2 | sed 's/\"//')
    ```

1. In the Bash session within the Cloud Shell pane, run the following to create a user, Dylan Williams. Use *yourdomain*.
 
    ```cli
    az ad user create --display-name "Dylan Williams" --password "Pa55w.rd1234" --user-principal-name Dylan@$DOMAINNAME
    ```
      
1. In the Bash session within the Cloud Shell pane, run the following to list Microsoft Entra ID user accounts (the list should include user accounts of Joseph, Isabel, and Dylan)
	
    ```cli
    az ad user list --output table
    ```

### Task 2: Use Azure CLI to create the Service Desk group and add a user account of Dylan to the group 

In this task, you will create the Service Desk group and assign Dylan to the group. 

1. In the same Bash session within the Cloud Shell pane, run the following to create a new security group named Service Desk.

    ```cli
    az ad group create --display-name "Service Desk" --mail-nickname "ServiceDesk"
    ```
 
1. In the Bash session within the Cloud Shell pane, run the following to list the Microsoft Entra ID groups (the list should include Service Desk, Senior Admins, and Junior Admins groups):

    ```cli
    az ad group list -o table
    ```

1. In the Bash session within the Cloud Shell pane, run the following to obtain a reference to the user account of Dylan Williams: 

    ```cli
    USER=$(az ad user list --filter "displayname eq 'Dylan Williams'")
    ```

1. In the Bash session within the Cloud Shell pane, run the following to obtain the objectId property of the user account of Dylan Williams: 

    ```cli
    OBJECTID=$(echo $USER | jq '.[].id' | tr -d '"')
    ```

1. In the Bash session within the Cloud Shell pane, run the following to add a user account of Dylan to the Service Desk group: 

    ```cli
    az ad group member add --group "Service Desk" --member-id $OBJECTID
    ```

1. In the Bash session within the Cloud Shell pane, run the following to list members of the Service Desk group and verify that it includes the user account of Dylan:

    ```cli
    az ad group member list --group "Service Desk"
    ```

1. Close the Cloud Shell pane.

> **Result:** Using Azure CLI you created a user and a group accounts, and added the user account to the group. 

## Exercise 4: Assign the Virtual Machine Contributor role to the Service Desk group

## Estimated timing: 10 minutes

In this exercise, you will complete the following task:

### Task 1: Assign the Service Desk Virtual Machine Contributor permissions 

1. In the Search resources, services, and docs text box at the top of the Azure portal page, type Resource Groups and press the Enter key.

2. On the **Resource groups** blade, click on the **AZ500LAB01** resource group entry.

3. On the **AZ500LAB01** blade, click on **Access control (IAM)**.

4. On the **AZ500LAB01 \| Access control (IAM)** blade, click on **+ Add** and then, in the drop-down menu, click on **Add role assignment**.

5. On the **Add role assignment** blade, specify the following settings:

   |Setting|Value|
   |---|---|
   |Search by role name (Under Role Pane) |search and select **Virtual Machine Contributor**|
   |Click on **Next**|
   |Assign access to (Under Members Pane)|**User, group, or service principal**|
   |Members (+Select Members)|**Service Desk**|

![](../images/e4-t1-1.png)

![](../images/e4-t1-2.png)

6. Click on **Review + assign** twice to create the role assignment.

7. From the **Access control (IAM)** blade, click on the **Check access** tab.

8. On the **AZ500LAB01 \| Access control (IAM)** blade, click on the **Check access** button under check access, and then in the **Search by name or email address** text box, type **Dylan Williams**.

![](../images/e4-t1-4.png)

9. In the list of search results, select the user account of Dylan Williams and, on the **Dylan Williams assignments - AZ500LAB01** blade, view the newly created assignment.

10. Close the **Dylan Williams assignments - AZ500LAB01** blade.

11. Repeat the same last two steps to check access for **Joseph Price**. 

> **Result:** You have assigned and checked RBAC permissions. 

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
- Click the Lab Validation tab located at the upper right corner of the lab guide section and navigate to the Lab Validation Page.
- Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task. 
- If not, carefully read the error message and retry the step, following the instructions in the lab guide.
- If you need any assistance, please contact us at labs-support@spektrasystems.com. We are available 24/7 to help you out.

### Review

In this lab, you have completed:

- Created the Senior Admins group with the user account Joseph Price as its member.
- Created a Junior Admins group containing the user account of Isabel Garcia as its member.
- Created a Service Desk group containing the user account of Dylan Williams as its member.
- Assigned the Virtual Machine Contributor role to the Service Desk group.

### You have successfully completed the lab
