% Intervalo
n_0 = 0;
n_n = 40;
n = n_0:n_n;
nnnn = -5:40;

% Com a função degrau unitário teremos apenas valores positivos de n para 
% que x seja diferente de 0, já que u[n] = 1 para n >= 0 e u[n] = 0 para
% n < 0:

% Sinal x[n]:
x = ((1/4).^n) .* (n >= 0);

% Sinal w[n]:
w = x(end:-1:1); % inverte a ordem de x
n_aux = (-1)*n; % transformando em negativos
n_aux = n_aux(end:-1:1); % invertendo vetor de negativos


% Definição do sinal g[n]
g = x((n+5) >= 0); % adiciona um atraso de 5 amostras em x e trunca o sinal
naux = nnnn(6:end);

figure(1)
% stem(n,x,'LineStyle','o','Color','red');
stem(n,x,'s','Color', 'red','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','red');
hold on;
stem(n_aux,w,'o','Color', 'green','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','green');
% stem(n_aux,w,'o','Color', 'green');
hold on;
stem(naux-5,g,'d','Color', 'blue','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','blue');
% stem(naux-5,g,'d','Color', 'blue');
hold off;
axis([-45 45 -0.1 1.1]);

title('x[n] = ((1/4)^n)*u[n], w[n] = x[-n], g[n] = x[n+5]');
xlabel('n');
ylabel('x[n], w[n], g[n]');
