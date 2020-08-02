# Python stubs generated by omniidl from echo.idl
# DO NOT EDIT THIS FILE!

import omniORB, _omnipy
from omniORB import CORBA, PortableServer
_0_CORBA = CORBA


_omnipy.checkVersion(4,2, __file__, 1)

try:
    property
except NameError:
    def property(*args):
        return None


#
# Start of module "EchoApp"
#
__name__ = "EchoApp"
_0_EchoApp = omniORB.openModule("EchoApp", r"echo.idl")
_0_EchoApp__POA = omniORB.openModule("EchoApp__POA", r"echo.idl")


# interface Echo
_0_EchoApp._d_Echo = (omniORB.tcInternal.tv_objref, "IDL:EchoApp/Echo:1.0", "Echo")
omniORB.typeMapping["IDL:EchoApp/Echo:1.0"] = _0_EchoApp._d_Echo
_0_EchoApp.Echo = omniORB.newEmptyClass()
class Echo :
    _NP_RepositoryId = _0_EchoApp._d_Echo[1]

    def __init__(self, *args, **kw):
        raise RuntimeError("Cannot construct objects of this type.")

    _nil = CORBA.Object._nil


_0_EchoApp.Echo = Echo
_0_EchoApp._tc_Echo = omniORB.tcInternal.createTypeCode(_0_EchoApp._d_Echo)
omniORB.registerType(Echo._NP_RepositoryId, _0_EchoApp._d_Echo, _0_EchoApp._tc_Echo)

# Echo operations and attributes
Echo._d_echoString = (((omniORB.tcInternal.tv_string,0), ), ((omniORB.tcInternal.tv_string,0), ), None)

# Echo object reference
class _objref_Echo (CORBA.Object):
    _NP_RepositoryId = Echo._NP_RepositoryId

    def __init__(self, obj):
        CORBA.Object.__init__(self, obj)

    def echoString(self, *args):
        return self._obj.invoke("echoString", _0_EchoApp.Echo._d_echoString, args)

omniORB.registerObjref(Echo._NP_RepositoryId, _objref_Echo)
_0_EchoApp._objref_Echo = _objref_Echo
del Echo, _objref_Echo

# Echo skeleton
__name__ = "EchoApp__POA"
class Echo (PortableServer.Servant):
    _NP_RepositoryId = _0_EchoApp.Echo._NP_RepositoryId


    _omni_op_d = {"echoString": _0_EchoApp.Echo._d_echoString}

Echo._omni_skeleton = Echo
_0_EchoApp__POA.Echo = Echo
omniORB.registerSkeleton(Echo._NP_RepositoryId, Echo)
del Echo
__name__ = "EchoApp"

#
# End of module "EchoApp"
#
__name__ = "echo_idl"

_exported_modules = ( "EchoApp", )

# The end.