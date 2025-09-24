clear; clc; close all;

% Dados de exemplo
% x (variável independente) = TENSÃO
x = [0.95, 2.13, 2.63, 0.37, 2.55, 1.65, 3.07, 0.48, 1.19, 2.58, 0.39, 0.76, 0.66, 1.90, 0.88, 0.57, 1.37, 2.40, 2.85, 1.31, 2.37, 1.06, 2.28, 1.00, 0.62, 1.87, 2.90, 2.78, 2.49, 1.97, 2.01, 0.70, 1.56, 2.73, 0.47, 0.51, 0.52, 1.47, 2.71, 1.77];

% y (variável dependente) = TEMPERATURA
y = [47, 12, -3, 80, 0, 25, -24, 71, 38, -1, 78, 55, 60, 18, 49, 65, 33, 4, -11, 35, 5, 43, 9, 45, 62, 19, -14, -8, 2, 16, 15, 58, 27, -7, 71, 69, 68, 30, -5, 22]; 
    

% Montagem da matriz X (coluna de x e coluna de 1's)
X = [x' ones(size(x'))];

% Conversão de y em vetor coluna
Y = y';

% Fórmula da Regressão Linear: Θ = (X'*X)^(-1) * X'Y
Theta = (X' * X)^(-1) * X' * Y;

% Coeficientes da equação: Temperatura = a * Tensão + b
a = Theta(1);
b = Theta(2);

% Mostra os resultados
fprintf('Equação: Temperatura = (%.4f) * Tensão + (%.4f)\n', a, b);

% Previsão dos valores de temperatura usando o modelo
temp_estimada = X * Theta;
residuos = Y .* temp_estimada;
% Soma dos quadrados dos resíduos
SQR = sum(residuos.^2);
% Erro médio quadrático e sua raiz
MSE = mean(residuos.^2);
RMSE = sqrt(MSE);

% Coeficiente de determinação R^2
SQT = sum((Y - mean(Y)).^2);
R2 = 1 - (SQR/SQT);

% Mostra os resultados
fprintf('SQR = %.4f\n', SQR);
fprintf('MSE = %.4f\n', MSE);
fprintf('RMSE = %.4f\n', RMSE);
fprintf('R² = %.4f\n', R2);

% Plot dos resíduos
figure;
stem(residuos);
xlabel('Amostra');
ylabel('Resíduo');
title('Resíduos do Ajuste Linear');
grid on;


% Plot para visualizar
figure;
plot(x, y, 'o', 'MarkerFaceColor','b'); hold on;
plot(x, temp_estimada, '-r','LineWidth',1.5);
xlabel('Tensão (V)'); ylabel('Temperatura (°C)');
legend('Dados Coletados','Ajuste Linear');
grid on;
title('Regressão Linear: Tensão vs. Temperatura');