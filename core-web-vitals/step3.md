How and where do you correlate Core Web Vitals with your web app’s performance in the browser? A common place to start is within your browser’s Developers Tools. You can use the following to audit your web app synthetically in the browser:
- Audit your web app with <a href="https://developers.google.com/web/tools/lighthouse" target="_blank">Google Lighthouse</a>.
- Get more detailed insights into your app’s performance with the specific browser’s developer tools <a href="https://developer.chrome.com/docs/devtools/evaluate-performance/" target="_blank">performance tab</a> (vendor independent, available in all browsers).
- Utilize framework profilers like the <a href="https://reactjs.org/blog/2018/09/10/introducing-the-react-profiler.html" target="_blank">React Profiler</a>.

In synthetic browser testing, the FID metric can not be measured because it can only be tracked for real inputs. The First Contentful Paint (or FCP), which can be tracked for both synthetic testing and RUM, is measured and displayed. The FCP is the time from when the page starts loading to when any part of the page's content is rendered on the screen.

The following video shows the steps involved for tracking CWVs in your browser. If you have a Chromium-based browser (Chrome, Edge, Brave, Opera, etc), you can follow the steps below the video to try this out yourself. 

<iframe src="//fast.wistia.net/embed/iframe/26a1hi5fo9?videoFoam=true"
allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed"
name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen
oallowfullscreen msallowfullscreen width="640" height="360"></iframe>


1. Click the **Storedog** tab on the right.

    If you're using a Chromium browser, continue to the next step.

    If you're not using a Chromium-based browser, copy and paste the url for the Storedog app into a Chromium browser: `https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/`{{copy}} 

2. Right-click on the app home page and select **Inspect** to open the Developer Tools in your browser.

3. Select **Lighthouse** in the Developer Tools menu.

4. Under **Categories**, select `Performance` to measure the CWV metrics. You can select the other options as well if you want to see their results in the report.
 
5. Under **Device**, select `Desktop`.

6. Click **Generate Report**, and wait for a minute while Lighthouse audits the site.

7. When it’s finished, scroll down to the **Performance** section of the audit report. View the best-estimate CWV scores that were generated.

    Was the First Contenful Paint target value is less than 1.8 seconds?

    Was the Largest Contenful Paint range is around 100 milliseconds or less?

    Was the Cumulative Layout Shift range is around 0.1 or less?

This is a helpful first step into getting some basic information about your web app’s UX performance. However, this audit produces a generalized report for you through a series of synthetic tests and toggleable factors (good vs. bad network connection, fast vs. slow device, desktop vs. mobile, etc). This is not the same as being able to monitor what your web app’s CWV scores actually are in production though. To do that, you’ll need to implement or use a <a href="https://developer.mozilla.org/en-US/docs/Web/Performance/Rum-vs-Synthetic" target="_blank">Real User Monitoring</a> solution.

Note: If you’re new to the developer tools in the browser and you’d like to see a more detailed view of your app’s estimated UX performance and CWV scores, the <a href="https://developer.chrome.com/docs/devtools/evaluate-performance/" target="_blank">dev tools performance tab</a> (that is vendor independent and available in all browsers) allows you to profile your app and generate a timeline-oriented flamegraph.

Let’s move on and see what tracking CWV scores looks like in production with Datadog’s <a href="https://www.datadoghq.com/product/real-user-monitoring/" target="_blank">RUM</a>.
