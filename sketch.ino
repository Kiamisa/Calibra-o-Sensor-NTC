#include <math.h>
/*
##################################################################################
                    CALIBRAÇÃO SENSOR NTC USANDO ESP32
                  UEMA - UNIVERSIDADE ESTADUAL DO MARANHÃO
                      DISCIPLINA - SISTEMAS EMBARCADOS
                  ALUNO - SILAS HENRIQUE DE MATOS CERQUEIRA

##################################################################################

*/
/*
void setup() {
  Serial.begin(115200);
  pinMode(34, INPUT);
}

void loop() {
  int valorADC = analogRead(34);

  float tensao = (valorADC / 4095.0) * 3.3;

  Serial.print("Valor ADC -> ");
  Serial.print(valorADC);
  Serial.print(" | Tensão -> ");
  Serial.print(tensao, 2);
  Serial.println(" V");

  delay(2000);
}
*/
const float M = -33.5827;
const float B = 83.1106;

void setup() {
  Serial.begin(115200);
  pinMode(34, INPUT);
}

void loop() {
  int valorADC = analogRead(34);

  if (valorADC >= 4095) {
    Serial.println("Leitura ADC máxima, verifique o circuito.");
    delay(2000);
    return;
  }
  
  float tensao_adc = (valorADC / 4095.0) * 3.3;
  float temp_c = M * tensao_adc + B;
  
  Serial.print("ADC: ");
  Serial.print(valorADC);
  Serial.print(" | Tensão no pino: ");
  Serial.print(tensao_adc, 2);
  Serial.print(" V");
  Serial.print(" | Temp. Calculada (Linear): ");
  Serial.print(temp_c, 2);
  Serial.println(" °C");

  delay(2000);
}