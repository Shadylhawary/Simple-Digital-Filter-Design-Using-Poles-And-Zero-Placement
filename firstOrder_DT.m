function first = firstOrder_DT(p1)
%%          Adjusting Variables
    %p1 = a = 0.6
    %% 1st Requierment:
    % Generate the figures described in section 3 for a = 0.6 and a = -0.6
    %-------------------------------------------------------
    %   1. Pole-zero plot and the unit circle in the Z-domain.
    %--------------------------------------------------------
    figure('name','1st Order - Pole/Zero Plot');
    NUM_COEFF = 1;   
    DEN_COEFF = [1 -p1];
    zplane(NUM_COEFF ,DEN_COEFF); %we can add zeros and poles directly to zplane
    grid on
    legend on
    legend ( 'Zero' , 'Pole' , 'Unit Circle')
    title('Pole/Zero Plot')
    %-------------------------------------------------------
    %   2. Magnitude response of the filter in dB in the frequency range
    %-------------------------------------------------------
    figure('name','1st Order - Magnitude Response');
    freqRange = -pi:0.1:pi;
    [h,w] = freqz(NUM_COEFF, DEN_COEFF, freqRange);
    plot(w,20*log((abs(h))));
    grid on
    xlabel('Frequency Rad/Sample')
    ylabel('Magnitude dB')
    title('Magnitude Response')
    %-------------------------------------------------------
    %   3. Phase response of the Filter in the frequency range
    %-------------------------------------------------------
    figure('name','1st Order - Phase Respone');
    [phi,w]=phasez(NUM_COEFF ,DEN_COEFF ,freqRange);
    plot(w,phi);  
    grid on
    title('Phase Respone')
    xlabel('Frequency (rad/sample)')
    ylabel('Phase (rad)')
    %-------------------------------------------------------
    %   4. Group Delay of the filter in frequency range
    %-------------------------------------------------------
    figure('name', '1st Order - Group Delay');
    groupDelay = grpdelay(NUM_COEFF, DEN_COEFF, freqRange);
    plot(freqRange,groupDelay);
    grid on
    title('Group Delay');
    xlabel('Frequency (rad/sample');
    ylabel('Group Delay');
    %-------------------------------------------------------
    %   5. Impulse response of the Filter
    %-------------------------------------------------------
    figure('name','1st Order - Impulse Respone');
    impz(NUM_COEFF ,DEN_COEFF);
    grid on
    title('Impulse Respone')
    xlabel('Samples')
    ylabel('Amplitude')
    %======================================================================
end 

