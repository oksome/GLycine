from __future__ import print_function

import time
from math import sin, cos, radians

from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
from ctypes import *

from model import Model, Object, Camera


class SphereModel(Model):

    def draw(self):
        glColor4f(0.2, 0.2, 0.6, 0.5)
        # glutSolidSphere(0.2, 10, 10)
        glutWireSphere(0.2, 10, 10)

# A general OpenGL initialization function.  Sets all of the initial parameters.
def InitGL(Width, Height):              # We call this right after our OpenGL window is created.
    glClearColor(0.0, 0.0, 0.0, 0.0)    # This Will Clear The Background Color To Black
    glClearDepth(1.0)                   # Enables Clearing Of The Depth Buffer
    glDepthFunc(GL_LESS)                # The Type Of Depth Test To Do
    glEnable(GL_DEPTH_TEST)             # Enables Depth Testing
    glShadeModel(GL_SMOOTH)             # Enables Smooth Color Shading
    glEnable(GL_BLEND)
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

    glEnable(GL_LINE_SMOOTH)
    glEnable(GL_POINT_SMOOTH)
    glEnable(GL_POLYGON_SMOOTH)
    glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST)

    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()                    # Reset The Projection Matrix
                                        # Calculate The Aspect Ratio Of The Window
    gluPerspective(45.0, float(Width)/float(Height), 0.1, 100.0)

    glMatrixMode(GL_MODELVIEW)


o = Object(models=(SphereModel(),))
o2 = Object(models=(SphereModel(),), position=(1.0, 0.0, 0.0))
world = Object(models=(o, o2))

# cam = Camera(position=(0.0, 0.0, -20.0))
cam = Camera(position=(0.0, 0.0, -5.0))


def renderScene():
    t0 = time.time()

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()

    cam.use()
    world.draw()

    cam.move()
    world.move()

    # gluLookAt(
    #     cos(since/3.) * 20, sin(since/3.) * 20, r,
    #     # 0.0, -10.0, 10.0,
    #     0.0, 0.0, 0.0,
    #     0, 0, 1)
    # glRotate(90, 1, 0, 0)

    glutSwapBuffers()

    dt = time.time() - t0
    time.sleep(max((1/60.) - dt, 0))
    # print(1 / dt)


def keyPressed(key, mouseX, mouseY):
    global dr
    global cam_speed
    global cam_rotation
    key = key.decode('utf-8')
    print(key, mouseX, mouseY)
    if key == 's':
        cam.dz += 0.1
    elif key == 'w':
        cam.dz -= 0.1
    elif key == 'q':
        cam.rx -= 0.2
    elif key == 'x':
        cam.rx += 0.2
    elif key == '\x1b':  # ESC
        import sys
        sys.exit()


def keyUp(key, mouseX, mouseY):
    print('up', key, mouseX, mouseY)
    global dr


import sys
#glutInit()
glutInit(sys.argv)  # Python3: needs arguments
# glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH)
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH | GLUT_MULTISAMPLE)
# glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_ALPHA)
glutInitWindowPosition(100, 100)
glutInitWindowSize(800, 600)

mainWindow = glutCreateWindow(b"Garden")

glutDisplayFunc(renderScene)
glutIdleFunc(renderScene)
glutKeyboardFunc(keyPressed)
glutKeyboardUpFunc(keyUp)

InitGL(640, 480)

#import threading

#t = threading.Thread(target=glutMainLoop)
glutMainLoop()
