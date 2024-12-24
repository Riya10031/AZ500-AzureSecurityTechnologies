# Lab 02: Network Security Groups and Application Security Groups

## Lab scenario
You have been asked to implement your organization's virtual networking infrastructure and test to ensure it is working correctly. In particular:

- The organization has two groups of servers: Web Servers and Management Servers.
- Each group of servers should be in its own Application Security Group. 
- You should be able to RDP into the Management Servers, but not the Web Servers.
- The Web Servers should display the IIS web page when accessed from the internet. 
- Network security group rules should be used to control network access.  

 > For all the resources in this lab, we are using the **East US** region.

## Lab objectives
In this lab, you will complete the following exercises:
- Exercise 1: Create the Virtual networking infrastructure
- Exercise 2: Deploy Virtual machines and test the network filters
  
# Exercise 1: Create the Virtual networking infrastructure

In this exercise, you will complete the following tasks:

- Task 1: Create a Virtual network with one subnet.
- Task 2: Create two application security groups.
- Task 3: Create a network security group and associate it with the virtual network subnet.
- Task 4: Create inbound NSG security rules to all traffic to web servers and RDP to the management servers.

## Task 1:  Create a Virtual network

In this task, you will create a virtual network to use with the network and application security groups. 

1. On the Azure portal, create a new **Virtual network** with the following settings

    |Setting|Value|
    |---|---|
    |Subscription|**Leave the default subscription**|
    |Resource group|**AZ500LAB02**|
    |Name|**myVirtualNetwork**|
    |Region|**East US**|

1. On the **IP addresses** tab, set the **IPv4 address space** to **10.0.0.0/16** and name **default** as the **Subnet name** with the following settings and click **Save**:

    |Setting|Value|
    |---|---|
    |Subnet name|**default**|
    |Subnet address range|**10.0.0.0/24**|

    >**Note:** If the **default** subnet is not there in the subnet section, then you have to create it. Click on **+ Add subnet**, then follow this given instructions, and click on **Add**.

## Task 2:  Create application security groups

In this task, you will create an application security group.

1. On the Azure portal, create a new **Application security group** with the following settings

    |Setting|Value|
    |---|---|
    |Subscription|**Leave the default subscription**|    
    |Resource group|**AZ500LAB02**|
    |Name|**myAsgWebServers**|
    |Region|**East US**|
   
     >**Note**: This group will be for the web servers.

1. Create another **Application security group** with the following settings

    |Setting|Value|
    |---|---|
    |Subscription|**Leave the default subscription**|       
    |Resource group|**AZ500LAB02**|
    |Name|**myAsgMgmtServers**|
    |Region|**East US**|

     >**Note**: This group will be for the management servers.

## Task 3:  Create a network security group and associate the NSG to the subnet

In this task, you will create a network security group. 

1. On the Azure portal, create a new **Network security groups** with the following settings

    |Setting|Value|
    |---|---|
    |Subscription|**Leave the default subscription**|
    |Resource group|**AZ500LAB02**|
    |Name|**myNsg**|
    |Region|**East US**|

1. On the **myNsg** blade, **Associate** a new **Subnets** with the following settings

    |Setting|Value|
    |---|---|
    |Virtual network|**myVirtualNetwork**|
    |Subnet|**default**|

## Task 4: Create inbound NSG security rules to all traffic to web servers and RDP to the servers. 

1. On the **myNsg** blade, **Add** new **Inbound security rules** to allow TCP ports 80 and 443 to the **myAsgWebServers** application security group, use the following settings 

    |Setting|Value|
    |---|---|
    |Destination|select **Application security group** from the drop down|
    |Destination application security groups| select **myAsgWebServers** from the drop down |
    |Destination port ranges|**80,443**|
    |Protocol|**TCP**|
    |Priority|**100**|                                                    
    |Name|**Allow-Web-All**|     

1. On the **myNsg** blade, **Add** new **Inbound security rules** to allow the RDP port (TCP 3389) to the **myAsgMgmtServers** application security group, use the following settings 

    |Setting|Value|
    |---|---|
    |Destination|select **Application security group** from the drop down|
    |Destination application security groups |**myAsgMgmtServers** from the drop down|    
    |Service|Choose **RDP**|      
    |Destination port ranges|Ensure **3389**|
    |Protocol|Ensure **TCP**|
    |Priority|**110**|                                                
    |Name|**Allow-RDP-All**|

     > Result: You have deployed a virtual network, network security with inbound security rules, and two application security groups. 

# Exercise 2: Deploy virtual machines and test network filters

In this exercise, you will complete the following tasks:

- Task 1: Create a virtual machine to use as a web server.
- Task 2: Create a virtual machine to use as a management server. 
- Task 3: Associate each virtual machines network interface to it's application security group.
- Task 4: Test the network traffic filtering.

## Task 1: Create a virtual machine to use as a web server.

In this task, you will create a virtual machine to use as a web server.

1. In the Azure portal, create a new **Virtual machine** from the services with the following settings

   |Setting|Value|
   |---|---|
   |Subscription|**Leave the default subscription**|
   |Resource group|**AZ500LAB02**|
   |Virtual machine name|**myVmWeb**|
   |Region|**(US)East US**|
   |Availability options|**No infrastructure redundancy required**|
   |Security type|**Standard**|
   |Image|**Windows Server 2022 Datacenter: Azure Edition- x64 Gen2**|
   |Size|**Standard D2s v3**|
   |Username|**Student**|
   |Password|**Pa55w.rd1234**|
   |Confirm password|**Pa55w.rd1234**|
   |Public inbound ports|**None**| 
   |Would you like to use an existing Windows Server License |**check the box**|
   |I confirm I have an eligible Windows Server license with Software Assurance or Windows Server subscription to apply this Azure Hybrid Benefit| **Check the box**|   

     >**Note**: For public inbound ports, we will rely on the precreated NSG. 

1. On the **Disks** tab, set the **OS disk type** to **Standard HDD**.

1. On the **Networking** tab, select the previously created network **myVirtualNetwork**. Under **NIC network security group** select **None**.

1. On the **Monitoring** tab, verify the following setting and then create.

   |Setting|Value|
   |---|---|
   |Boot diagnostics|**Enabled with managed storage account (recommended)**|


## Task 2: Create a virtual machine to use as a management server. 

In this task, you will create a virtual machine to use as a management server.

1. In the Azure portal, create a new **Virtual machine** from the services with the following settings

   |Setting|Value|
   |---|---|
   |Subscription|**Leave the deafult subscription**|
   |Resource group|**AZ500LAB02**|
   |Virtual machine name|**myVMMgmt**|
   |Region|**(US)East US**|
   |Availability options|**No infrastructure redundancy required**|
   |Security type|**Standard**|   
   |Image|**Windows Server 2022 Datacenter: Azure Edition- Gen2**|
   |Size|**Standard D2s v3**|
   |Username|**Student**|
   |Password|**Pa55w.rd1234**|
   |Confirm password|**Pa55w.rd1234**|
   |Public inbound ports|**None**| 
   |Would you like to use an existing Windows Server License |**check the box**|
   |I confirm I have an eligible Windows Server license with Software Assurance or Windows Server subscription to apply this Azure Hybrid Benefit| **Check the box**|    

    >**Note**: For public inbound ports, we will rely on the precreated NSG. 

1. On the **Disks** tab, set the **OS disk type** to **Standard HDD**.

1. On the **Networking** tab, select the previously created network **myVirtualNetwork**. Under **NIC network security group** select **None**.

1. On the **Monitoring** tab, verify the following setting and then create.

   |Setting|Value|
   |---|---|
   |Boot diagnostics|**Enabled with managed storage account (recommended)**|

    >**Note**: Wait for both virtual machines to be provisioned before continuing. 

## Task 3: Associate each virtual machines network interface to its application security group.

In this task, you will associate each virtual machine's network interface with the corresponding application security group. The myVmWeb virtual machine interface will be associated to the myAsgWebServers ASG. The myVMMgmt virtual machine interface will be associated to the myAsgMgmtServers ASG. 

1. In the Azure portal, navigate back to the **Virtual machines** blade and verify that both virtual machines are listed with the **Running** status.

1. Select the **myVmWeb** virtual mahine, from the **Networking** section, add **myAsgWebServers** as the **Application security group**.

1. Now, select the **myVMMgmt** virtual mahine, from the **Networking** section, add **myAsgMgmtServerss** as the **Application security group**.  


## Task 4: Test the network traffic filtering

In this task, you will test the network traffic filters. You should be able to RDP into the myVMMgmnt virtual machine. You should be able to connect from the internet to the myVmWeb virtual machine and view the default IIS web page.  

1. Navigate back to the **myVMMgmt** virtual machine and connect to the virtual machine via **RDP** by downloading the RDP file. Select **Use a different account** and provide the following credentials

   |Setting|Value|
   |---|---|
   |User name|**Student**|
   |Password|**Pa55w.rd1234**|

    >**Note**: Verify that the Remote Desktop connection was successful. At this point you have confirmed you can connect via Remote Desktop to myVMMgmt.

1. In the Azure portal, navigate to the **myVmWeb** virtual machine, in the **Operations** section, click **Run command** and then click **RunPowerShellScript**.

1. On the **Run Command Script** pane, run the following to install the Web server role on **myVmWeb**:

    ```powershell
    Install-WindowsFeature -name Web-Server -IncludeManagementTools
    ```

    >**Note**: Wait for the installation to complete. This might take a couple of minutes. At that point, you can verify that myVmWeb can be accessed via HTTP/HTTPS.

1. After getting the output, close the **Run Command Script** blade, and navigate back to the **Overview** page of **myVmWeb** blade. Copy and paste the **Public IP address** of the myVmWeb Azure VM to the notepad.

1. Open another browser tab and navigate to IP address you identified in the previous step.

    >**Note**: The browser page should display the default IIS welcome page because port 80 is allowed inbound from the internet based on the setting of the **myAsgWebServers** application security group. The network interface of the myVmWeb Azure VM is associated with that application security group. 

> **Result:** You have validated that the NSG and ASG configuration is working and traffic is being correctly managed.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
   - If you receive a success message, you can proceed to the next task.
   - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
   - If you need any assistance, please contact us at labs-support@spektrasystems.com. We are available 24/7 to help you out.
 
   <validation step="37ac9cd5-b1fd-45cf-943f-f6952ccd77f3" />

### You have successfully completed the lab
