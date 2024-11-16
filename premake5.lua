project "NVRHI-Vulkan"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "On"

    targetdir "build/%{cfg.buildcfg}/"
    objdir "%{wks.location}/intermediate/ThirdParty/%{prj.name}"

    files 
    {
        "include/nvrhi/vulkan.h",
        "src/vulkan/**.h",
        "src/vulkan/**.cpp"
    }
	
    defines 
    {
        "NVRHI_WITH_RTXMU=1",
        "VK_USE_PLATFORM_WIN32_KHR",
        "NOMINMAX"
    }

    includedirs 
    {
        "include",
        "rtxmu/include",
        "thirdparty/Vulkan-Headers/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"
        symbols "Off"

project "NVRHI-D3D11"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "On"

    targetdir "build/%{cfg.buildcfg}/"
    objdir "%{wks.location}/intermediate/ThirdParty/%{prj.name}"

    files 
    {
        "include/nvrhi/d3d11.h",
        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        "src/d3d11/**.h",
        "src/d3d11/**.cpp"
    }
	
    defines 
    {
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    includedirs 
    {
        "include",
        "rtxmu/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"
        symbols "Off"

project "NVRHI-D3D12"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "On"

    targetdir "build/%{cfg.buildcfg}/"
    objdir "%{wks.location}/intermediate/ThirdParty/%{prj.name}"

    files 
    {
        "include/nvrhi/d3d12.h",
        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        "src/common/versioning.h",
        "src/d3d12/**.h",
        "src/d3d12/**.cpp"
    }
	
    defines 
    {
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    includedirs 
    {
        "include",
        "rtxmu/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"
        symbols "Off"

project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "On"

    targetdir "build/%{cfg.buildcfg}/"
    objdir "%{wks.location}/intermediate/ThirdParty/%{prj.name}"

    files 
    {
        "include/nvrhi/nvrhi.h",
        "include/nvrhi/utils.h",
        "include/nvrhi/common/**.h",
        "src/nvrhi/common/**.cpp",
        "src/validation/**.h",
        "src/validation/**.cpp",
        "tools/nvrhi.natvis"
    }
	
    defines 
    {
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    links 
    {
        "NVRHI-Vulkan",
        "NVRHI-D3D11",
        "NVRHI-D3D12"
    }

    includedirs 
    {
        "include",
        "rtxmu/include"
    }

    filter "configurations:Debug"
        runtime "Debug" 
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"
        symbols "Off"