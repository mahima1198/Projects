import pygame,random, sys ,os,time
from pygame.locals import *

#Initalize
WINDOWWIDTH = 1000
WINDOWHEIGHT = 600
white = (0,0,0)
x =  (WINDOWWIDTH)*0.30
y = (WINDOWHEIGHT)*0
clock = pygame.time.Clock()
alphabets=pygame.image.load('alphabets.jpg')
A=pygame.image.load('A.png')
B=pygame.image.load('B.png')
C=pygame.image.load('C.png')
D=pygame.image.load('D.png')
E=pygame.image.load('E.png')
F=pygame.image.load('F.png')
G=pygame.image.load('G.png')
H=pygame.image.load('H.png')
I=pygame.image.load('I.png')
J=pygame.image.load('J.png')
K=pygame.image.load('K.png')
L=pygame.image.load('L.png')
M=pygame.image.load('M.png')
N=pygame.image.load('N.png')
O=pygame.image.load('O.png')
P=pygame.image.load('P.png')
Q=pygame.image.load('Q.png')
R=pygame.image.load('R.png')
S=pygame.image.load('S.png')
T=pygame.image.load('T.png')
U=pygame.image.load('U.png')
V=pygame.image.load('V.png')
W=pygame.image.load('W.png')
X=pygame.image.load('X.png')
Y=pygame.image.load('Y.png')
Z=pygame.image.load('Z.png')
showDisplay = pygame.display.set_mode((WINDOWWIDTH ,WINDOWHEIGHT))
pygame.init()
pygame.font.init()

#Functions
def terminate():
    pygame.quit()
    sys.exit()


pygame.display.set_caption('Fun with Alphabets')
#Source Code
while True:
    for event in pygame.event.get():
            if event.type == QUIT:
                terminate()
            if event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    terminate()
                if event.key == ord('a'):
                        showDisplay.blit(A,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('a.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('b'):
                        showDisplay.blit(B,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('b.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('c'):
                        showDisplay.blit(C,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('c.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('d'):
                        showDisplay.blit(D,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('d.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('e'):
                        showDisplay.blit(E,(170,300))
                        pygame.mixer.music.load('e.wav')
                        pygame.mixer.music.play(0)
                        pygame.display.update()
                        time.sleep(2)
                if event.key == ord('f'):
                        showDisplay.blit(F,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('f.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('g'):
                        showDisplay.blit(G,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('g.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('h'):
                        showDisplay.blit(H,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('h.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('i'):
                        showDisplay.blit(I,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('i.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('j'):
                        showDisplay.blit(J,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('j.wav')
                        pygame.mixer.music.play(0) 
                        time.sleep(2)
                if event.key == ord('k'):
                        showDisplay.blit(K,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('k.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('l'):
                        showDisplay.blit(L,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('l.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('m'):
                        showDisplay.blit(M,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('m.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('n'):
                        showDisplay.blit(N,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('n.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('o'):
                        showDisplay.blit(O,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('o.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('p'):
                        showDisplay.blit(P,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('p.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('q'):
                        showDisplay.blit(Q,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('q.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('r'):
                        showDisplay.blit(R,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('r.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('s'):
                        showDisplay.blit(S,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('s.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('t'):
                        showDisplay.blit(T,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('t.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('u'):
                        showDisplay.blit(U,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('u.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('v'):
                        showDisplay.blit(V,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('v.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('w'):
                        showDisplay.blit(W,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('w.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('x'):
                        showDisplay.blit(X,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('x.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('y'):
                        showDisplay.blit(Y,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('y.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                if event.key == ord('z'):
                        showDisplay.blit(Z,(170,300))
                        pygame.display.update()
                        pygame.mixer.music.load('z.wav')
                        pygame.mixer.music.play(0)
                        time.sleep(2)
                        
                        
    clock.tick(30)
    showDisplay.fill(white)
    showDisplay.blit(alphabets,(x,y))
    pygame.display.update()
   

    
  
