# Autonomous Dashboard Diagnostics

The samples in this folder go along with the following blog posts and webinar on [Webinar Nov 15, 2022](https://www.tmssoftware.com/site/tmswebacademy.asp?id=145).

1. Blog (read here) [Part 1 of 3 ](https://www.tmssoftware.com/site/blog.asp?post=1005) - Object Inspection and modification using Marshal 

[![Watch the video](https://img.youtube.com/vi/394wOxhvi5Y/hqdefault.jpg)](https://youtu.be/394wOxhvi5Y)

2. Blog (read here) [Part 2 of 3 ](https://www.tmssoftware.com/site/blog.asp?post=1008)- Dataset Insepection and SQL Queries using Marshal

[![Watch the video](https://img.youtube.com/vi/gafTIxVz4nY/hqdefault.jpg)](https://youtu.be/gafTIxVz4nY)

3. Blog (read here) [Part 3 of 3](https://www.tmssoftware.com/site/blog.asp?post=1014) - Custom inspectors and Marshal SDK

[![Watch the video](https://img.youtube.com/vi/WcJ9gEcIWHA/hqdefault.jpg)](https://youtu.be/WcJ9gEcIWHA)

[Webinar Nov 15, 2022](https://www.tmssoftware.com/site/tmswebacademy.asp?id=145)  will cover the 3 topics plus more live.

Samples are provided for you to analyze what is required to implement Marshal. The 3 options are detailed below.

## Foundation App - Dashboard

The demo dashboard is written with [TMS FNC Chart 2.5](https://www.tmssoftware.com/site/tmsfncchart.asp) and [TMS FNC UI Pack](https://www.tmssoftware.com/site/tmsfncuipack.asp) components. To compile you will need a licensed version or a demo of these components. This is the base form for the demo, VCL and FMX respectively.  Marshal is added seperately using form inheritance explained in the following section.

* FMX [frmFncChartGridFMXU.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarFMX/frmFncChartGridFMXU.pas) Compiled [DemoFMX](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FncChartFMXBase.exe)
* VCL [frmFncChartGridVCLU.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarVCL/frmFncChartGridVCLU.pas) Compiled [DemoVCL](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FNChartVCLBase.exe)

## Marshal Implementation Options

Marshal has 3 possible [implementation options](https://swiftexpat.com/marshal/marshal-implementation-options.html), the samples are written to demonstrate the changes necessary to your form depending on which option you choose to implement. These samples inherit the base form, so the only code in the forms below is the code necessary to implement Marshal and the custom inspector for FNC Chart.

1. Marshal pure code (no component, use an existing event handler)
2. Marshal button control (Button component)
3. Marsahl App Inspector (auto open)

**Compiled versions are available in the releases for you to try out the different options.**

### Pure Code

This samples include a simple 3 click counter to guard against mis-use.  The event handlers are overriden from the base form on legend item click events.

* FMX - [frmFncChartGridFMXUCoded.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarFMX/frmFncChartGridFMXUCoded.pas) Compiled [DemoFMXCoded](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FncChartFMXMarshalCoded.exe)
* VCL - [frmFncChartGridVCLUCoded.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarVCL/frmFncChartGridVCLUCoded.pas) Compiled [DemoVCLCoded](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FNChartVCLMarshalCoded.exe)

### Marshal Button Control

These are forms with only the Marshal buton control.

* FMX - [frmFncChartGridFMXUMB.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarFMX/frmFncChartGridFMXUMB.pas) Compiled [DemoFMXButton](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FncChartFMXMarshalButton.exe)
* VCL - [frmFncChartGridVCLUMarshalButton.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarVCL/frmFncChartGridVCLUMarshalButton.pas) Compiled [DemoVCLButton](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FNChartVCLMarshalButton.exe)

### Marshal App Inspector

The following project files apply to the App Inspector Option

* FMX - [frmFncChartGridFMXUAI.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarFMX/frmFncChartGridFMXUAI.pas) Comiled [DemoFMXAppInsp](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FncChartFMXAppInspector.exe)
* VCL - [frmFncChartGridVCLUAppInspector.pas](https://github.com/SwiftExpat/RunTime-ToolKit/blob/main/Samples/FNCChart/WebinarVCL/frmFncChartGridVCLUAppInspector.pas) Compiled [DemoVCLAppInsp](https://github.com/SwiftExpat/RunTime-ToolKit/releases/download/SeptBlog/FNChartVCLAppInspector.exe)
