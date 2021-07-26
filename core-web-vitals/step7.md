

Resolving this issue will involve using Datadog RUM in order to facilitate a familiar debugging workflow: verify the issue, make a code change to resolve it, and then ensure it was fixed.

4. Then hover over the warning sign next to the LCP score, and you’ll see how the current score measures up to what’s needed for a good one. In this view, you’ll additionally be able to review measurements of every Core Web Vital across the timeline.

5. Now let’s [review what the culprit is](link to a block of bad code in ‘instrumented-fixed’) in the code. As you can see (explanation of bad code goes here).

6. In order to fix this replace the block on lines x through y with (block of good code). This will (explanation of what fixed code will do).

7. Now that we’ve put in our fix, let’s verify that it resolved the underlying issue!

    Let’s [navigate back to Storedog](link to the fixed version of the app), and repeat some of the same UI interactions you performed before.

8. Then we can take a look at the P75 average for Largest Contentful Paint, and see that the average initial loading time has increased dramatically, and is reporting within the desired 0-2.5s range. 

9. Now return to the [views page](link to RUM Sessions/views) in the RUM sessions overview for this app, click on the most recent session, and verify that it shows that the Largest Contentful Paint is within the target range of 0-2500ms as well.

    You’ve now verified that these changes have optimized the UX performance of this app, and the loading experience is currently acceptable for your users in production.

10. Check the alert status and see that it changes to OK.