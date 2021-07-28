Now, let’s walk through a version of Storedog that has some performance issues that are generating some bad CWV scores.
    
1. Navigate to the <a href="https://app.datadoghq.com/rum/list" target="_datadog">**UX Monitoring > Rum Applications**</a>.

2. In the **Storedog** application panel, you will see visualizations for User Sessons, Loading Time, and % of views with errors. Click **Application Overview** for this application.

    Scroll through and view the visualizations. On the left, the top panel displays the Core Web Vitals P75. 

    Above the dashboard area, toggle the Device Type to view the data for Mobile and for Desktop. Do you notice how the data differs based on device type?

3. In the top menu, click **Dashboards** and select **Performance**.

    Scroll through and view the visualizations in the dashboard.

    In the **Overview** panel, notice the **P75 loading time**. 

    In the **Core Web Vitals** panel, notice that the CWV scores are not where they should be. For example, the LCP score is > 2.5 seconds, much higher than it should be.

To monitor and get notifications when app performance and the CWV scores are below expections, you can set up a RUM Monitor. 