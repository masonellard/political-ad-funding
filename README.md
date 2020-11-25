# Digital Political Ads, and American Presidential Politics

We analyze the effect of Facebook political ad spending on the state polling performance of 2020 Democratic presidential primary candidates.
**Candidates:**
* Joe Biden
* Michael Bloomberg
* Pete Buttigieg
* Amy Klobuchar
* Bernie Sanders
* Elizabeth Warren

## File Descriptions

### [pol-ad-spending-report.pdf](https://github.com/masonellard/political-ad-funding/blob/main/pol-ad-spending-report.pdf)
Full report of our findings. Includes results, model adequacy analysis, inference, and supporting visualizations.

### [analysis.R](https://github.com/masonellard/political-ad-funding/blob/main/analysis.R)
R file that includes EDA, feature engineering, GLM process, and visualizations.

## Summary
  Overall, we find that the estimated effect of political ad spending on average poll
performance is as hypothesized, conditional on the candidate being a “freshman.” As the
estimation results show, the substantial positive effect that percentage increases in
Facebook ad spending have on average polling performance is highly significant for
candidates who have never participated in a presidential primary election before. The
contrast in the effect of percentage increases in spending on polling performance for
freshman and non-freshman candidates is visually emphasized in figure 1.4 in the
Appendix, where polling data is plotted against the log of spending. This finding is not
surprising. Assuming that political ad spending increases polling performance by
increasing the candidate’s exposure to the public - and assuming that exposure exhibits
diminishing marginal returns for polling performance - candidates who have already
received a substantial amount of exposure in previous elections are unlikely to benefit, on
the margin, from increased exposure through ad spending as much as debuting
candidates.
  This analysis has potential limitations. We can’t ignore the fact that heteroskedasticity
is present in the data collected. Furthermore, there were limitations in the data available
regarding the spending data in the 2020 democratic presidential primary. Ideally, we
would like to test the effect of spending on all types of political ads – not just Facebook
ads. Due to the fact that presidential elections are relatively infrequent, and we only 
recently have collected ad spending data, the sample size was relatively small. Looking
forward, we’d like to be able to test the effects of ad spending across multiple elections
and obtain more significant results. Finally, we do recognize the possibility of simultaneity
bias with the ad spending variable. Assuming diminishing marginal returns for exposure on
polling performance, candidates are incentivized to spend more in states where their poll
performance is poor, which would result in downward bias on the estimated parameter for
the log(spending)\*freshman interaction variable. If this is true, then we can safely say that
there is still a significant positive impact of ad spending on average polling performance
for freshman candidates, but the magnitude of that impact may be even greater than
what we estimated. More precise data is needed to control for potential endogeneity in the
ad spending variable.
