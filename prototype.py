global x
global n

x = [1,0,0,1]
n = len(x)
f = 50 # input frequency
m = 0

def dataNext(n):
    n = (n+1) % n
    return x[n]

while True:
    m = (m + 1) % n
    b = x[m]
    if b==1:
        print('Line High')
        data_out.value = True
    else:
        print('Line Low')
        data_out.value = False
    time.sleep(0.01)