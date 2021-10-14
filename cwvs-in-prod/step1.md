Core Web Vitals (CWVs) are a set of signals that quantify the user experience of web applications. They help developers understand where their application stands in terms of how delightful it is to use.

CWVs are distinct, measurable aspects of the front end of an application, which directly affect its users. These aspects are categorized by the following performance concerns: loading, interactivity, and visual stability. Each metric that fits within these categories has a defined range of timing thresholds that help you determine how a particular metric is faring. At Datadog, we recommend monitoring the 75th percentile for each of these metrics:

![core-web-vitals](assets/core-web-vitals.png)

#### Largest Contentful Paint (LCP)
This measures loading performance. Specifically, the moment in a page-loading timeline in which the largest DOM object in the viewport is rendered and becomes visible on the screen.

The recommended LCP target value is less than 2.5 seconds.

#### First Input Delay (FID)
This measures interactivity. Specifically, the time that has elapsed between a user’s first interaction with a page and the browser's response to it.

An optimal FID range is around 100 milliseconds or less.

#### Cumulative Layout Shift (CLS)
This measurement quantifies the visual stability of a page. It factors in any unexpected page movement that is a result of dynamically loaded content (such as third party ads). The measurement begins at 0, which means no layout shifts have occurred.

An optimal CLS range is around 0.1 or less.

### Why is tracking CWVs Important?
Tracking CWVs is a vital part of the development process because it fundamentally relates to the success of your web app, both in terms of the user experience and general customer adoption (more on the business impact of monitoring CWVs can be found <a href="https://web.dev/vitals-business-impact/" target="_blank">here</a>). Also, these measurements were <a href="https://developers.google.com/search/blog/2020/11/timing-for-page-experience" target="_blank">recently added to Google’s search algorithm</a> and now directly affect the SEO ranking of your page.

Ready to put CWVs into action? Let’s jump in!