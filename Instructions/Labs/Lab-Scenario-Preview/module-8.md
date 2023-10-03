# Lab Scenario Preview: AZ-500: Implement Platform Protection

## Lab 08: Azure Firewall

### Lab overview

You have been asked to install Azure Firewall. This will help your organization control inbound and outbound network access which is an important part of an overall network security plan. Specifically, you would like to create and test the following infrastructure components:
- A virtual network with a workload subnet and a jump host subnet.
- A virtual machine is each subnet. 
- A custom route that ensures all outbound workload traffic from the workload subnet must use the firewall.
- Firewall Application rules that only allow outbound traffic to www.bing.com. 
- Firewall Network rules that allow external DNS server lookups.

> For all the resources in this lab, we are using the **East US** region. Verify with your instructor this is the region to use for class. 

### Objectives

In this lab, you will complete the following exercise:

- Exercise 1: Deploy and test an Azure Firewall.

### Architecture Diagram

![](media/AZ-500-LSP-Mod-2-2.png)

Once you understand the lab's content, you can start the Hands-on Lab by clicking the **Launch** button located in the top right corner. This will lead you to the lab environment and guide. You can also preview the full lab guide [here](https://experience.cloudlabs.ai/#/labguidepreview/4bd67f85-3985-45d3-8bbe-0e7b1a274479) if you want to go through detailed guide prior to launching lab environment.
