# Autonomous Dashboard Diagnostics: 3 of 3 - Visual Impact

Your presentation begins in 8 minutes and you realize the bar chart would be easier to read with data labels. Marshal custom inspectors enable detail design tools to be used at runtime to enhance complex control configurations.

Join us in a live webinar on Nov 15 where I use Marshal to resolve these issues and explore other diagnostics.

This post resumes diagnostics at 9:52 before the 10:00 presentation. If you missed part 1 or part 2, please take a look at here.

## 9:52

You open the inspector for FNC Charts and click on the show editor button which launches the GUI designer. You select the series tab and then select the labels tab.  Adding the check mark to visible shows the labels for the bar. You do the same for each of the 3 series.

## 9:54

Visual impact is about the small details and here you have created a problem, the labels below are formatted with money and no decimal places. To ensure they match you inspect the chart below and copy the label format. Now you tab back over to the barchart and launch the editor again to apply the format to the series.

## 9:56

You save a copy of the chart to PDF just to ensure you have enough details to document the optimization. You export the component to be able to compare the DFM later.

## Custom Inspectors = Smart Diagnostics

Marshal internal inspectors are written using a plugin model, allowing you to deliver capabilites based on your component type. The FNC Chart Editor shown in this demo is a custom inspector for the TTMSFNCChart type. Source code is available in GitHub.

TMS FNC Chart is a complex component which has a dedicated editor for design. Having the same editor available at runtime is more efficent than using Object Plus to inspect deeply nested properties. The custom inspector allows you to use the best tool for the component and still have Object Plus for inspecting other properties. The inspector provides higher level features:

* FNC Chart Editor. Dedicated design tool for FNC Charts.
* Export the chart to PDF. PDF is a good way to capture and share an image of the individual component. FNC Core provides TTMSFNCGraphicsPDFIO that automatically caputres the component.
* Chart Image cache. With each change the image of the chart is captured and displayed in the list.
* Adapter verification. The status bar demonstrates how automated checks can be used to provide a quick visual of common mis-configurations. Verifying all of the adapter dependencies is peformed using an nested if statement to ensure nothing is missed.

Implementing a custom inspector involves 4 steps:

1. Define a transform class to identify the object type for the inspector (TSETransformFNCChart)
2. Create a tool class to allow the transform to assign a tool to the class (TSESITFNCChart)
3. Create a inspector instance to allow the UI to initialize a the tool when you click on the node in the tree (TSERTTKPluginFNCChartTool)
4. Initialize the inspector to add it to Marshal's registry

The instance for this inspector is a frame, allowing use of the components from the tool pallet, that exposes a few public procedures for the buttons and a few UI components to visualize the result of the editor. The frame unit also contains the transform and tool mapping classes.
