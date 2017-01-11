#Abstract
This document will serve as a simple outline about how to write a technical report. In this document we will cover how to properly write all of the different parts of the technical report and hopefully give some general guidelines about what each section is meant to do and how to properly divide up each section. The abstract should serve as a brief summary of the lab. Think of the abstract as the most elemental summary of the lab. This is simply a single paragraph where you can boil down the essence of the lab so anyone can read it and get the general gist of the lab start to finish. Busy scientist have very little time, so they often read the abstract to determine whether the paper is worth reading or not. I should be able to understand the 1) the main point of the lab 2) main setup of the lab and 3) main conclusions of the lab all from the abstract.  
#Introduction
The introduction is the first foray into the scientific subject. This section serves two main purpose.

- Explain the scientific concepts in the lab  
- Explain the purpose of the lab  

Fortunately for you, we include much of the information you need for this section in the lab manuals. This is where you get to demonstrate to the TAs what you know and understand. We do not just want to see you parrot back the concepts we put in the lab manual. The best lab reports are the ones which explain the concepts in the lab in their own words. It is best to consult 2-3 external resources to get different explanations and perspectives on the topics at hand. Here is where you will want to include explanations of each of the topics and perhaps a reason why it is important to understand and explore in the fluids lab. This is also where you will want to include any equations and illustrative figures to demonstrate that you know what you are explaining. This section is very important, as any topics introduced here should be tied to the results which you find as well as  corroborate and explain them.  

##Objective and Purpose of the Lab
Now that you have explained the purpose of the lab, it is time to introduce the objective of the lab and the purpose. What are we trying to find out? Why are we trying to find it out. 

In other words, this is where you introduce the scientific question at hand. You have introduced lots of knowledge and information and this is the section where you propose what you are trying to demonstrate or explore. Often times we will pose this question in the lab manual.

##Experimental Procedure  
This section should be informative but brief. It is important for you to briefly describe the hardware which you utilized but it is not necessary to list every detail as you lab reports are already brief as it is and we provided you with significant hardware. This section is best served by a diagram of the setup and a description of the procedure which you used to ensure that your data is correct and repeatable. 

#Results  
Hopefully this section is self explanatory. This should be populated with plots, charts, graphs with appropriate axes, labels and legends. Tables can be appropriate as well, but note that the data should be presented in the most succinct way as possible. In fluids, it is common to present the data in nondimensional form (think lab 2).  If possible nondimensionalize the raw based on your representative physical and flow parameters. This will help other readers better understand the physics involved in your experiment in a more general way that is less specific to your individual setup. Note on any plots which you produce, if you can include error bars, that is always a plus. Additionally, if you can include a plot of what the expected answer is or what a theoretical/ numerical comparison would be, it would be highly advisable to include that as well. An ideal plot would have the results which you have collected with the appropriate error bars attached plotted around the expected analytic, theoretical, or numerical results.  

#Discussion  
This is by far the most important section. This section should cover the bulk of the analysis and data processing. Now that you have presented the data, it is time to make sense of it. Below are a few important sections which you should be sure to include, but are by no means limited to.

##Error analysis  
The discussion is the perfect place to include a rigorous error analysis. This includes both quantitative and qualitative. Be sure to list the largest and dominant sources of error and use the equations which Marcus when over in class to quantify their effects. These values can then be included in your error bars in the previous section  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/tech_rep_error1.png">  
</p>

We are primarily interested in finding out which parameters to which we are most sensitive. In an abstract sense, we can think of our measurement as an approximation of the actual value we hope to measure. We can approximate our value with a Taylor series as 

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/tech_rep_error2.png" >  
</p>

While we might want to measure the true value $f_k$, we might actually have measured $f_k^0$. In this linearized system, the variance and error in our measurements will generate some distance from the actual value we want and the value we read. We simply quantify this distance by taking the mean square of all of the component which contribute to the error. This analysis is nontrivial when analytic relations between parameters is unknown or not straightforward. Simple estimation of the error can tell you whether or not your measurements are reasonable.\\

Furthermore, you can determine whether or not you error bars which bound your experimental measurements encapsulate your expected value. If they do, then you are good shape. If they do not, then you are most likely not measuring what you think you are measuring or your models are incorrect. This is why error analysis is so important. If the error bars between your model and your experiment do not overlap, one of them is wrong. 

##Expected Results  
Now that you have constructed logical error bounds for your data, you need to know whether your accuracy is sufficient to encapsulate the behavior which you expect. Often times there is an answer which you expect to get. You should make sure to include these values and explain where they come from. Often time the data you expect to get comes from other experiments or physical models, perhaps even numerical simulations. It is important to compare in a quantitative and qualitative manner your results to the expected results. Do they follow the same trends? How far off are they from each other? Does your data capture the same physics?  

##Relation to scientific concepts  
Now that you have constructed the error estimates for the data and you can compare the experimental results to the expected results, you should make sure to tie everything back to the scientific concepts at hand. Do the results make sense? Are your results consistent with the physics you expect? What physical mechanism are acting to make the results your observer. Your TAs and Marcus are a great resource for this section. This is truly where you can demonstrate mastery of the subject matter. Here you have to apply the basics of the physics and mathematics which explained in the introduction to explain and make sense of the data which you have collected.   

#Conclusions  
The conclusion is always a bit tricky to nail down. In its essence it is a summary of the lab, but in a very different way than the abstract. While the abstract is a birds eye view of the lab in order to give all of the major details from start to finish, the conclusion is where you get to focus on the messages that you want the reader to takeaway. Everyone has a different style for the conclusions, but I typically find that it is the best place to reiterate the main points you are trying to convey.  

It is your last chance to convey the major findings of the lab and reflect on what you have learned and what you see as logical next steps. Additionally, it is a good place to pontificate ideas for how to improve the experiment. In short, having just made lots of arguments and analysis in the discussion, the conclusion is the final place to persuade the reader of your arguments and analysis.  

#General Suggestions  
##Signification Figures  
In general it is important to know and acknowledge sig-figs. While we will not take off points for misuse or abuse of sig-figs, it will make you TA cry.  
##Plots  
When possible plot comparable data on the same plot. Additionally, in fluids, its is usually prudent to non-dimensionalize the data in an intelligent manner. Use your Buckingham Pi skills so that you can relates as much of your data to the fewest relevant parameters. A perfect example of this is from Lab 2 where you compare the friction factor to the Reynolds number. Another, perhaps less obvious example, is from Lab 3. Here it would be prudent to plot the boundary layer as a comparison between the velocity normalized by freestream velocity and the vertical distance by the boundary layer thickness (or perhaps the similarity variables).  
