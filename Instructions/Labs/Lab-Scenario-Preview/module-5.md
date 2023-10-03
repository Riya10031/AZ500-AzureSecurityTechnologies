# Lab Scenario Preview: AZ-500: Manage Identity and Access - Part B

## Lab 05: Microsoft Entra ID Privileged Identity Management

### Lab overview

You have been asked to create a proof of concept that uses Azure Privileged Identity Management (PIM) to enable just-in-time administration and control the number of users who can perform privileged operations. The specific requirements are:
- Create a permanent assignment of the aaduser2 Microsoft Entra ID user to the Security Administrator role. 
- Configure the aaduser2 Microsoft Entra ID user to be eligible for the Billing Administrator and Global Reader roles.
- Configure the Global Reader role activation to require an approval of the aaduser3 Microsoft Entra ID user.
- Configure an access review of the Global Reader role and review auditing capabilities.

> For all the resources in this lab, we are using the **East US** region. Verify with your instructor this is the region to use for class. 

> Before you proceed, ensure that you have completed Lab 04: MFA, Conditional Access and Microsoft Entra ID Identity Protection . You will need the Azure Microsoft Entra ID tenant, AdatumLab500-04, and the aaduser1, aaduser2, and aaduser3 user accounts.

### Objectives
In this lab, you will complete the following exercises:
- Exercise 1: Configure PIM users and roles.
- Exercise 2: Activate PIM roles with and without approval.
- Exercise 3: Create an Access Review and review PIM auditing features.

### Architecture Diagram

![](media/AZ-500-LSP-Mod-1b-2.png)

Once you understand the lab's content, you can start the Hands-on Lab by clicking the **Launch** button located in the top right corner. This will lead you to the lab environment and guide. You can also preview the full lab guide [here](https://experience.cloudlabs.ai/#/labguidepreview/f0f88d68-f3fa-48ae-9ba5-12078e6b3a71) if you want to go through detailed guide prior to launching lab environment.
