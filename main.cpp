#include "raylib.h"
// #include "ParticleEmitter.h"
// #include "Profiler.h"
// #include "Tween.h"

// #define PLATFORM_WEB

#if defined(PLATFORM_WEB)
    #include <emscripten.h>
#endif

int win_width = 400;
int win_height = 400;

void InitGame();
void DrawGame();
void UpdateGame(float dt);
void UpdateDrawLoop();

int main()
{
    InitGame();

    #if defined(PLATFORM_WEB)
        emscripten_set_main_loop(UpdateDrawLoop, 0, 1);
    #else
        while(!WindowShouldClose())
        {
            UpdateDrawLoop();
        }
    #endif
}

void InitGame()
{
    SetTraceLogLevel(LOG_NONE);
    InitWindow(win_width, win_height, "gam");
}

void UpdateGame(float dt)
{

}

void DrawGame()
{
    BeginDrawing();

    ClearBackground(BLACK);

    EndDrawing();
}

void UpdateDrawLoop()
{
    UpdateGame(GetFrameTime());
    DrawGame();
}