%Trabalho 02- Sistemas lineares
clear 
% Intervalos
Origem_1_eixo_X = 0;
Fim_da_origem_1_eixo_X = 200;
eixo_x = Origem_1_eixo_X:Fim_da_origem_1_eixo_X;
%Intervalo 2
eixo_x2 = Origem_1_eixo_X:229;

% 1°Questão)
%format long;
%format short;
g_n = (1.0*sin(0.2*pi*eixo_x));
k_n = (1.5*sin(0.5*pi*eixo_x));
p_n = (0.5*sin(0.8*pi*eixo_x));

sinal_resposta = g_n + k_n + p_n;
%x =  + (1.5*sin(0.2*pi*200)) + (0.5*sin(0.2*pi*200)); %Sinal Gerador

% Segunda questão
% 2)

x0=100;
y0=100;
width= 1200;
height= 500;
set(gcf,'position',[x0,y0,width,height])
h_n = zeros(1,30);

for i = 1:30
    if (i~=15)
        h_n(:,i) = (sin(0.3*pi*(i-15))./(pi*(i-15)));
        h_n(isnan(h_n)) = 0;
    else
        h_n(:,i) = 0.3;
    end
end   

i_2 = 1:i;

% plot(eixo_x,g_n);
% hold on;
% plot(eixo_x,k_n);
% hold on;
% plot(eixo_x,p_n);
% hold on;

%stem(n,x,'LineStyle','o','Color','red');
%Grafico questao 1
figure(1)
stem(eixo_x,sinal_resposta,'-','Color','red','LineWidth',0.5,'MarkerSize',3,'MarkerFaceColor','blue');
x0=-50;
y0=200;
width=550;
height=400;
set(gcf,'position',[x0,y0,width,height])
title('Sinais Somados');
xlabel('n');
ylabel('x[n]');
%Fim grafico questao 1

%Grafico questao 2
figure(2)
stem(i_2,h_n,'-','Color','black','LineWidth',1.5,'MarkerSize',4);
x1=500;
y1=200;
set(gcf,'position',[x1,y1,width,height])
title('Resposta ao impulso g[n]');
xlabel('n');
ylabel('x[n]');
%fim grafico questao 2

figure(3)
w = conv(h_n,sinal_resposta);
stem(eixo_x2,w,'-','Color','blue','LineWidth',1.0,'MarkerSize',2,'MarkerFaceColor','blue');
x2=1010;
y2=200;
set(gcf,'position',[x2,y2,width,height])
title('Convulução h[n] * x[n]');
xlabel('n');
ylabel('Amplitude');


%4) Questao:

%A filtragem destes sinais, neste caso, se trata de uma convolução
%aproximada de seus sinais de origem, uma vez que ela se restringe ao ponto
%n máximo de 230, ao invés de tender ao infinito (impossível de se mostrar
%computacionalmente)

%Ademais, uma convolução é, na prática, a operação de convolução envolve a soma dos produtos 
% dos valores correspondentes dos dois sinais em diferentes instâncias de tempo. 
% Pode-se obter o valor de saída em cada instante de 
% tempo x multiplicando-se e somando-se as amostras sobrepostas (comparação gráfica) 
% dos dois sinais. Onde, tem-se dois possíveis casos:
% Integral para sinais discretos (soma em intervalos relevantes)
% e soma dos infinitos termos para sinais contínuos (ou soma dos "n"
% primeiros termos para intervalos de interesse)

%Aplicações práticas de convolução estão aplicadas ao processamento e analise de
%sinais, onde pode-se estudar os efeitos que um sinal causa em outro.


