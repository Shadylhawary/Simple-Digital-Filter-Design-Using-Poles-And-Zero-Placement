# **Simple Digital Filter Design using Pole-Zero Placement**

### 1. Introduction

-  The frequency response of a discrete-time system depends on the location of its poles and zeros in the Z-domain. • To suppress a frequency, we can locate a zero at this frequency on the unit circle.
- To amplify a frequency, we can locate a pole at this frequency inside the unit circle (such that the system is stable).
- In order to get a digital ﬁlter with real coeﬃcients, complex poles should appear in complexconjugate pairs. Same for complex zeros.
- A ﬁlter with nonlinear phase response will lead to distortion in the output signal.
- A convenient way to check the linearity of phase response is to use the group delay, deﬁned as the negative of the slope of the phase. 
- The objective of this project is to become familiar with designing simple digital ﬁlters by properly placing poles and zeros in the Z-domain


### 2. Filter Specification


***The speciﬁcations of practical ﬁlters usually take the form of a tolerance diagram, as shown in the following figure for a lowpass ﬁlter***


- The passband edge is denoted by ωp and the stopband edge is denoted by ωs.
- The width of the transition band is ∆ω = ωs −ωp. 
- The cutoﬀ frequency is denoted by ωc which is assumed to be half-way between ωp and ωs.
![image info](filterr1.png)


### 3. General Requirements


***For all the ﬁlters in this assignment use the Matlab to generate the following plots***

1. Pole-zero plot and the unit circle in the Z−domain.

2. Magnitude response of the ﬁlter in dB in the frequency range (−π < ω ≤ π). 

3. Magnitude response of the ﬁlter in dB in the frequency range (−ωp ≤ ω ≤ ωp). Use this plot to get an approximate value of the passband ripples. 

4. Phase response of the ﬁlter in the frequency range (−π < ω ≤ π). 

5. Group delay of the ﬁlter in the frequency range (−π < ω ≤ π). 

6. The ﬁlter’s impulse response.
