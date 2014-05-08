cimport opengl as gl

cdef class Model:

    def __init__(self):
        pass

    cpdef show(self):
        gl.glPushMatrix()
        self.draw()
        gl.glPopMatrix()

    cpdef draw(self):
        gl.glBegin(gl.GL_QUADS)
        gl.glVertex3f(10, 0, 10)
        gl.glVertex3f(10, 0, -10)
        gl.glVertex3f(-10, 0, -10)
        gl.glVertex3f(-10, 0, 10)
        gl.glEnd()


cdef class Object(list):
    cdef public double x
    cdef public double y
    cdef public double z

    def __init__(self, models=[], position=None):
        super(Object, self).__init__(models)
        self.x, self.y, self.z = position if position else (0.0, 0.0, 0.0)

    cpdef draw(self):
        gl.glPushMatrix()
        gl.glTranslatef(self.x, self.y, self.z)

        for model in self:
            model.draw()

        gl.glPopMatrix()

    cpdef move(self):
        pass


cdef class Camera:
    # position
    cdef public double x
    cdef public double y
    cdef public double z
    # speed
    cdef public double dx
    cdef public double dy
    cdef public double dz
    # orientation
    cdef public double ox
    cdef public double oy
    cdef public double oz
    # rotation
    cdef public double rx
    cdef public double ry
    cdef public double rz

    def __init__(self, position=None, speed=None, orientation=None,
                 rotation=None):
        self.x, self.y, self.z = position if position else (0.0, 0.0, 0.0)
        self.dx, self.dy, self.dz = speed if speed else (0.0, 0.0, 0.0)
        self.ox, self.oy, self.oz = orientation if orientation else (0.0, 0.0, 0.0)
        self.dx, self.dy, self.dz = rotation if rotation else (0.0, 0.0, 0.0)

    cpdef use(self):
        gl.glRotated(self.ox, 1, 0, 0)
        # gl.glRotated(self.oy, 0, 1, 0)
        gl.glTranslatef(self.x, self.y, self.z)

    cpdef move(self):
        self.x += self.dx
        self.y += self.dy
        self.z += self.dz
        self.ox += self.rx
        self.oy += self.ry
        self.oz += self.rz
