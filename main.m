%%          Simple Digital Filter Design Using Pole-Zero Placement
%-------------------------------------------------------------------------%
%                           Name: Shady El Hawary
%                            ID:    146850
%                           Module Code: 19ELEC25H
%                           Module Name: Digital Signal Processing
%                           Module Leader: Dr. Michael Ibrahim
%                                   2019/2020
%-------------------------------------------------------------------------%

%%                             MAIN MATLAB FILE
%---------------------------CLEARING OUR ENVIROMENT------------------------
close all
clc
%-------------------------------------------------------------------------%
caseNumber = input(['Shady 146850',...
    '\n Input the desired case to plot the necessary requirments.',...
    '\n(*)First Order Discrete-Time Filter --> 0',...
    '\n(*)Third Order Discrete-Time Filter --> 1',...
    '\n(*)Fifth Order Discrete-Time Filter --> 2',...
    '\n(*)Frequecy Transformation using P-Z Pattern Rotation --> 3',...
    '\nEnter case number: '])
switch caseNumber
    case 0
        i = input(['Enter >>0 For Lowpass filter',...
                    '\nEnter >>1 For Highpass Filter',...
                    '\nInput: '])
        if i ==0
            firstOrder_DT(0.6) %Value of P1 Lowpass filter
        elseif i ==1
            firstOrder_DT(-0.6) %Value of P1 Highpass filter
        end
    case 1
        thirdOrder_DT(0.6, 0.88) %(P1,r2) P1 = 0.6 , r2 = 0.88
    case 2
        i = input(['Enter >>0 For requirement (1) ',...
                    '\nEnter >>1 For requirement (2)',...
                    '\nInput: '])
        if i ==0
            fifthOrder_DT(0.6) %Reg1 : Generate the plots described in section 3, 
            %and measure the passband ripples in this case. 
        elseif i ==1
            fifthOrder_DT(0.0004) %Reg2 : Use Matlab to adjust the magnitude
            %of the pole p1 in order to obtain a passband ripple less than 0.5 dB. 
            %Generate the plots described in section 3 for your filter in this case.
        end
    case 3
        i = input(['Enter >>0 For requirement (1) ',...
                    '\nEnter >>1 For requirement (2)',...
                    '\nInput: '])
        if i ==0
            frequencyTransform() %Reg1 : Transfer the fifth order LPF in section 6
            %by rotating the pole and zero by pi into HPF
        elseif i ==1
            frequencyTransform2() %Reg2 : merging the HPF with LPF to form 
            %a Bandpass filter centered around pi/2
        end
end