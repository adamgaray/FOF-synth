% This script produces vowel sounds.
% v = {1, 2, 3, 4, 5} for {a, e, i, o, u}

v = 4;
fs = 44100;

betas = [0.00882 0.00662 0.00662 0.01323 0.00441];
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
phis = [0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0;
    0 0 0 pi 0;
    0 0 0 0 0];

F1 = FOF(freqs(v,1), bws(v,1), amps(v, 1), betas(1), phis(v, 1), fs);
F2 = FOF(freqs(v,2), bws(v,2), amps(v, 2), betas(2), phis(v, 2), fs);
F3 = FOF(freqs(v,3), bws(v,3), amps(v, 3), betas(3), phis(v, 3), fs);
F4 = FOF(freqs(v,4), bws(v,4), amps(v, 4), betas(4), phis(v, 4), fs);
F5 = FOF(freqs(v,5), bws(v,5), amps(v, 5), betas(5), phis(v, 5), fs);
F = FormantArray(F1, F2, F3, F4, F5);

F = FOFsum(F, 130, 200, fs);

audiowrite("out1.wav", F, fs);