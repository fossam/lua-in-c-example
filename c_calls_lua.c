#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
compile this code with:
cc c_calls_lua.c -I/usr/include/lua5.1 -llua5.1 -o c_calls_lua
*/

int main()
{
    printf("understanding this program makes most sense if the lua program is open in another window.\n");
    lua_State *L = lua_open();
    luaL_openlibs(L);
    if ( luaL_loadfile(L, "start.lua") ) {
      printf("error: %s", lua_tostring(L, -1) );
      return -1;
    }
    const char *s = "a string from c";
    lua_pushstring(L, s);
    lua_setglobal(L, "passedvalue");
    if ( lua_pcall(L, 0, 0, 0) ) {
       printf("error: %s", lua_tostring(L, -1) );
       return -1;
    }

    printf ("message from the c program: we are going to call 'secondcounter' from lua. notice the value increases as in lua.\n");
    lua_getglobal(L, "secondcounter");
    lua_pcall(L, 0, 1, 0);
    printf("%s\n", lua_tostring(L, -1) );
    lua_pop(L, 1);

    lua_close(L);
    return 0;
}
