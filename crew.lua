file = "main.cpp"
run = ""
emsdk_path = "C:\\emsdk\\emsdk_env.bat"

os.execute(emsdk_path)

function addCommand(command)
    if run == "" then
        run = command
    else
        run = run .. "&&" .. command
    end
end

function exists(path)
    code = os.execute("if exist " .. path .. " \\NUL (exit 0) else (exit 1)")
    if code == 0 then
        return false
    else
        return true
    end
end

if (exists("build") == false) then
    os.execute("mkdir build")
    os.execute("cd build && cmake -G \"MinGW Makefiles\" ..")
end

if (exists("build_w") == false) then
    os.execute("mkdir build_w")
    os.execute("cd build_w&&" .. emsdk_path .. "&&emcmake cmake -G \"MinGW Makefiles\" ..")
end

for line in io.lines(file) do
    if (string.find(line, "#define PLATFORM_WEB")) then
        if (string.find(line, "//")) then
            addCommand("cd build")
            addCommand("mingw32-make")
            -- addCommand("cd ..")
            -- addCommand("cd build_w")
            -- addCommand("mingw32-make")
        else
            addCommand("cd build_w")
            addCommand("mingw32-make")
            -- addCommand("cd ..")
            -- addCommand("cd build")
            -- addCommand("mingw32-make")
        end
        break
    end
end

os.execute(run)

io.write()