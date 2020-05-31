function third = thirdOrder_DT(p1,r2)
    %%          Adjusting Variables
    tranBand = 0.1 * pi; % Transisiton Band
    Wc = 0.25 * pi; % Cutoff Frequency
    tranPeriod = (tranBand/2); % Transition Period
    Wp = Wc - (tranPeriod); %Passband Edge
    Ws = Wc + (tranPeriod); %Stopband Edge
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    % Magnitude of r1 as 1  to be placed at the edge of the unit circle
    r1 = 1;
    % create z1 & z2 to be complex conjugate zeros.
    z1 = r1*exp(1i*Ws);
    z2 = r1*exp(-1i*Ws);
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % Adjusting a pole to be at the edge of passband Wp, p2 & p3 are complex conjugate poles.
    % Values of p2 & p3 magnitude "r2" is detremined manually by trial & error.
    %Of  r2, that is determined manually or with MATLAB file that calculates the
    %minimium passband ripple required
    % r2 = 0.88 ; Inputed From the Function 

    % p1 = 0.6 ; Inputed From the Function ,  As the first part a = 0.6
    p2 = r2*exp(1i*Wp);
    p3 = r2*exp(-1i*Wp); 


    %% 1st Requierment:
    %Use Matlab to adjust the magnitude of the additional complex-conjugate
    %poles (p2 and p3) such that the passband ripples are less than 1 dB.
    z = [z1  z2]; %collapsing zeroes
    p = [p1 p2 p3]; %collapsing poles
    [NUM_COEFF,DEN_COEFF ] = zp2tf(z.', p.', 1); %Function to transfer zp to Transfer Function
    %           zp2tf(z.', p.', 1) the 1 here is refered to the gain of
    %           the transfer function , poly(z) is another way also.
    figure('name','3rd Order LPF - Magnitude Response');
    [h, w]=freqz(NUM_COEFF ,DEN_COEFF  ,-Wp:0.01:Wp);
    MagnitudeRespo = 20*log10(abs(h)); 
    plot(w,MagnitudeRespo); 
    y= MagnitudeRespo;
    difference = range(y) ; %calculating the difference between the max(y) and min(y) 
    grid on
    title({'Magnitude Response |H(\ite^{\omega t})|';['Passband Ripples =',num2str(difference),'dB'];['At r2 =',num2str(r2),]})
    xlabel('Frequency (rad/sample)')
    ylabel('Magnitude (dB)')


    %% 2nd Requirment: 
    %Generate the plots described in section 3 for your filter
    %-------------------------------------------------------
    %   1. Pole-zero plot and the unit circle in the Z-domain.
    %--------------------------------------------------------
    figure('name','3rd Order - Pole/Zero');
    zplane(NUM_COEFF ,DEN_COEFF ) ;
    grid on
    title('Pole/Zero Plot')
    legend on
    legend ('Zero','Pole','Unit Circle')
    %-------------------------------------------------------
    %   2. Magnitude response of the filter in dB in the frequency range
    %-------------------------------------------------------
    figure('name','3rd Order - Magnitude Response');
    freqRange = -pi:0.01:pi ; %Frequency Range
    [h,w] = freqz(NUM_COEFF ,DEN_COEFF  ,freqRange); 
    plot(w,20*log10(abs(h))); %Magnitude of the Frequency Response  
    grid on
    title('Magnitude Response')
    xlabel('Frequency Rad/Sample')
    ylabel('Magnitude dB')
    %-------------------------------------------------------
    %   3. Phase response of the Filter in the frequency range
    %-------------------------------------------------------
    figure('name','3rd Order - Phase Respone');
    [ph,w]=phasez(NUM_COEFF ,DEN_COEFF  ,freqRange) ;
    plot(w,ph);  
    grid on
    title('Phase Respone')
    xlabel('Frequency (rad/sample)')
    ylabel('Phase (rad)')
    %-------------------------------------------------------
    %   4. Group Delay of the filter in frequency range
    %-------------------------------------------------------
    figure('name', '3rd Order - Group Delay');
    groupDelay = grpdelay(NUM_COEFF, DEN_COEFF, freqRange);
    plot(freqRange,groupDelay);
    grid on
    title('Group Delay');
    xlabel('Frequency (rad/sample');
    ylabel('Group Delay');
    %-------------------------------------------------------
    %   5. Impulse response of the Filter
    %-------------------------------------------------------
    figure('name','3rd Order - Impulse Respone');
    impz(NUM_COEFF,DEN_COEFF ) ;
    grid on
    title('Impulse Response')
    %======================================================================
end


