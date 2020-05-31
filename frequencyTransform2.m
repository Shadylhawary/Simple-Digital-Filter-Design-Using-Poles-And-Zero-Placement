function freq = frequencyTransform2()
    %%          Adjusting Variables
    tranBand = 0.1 * pi; % Transisiton Band
    Wc = 0.25 * pi; % Cutoff Frequency
    tranPeriod = (tranBand/2); % Transition Period
    Wp = Wc - (tranPeriod); %Passband Edge
    Ws = Wc + (tranPeriod); %Stopband Edge
    %transformerCoeff = exp(1i*pi); %Transform the 5fth order LPF
    %in section 6 into a highpass flter by rotating the pole-zero pattern by w
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    % Magnitude of r1 as 1  to be placed at the edge of the unit circle
    r1 = 1;
    % create z1 & z2 to be complex conjugate zeros.

    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % Adjusting a pole to be at the edge of passband Wp, p2 & p3 are complex conjugate poles.
    % Values of p2 & p3 magnitude "r2" is detremined manually by trial & error.
    %Of  r2, that is determined manually or with MATLAB file that calculates the
    %minimium passband ripple required
    r2 = 0.88 ; %Inputed From the Function 

    %p1 = 4.7e-5 ; %Inputed From the Function ,  As the first part a = 0.6

    % Let the magnitude of the additional complex-conjugate poles
    %(p4 and p5) be the same as the magnitude of (p2 and p3). 
    r3 = r2;
    %Assign a shifter to a variable.
    rotation = exp(1i*pi/2);
    conjRotation = exp(-1i*pi/2)
    %% ZEROS
    z1 = r1*exp(1i*Ws).*rotation;
    z2 = r1*exp(-1i*Ws).*rotation;
    z3 = r1*exp(1i*(((pi-Ws)/2)+Ws)).*rotation;
    z4 = r1*exp(-1i*(((pi-Ws)/2)+Ws)).*rotation;
    %NEW ADDED ZEROS
    z5 = r1*exp(1i*Ws).*conjRotation;
    z6 = r1*exp(-1i*Ws).*conjRotation;
    z7 = r1*exp(1i*(((pi-Ws)/2)+Ws)).*conjRotation;
    z8 = r1*exp(-1i*(((pi-Ws)/2)+Ws)).*conjRotation;
    %% POLES
    p1 = 0.6.*rotation;
    p2 = r2*exp(1i*Wp).*rotation;
    p3 = r2*exp(-1i*Wp).*rotation;
    p4 = r3*exp(1i*(Wp/2)).*rotation;
    p5 = r3*exp(-1i*(Wp/2)).*rotation;
    %NEW ADDED POLES
    p6 = 0.6.*conjRotation;
    p7 = r2*exp(1i*Wp).*conjRotation;
    p8 = r2*exp(-1i*Wp).*conjRotation;
    p9 = r3*exp(1i*(Wp/2)).*conjRotation;
    p10 = r3*exp(-1i*(Wp/2)).*conjRotation;
    %% 1st Requirment

    % Transform the ?fth order LPF in section 6 into a highpass ?lter by
    %rotating the pole-zero pattern by ?.
    %Generate the plots described in section 3 for your HPF.
    z = [z1 z2 z3 z4 z5 z6 z7 z8]
    p = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10]
    [NUM_COEFF,DEN_COEFF] = zp2tf(z.' ,p.',1);

    % figure('name','5th Order LPF - Magnitude Response');
    % [h, w]=freqz(NUM_COEFF ,DEN_COEFF  ,-Wp:0.01:Wp);
    % MagnitudeRespo = 20*log10(abs(h)); 
    % plot(w,MagnitudeRespo); 
    % y= MagnitudeRespo;
    % difference = range(y) ;
    % grid on
    % title({'Magnitude Response |H(\ite^{\omega t})|';['Passband Ripples =',num2str(difference),'dB'];['At r2 =',num2str(r2),]})
    % xlabel('Frequency (rad/sample)')
    % ylabel('Magnitude (dB)')

    %Generate the plots described in section 3 for your filter
    %-------------------------------------------------------
    %   1. Pole-zero plot and the unit circle in the Z-domain.
    %--------------------------------------------------------
    figure('name','5th Order - Pole/Zero');
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
end