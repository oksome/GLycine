cdef extern from "GL/gl.h":
    ctypedef int            GLint
    ctypedef unsigned int   GLenum
    ctypedef float          GLfloat
    ctypedef int            GLuint
    int GL_TRIANGLES
    int GL_COMPILE
    int GL_QUADS
    cdef void glBegin(GLenum mode)
    cdef void glEnd()
    cdef void glTranslatef(GLfloat x, GLfloat y, GLfloat z)
    cdef void glVertex3f(GLfloat x, GLfloat y, GLfloat z)
    cdef void glColor3f(GLfloat red, GLfloat green, GLfloat blue)
    cdef void glColor4f(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
    cdef void glPushMatrix()
    cdef void glPopMatrix()
    cdef void glCallList(GLint n)
    cdef GLint glGenLists(GLint n)
    cdef void glNewList(GLuint list, GLenum mode)
    cdef void glEndList()
    cdef void glRotated(GLfloat angle, GLfloat x, GLfloat y, GLfloat z)
