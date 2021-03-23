
### Performance Analysis

We will run some profiling of a simple app that fetches some data from an external API and displays the information. We've added a 3 second delay to the response for demo purposes. The code can be found at [https://github.com/CraftAcademy/profiling_demo_code](https://github.com/CraftAcademy/profiling_demo_code) and the site app is deployed to [https://profiling-demo.netlify.com/](https://profiling-demo.netlify.com/).

-   Click the Performance tab in DevTools
-   Click ● Record
-   Navigate to the page that you want to analyze.
-   Stop the analysis and review the results

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/7wTam9u1QfGbyRAN3L9X)


Let's record the loading of the demo app and take a look at the results:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/IzLvQnsSwCtvCSh8VWW7)


You can zoom in on the portion of the recording where most of the activity occurred and examine the results more closely. As you can see, there's quite a lot of data to digest, even if the code we loaded was minimal.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/l6szmE79TQOR5IpK23ZJ)

### More complex analysis.

Load the newspaper Independent ([https://www.independent.co.uk/](https://www.independent.co.uk/)) main site and run the profiler.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/5klxikF5TNSzBOOruJW3)

The Performance panel provides a lot of data for analyzing the performance of what just happened. Let's go over some of the panels and information that we can access.

The performance tab can look something like this:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/nURgrSWxRJOirwnJmj0O)

------