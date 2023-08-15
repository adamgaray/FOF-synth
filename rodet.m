% This script uses the parameters in Rodet's 1984 paper.

fs = 44100;

F1 = FOF(260, 70, 0.029, 0.002, 0, fs);
F2 = FOF(1764, 45, 0.021, 0.0015, 0, fs);
F3 = FOF(2510, 80, 0.0146, 0.0015, 0, fs);
F4 = FOF(3090, 130, 0.011, 0.003, 0, fs);
F5 = FOF(3310, 150, 0.0061, 0.001, 0, fs);
F = FormantArray(F1, F2, F3, F4, F5);
Fsum = sum(F);

F = FOFsum(F, 130, 200, fs);

audiowrite("out.wav", F, fs);