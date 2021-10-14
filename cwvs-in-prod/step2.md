In the terminal on the right, the enviroment is being prepared. You will see a message `Provisioning Complete` along with some login credentials when the environment is ready.

Click the **IDE** tab on the right. It may take a few seconds to load. Once the IDE loads, open the file `docker-compose.yml`{{open}} to view the file in the editor. 

This docker-compose file brings the Storedog app online and instruments the Datadog agent and Storedog app services for monitoring with Datadog. 
     
All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_blank">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

Because the application is run in a Docker (containerized) environment, the Datadog Agent runs in a container alongside the application containers: `agent`. 
     
Each application service runs in its own Docker container: `discounts`, `frontend`, `advertisements`, and `db`. (The `puppeteer` service is an extraneous container to generate simulated RUM traffic in this scenario.)

Let's configure Datadog RUM for the app.

1. In a new browser window/tab, use the login credentials provided in the Terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity. Click the **Terminal** tab on the right to view the credentials.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. To get started with RUM in Datadog, you need to set up a RUM Application. Navigate to <a href="https://app.datadoghq.com/rum/list" target="_datadog">**UX Monitoring > Real User Monitoring**</a>.

3. Click **New Application**.

4. Under **Set your application details**, select **JS** as the **Application type** because you are integrating the app using Javascript.

    Enter `Storedog` as the **Application name**.

    Click **Create New RUM Application**.

5. If you are using NPM to manage dependencies for your project front end, you can integrate RUM using the `@datadog/browser-rum` package. However, Storedog uses the inline JavaScript method, so select the **CDN Sync** tab.

    ![cdnsync](assets/cdnsync.png)

    Notice that values for `applicationId` and `clientToken` are displayed in the generated code snippet. You will need these to set up RUM in your application.
    
    Adding RUM to Storedog like this propagates every app user’s session performance information up to Datadog and helps you retain and analyze not only the app’s CWV scores, but also every aspect of performance timing that is relevant to both UX and business concerns.

6. On the right, click the **IDE** tab.  

    Open the file `spree_application.html.erb`{{open}}. This Ruby file is the main template for the Storedog app. By integrating the RUM script here, RUM will be available throughout the application.

    **Lines 13-23** are the RUM script in the front end and set the initialization arguments. This code may be slightly different than the current code snippet in the Datadog UI. It will still work.

    **Line 20** connects associated APM traces to the RUM events. When you view RUM event details in the RUM UI, any associated traces will be displayed in the RUM event details.

    Notice that the code snippet includes environment variables for `applicationId` and `clientToken`.

7. Click the **Terminal** tab on the right. Let's set the environment variables for `applicationId` and `clientToken`.
    
    Copy the `applicationId` from the RUM UI page. In the terminal, assign the value you copied to `DD_APPLICATION_ID` using the `export` command: `export DD_APPLICATION_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

    Copy the `clientToken` from the RUM UI page. In the terminal, assign the value you copied to `DD_CLIENT_TOKEN` using the `export` command: `export DD_CLIENT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
    
    Run this command to verify that you saved the variables: `echo $DD_APPLICATION_ID $DD_CLIENT_TOKEN`{{execute}}

8. Click `docker-compose up -d`{{execute}} to start the storedog app. Docker will pick up the environment variables you set in the host and pass them along to the containers. Once the app is online, you will see the following in the terminal.

    ![docker-compose-up](assets/docker-compose-up.png)

9. One more thing. Let's make sure that Log Management is enabled in the Datadog organization that you are working for this scenario. You will need to access the collected logs in a later step. 

    If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again. You will be redirected to the Log Explorer. You should see logs listed in the explorer.

Before you start viewing the CWVs for an app in a RUM product, a helpful first step for getting some basic information about your web app’s UX performance is running a synthetic test (that is, a test with with no user input) on the app's performance in a browser. Let's run this test next.