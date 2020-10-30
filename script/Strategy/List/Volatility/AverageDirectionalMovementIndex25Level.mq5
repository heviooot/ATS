//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include "..\..\..\Indicators\AverageDirectionalMovementIndex.mq5";
class AverageDirectionalMovementIndex25Level {
 private:
   int               signal;                             // 1 = volatile, 2 = not volatile, 0 = default
   void              setSignal(int signal);
   void              checkSignal();
 public:
                     AverageDirectionalMovementIndex25Level();       //set default value
                    ~AverageDirectionalMovementIndex25Level();
   int               getSignal();
};
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
AverageDirectionalMovementIndex25Level::AverageDirectionalMovementIndex25Level(void) {
//Print("AverageDirectionalMovementIndex25Level, constructor");
   setSignal(0);
   checkSignal();
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
AverageDirectionalMovementIndex25Level::~AverageDirectionalMovementIndex25Level(void) {
   setSignal(0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AverageDirectionalMovementIndex25Level::setSignal(int signal) {
   if(signal == 1 || signal == 2 || signal == 0) {
      this.signal = signal;
   } else {
      //Print("Invalid Signal Input");
   }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int AverageDirectionalMovementIndex25Level::getSignal(void) {
   if(signal == 1 || signal == 2) {
      return signal;
   } else if(signal == 0) {
      //Print("No Signal found");
      return -1;
   } else {
      //Print("Invalid Signal");
      return -1;
   }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AverageDirectionalMovementIndex25Level::checkSignal(void) {
   AverageDirectionalMovementIndex adx(PERIOD_H1, 14); // v2.3 Ganti M15
   double adxLine = adx.getValue(0,0);

   if(adxLine >= 25) {
      setSignal(1);
   } else {
      setSignal(0);
   }

}
//+------------------------------------------------------------------+
