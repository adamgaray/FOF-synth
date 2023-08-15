function y = FOF(fc, BW, A, attack, phi, fs)

omega = 2*pi*fc;
beta = pi/attack;
alpha = BW * pi;

FormantLength = (-1)*log(0.001)/alpha;  % T60 decay

Ts=1/fs;
n = (0:Ts:FormantLength);

y = zeros(1,length(n));
n_attack = n(1:floor(pi/beta/Ts));
n_rest = n(ceil(pi/beta/Ts):end);

y(1:floor(pi/beta/Ts)) = (0.5 * A) .* (1-cos(beta.*n_attack)) .* exp((-1)*alpha.*n_attack) .* sin(omega.*n_attack+phi);
y(ceil(pi/beta/Ts):(length(n))) = A * exp((-1)*alpha.*n_rest) .* sin(omega.*n_rest+phi);

end