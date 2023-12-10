import time
import board
import digitalio

data_out = digitalio.DigitalInOut(board.GP0)
data_out.direction = digitalio.Direction.OUTPUT

global x
global n

x = [1,0,1,1]
n = len(x)
f = 50 # input frequency

def dataNext():
    n = (n+1)%n
    return x[n]

while True:
    b = dataNext()
    if b==1:
        print('Line High')
        data_out.value = True
    else:
        print('Line Low')
        data_out.value = False
    time.sleep(1/f)

