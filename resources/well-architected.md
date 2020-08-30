# [AWS AWS Well-Architected Framework](https://d1.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf)

[Well-Architected Tool](https://aws.amazon.com/well-architected-tool/?ref=wellarchitected-wp)

The AWS Well-Architected Framework helps you understand the pros and cons of decisions you make while building systems on AWS. By using the Framework you will learn architectural best practices for designing and operating reliable, secure, efficient, and cost-effective systems in the cloud.

The AWS Well-Architected Framework is based on five pillars — 

| Name  | Description  |
|---|---|
| Operational Excellence  | The ability to run and monitor systems to deliver business value and to continually improve supporting processes and procedures.  |
| Security  | The ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.  |
| Reliability  | The ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues.  |
| Performance Efficiency  | The ability to use computing resources efficiently to meet system requirements, and to maintain that efficiency as demand changes and technologies evolve.  |
| Cost Optimization  | The ability to run systems to deliver business value at the lowest price point.  |

 A **component** is the code, configuration and AWS Resources that together deliver against a requirement. A component is often the unit of technical ownership, and is decoupled from other components.

**Workload** identifies a set of components that together deliver business value. The workload is usually the level of detail that business and technology leaders communicate about.
 
 **Milestones** mark key changes in your architecture as it evolves throughout the product lifecycle (design, testing, go live, and in production).

We think about **architecture** as being how components work together in a workload. How components communicate and interact is often the focus of architecture diagrams.

Within an organization the **technology portfolio** is the collection of workloads that are required for the business to operate.

When architecting workloads you make trade-offs between pillars based upon your business context. These business decisions can drive your engineering priorities. You might optimize to reduce cost at the expense of reliability in development environments, or, for mission-critical solutions, you might optimize reliability with increased costs. In ecommerce solutions, performance can affect revenue and customer propensity to buy. Security and operational excellence are generally not traded-off against the other pillars.
 
 
## General Design Principles
 
The Well-Architected Framework identifies a set of general design principles to facilitate good design in the cloud:

• **Stop guessing your capacity needs**: Eliminate guessing about your infrastructure capacity needs. When you make a capacity decision before you deploy a system, you might end up sitting on expensive idle resources or dealing with the performance implications of limited capacity. With cloud computing, these problems can go away. You can use as much or as little capacity as you need, and scale up and down automatically.

• **Test systems at production scale**: In the cloud, you can create a production-scale test environment on demand, complete your testing, and then decommission the resources. Because you only pay for the test environment when it's running, you can simulate your live environment for a fraction of the cost of testing on premises.

• **Automate to make architectural experimentation easier**: Automation allows you to create and replicate your systems at low cost and avoid the expense of manual effort. You can track changes to your automation, audit the impact, and revert to previous parameters when necessary.

• **Allow for evolutionary architectures**: Allow for evolutionary architectures. In a traditional environment, architectural decisions are often implemented as static, one-time events, with a few major versions of a system during its lifetime. As a business and its context continue to change, these initial decisions might hinder the system's ability to deliver changing business requirements. In the cloud, the capability to automate and test on demand lowers the risk of impact from design changes. This allows systems to evolve over time so that businesses can take advantage of innovations as a standard practice.

• **Drive architectures using data**: In the cloud you can collect data on how your architectural choices affect the behavior of your workload. This lets you make fact-based decisions on how to improve your workload. Your cloud infrastructure is code, so you can use that data to inform your architecture choices and improvements over time.

• **Improve through game days**: Test how your architecture and processes perform by regularly scheduling game days to simulate events in production. This will help you understand where improvements can be made and can help develop organizational experience in dealing with events.
 


