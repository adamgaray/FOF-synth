function y = proj_synth(notes, outfile, fs)
% note: [vowel, freq, duration]
% notes: [note1; note2; ...]

% AvE mArIA: [1 174.61 360; 
%             2 164.81 80;
%             1 174.61 40; 
%             3 220    440; 
%             3 196    40;
%             1 174.61 240]

betas = [0.00882 0.00662 0.00662 0.001323 0.00441];
freqs = [600 1040 2250 2450 2750;
    400 1620 2400 2800 3100;
    250 1750 2600 3050 3340;
    400 750 2400 2600 2900;
    350 600 2400 2675 2950];
amps = [0 -7 -9 -9 -20;
    0 -12 -9 -12 -18;
    0 -30 -16 -22 -28;
    0 -11 -21 -20 -40;
    0 -20 -32 -28 -36];
amps = amps / 20;
amps = 10.^amps;
bws = [60 70 110 120 130;
    40 80 100 120 120;
    60 90 100 120 120;
    40 80 100 120 120;
    40 80 100 120 120];

y = [];

for i = 1:size(notes,1)

    note = notes(i,:);
    v = note(1);
    F1 = FOF(freqs(v,1), bws(v,1), amps(v, 1), betas(1), 0, fs);
    F2 = FOF(freqs(v,2), bws(v,2), amps(v, 2), betas(2), 0, fs);
    F3 = FOF(freqs(v,3), bws(v,3), amps(v, 3), betas(3), 0, fs);
    F4 = FOF(freqs(v,4), bws(v,4), amps(v, 4), betas(4), 0, fs);
    F5 = FOF(freqs(v,5), bws(v,5), amps(v, 5), betas(5), 0, fs);
    F = FormantArray(F1, F2, F3, F4, F5);
    F = FOFsum(F, note(2), note(3), fs);
    y = [y F];

end

audiowrite(outfile, y, fs)
end



