# Sneak Peek - Marshal support for TMS Web Core

In a recent webinar, a user requested Marshal for the TMS WEB Core environment. Most of the migration is complete and I have prepared a demo to preview Marshal, the interface remains the same thanks to the FNC UI Pack controls.  I also share some resources found during migration and a summary of the migration approach.

Marshal, an instrumentation SDK, provides an interface to debug and modify components at runtime. Structure navigation of forms, data modules and components is provided using an FNC TreeView control. Debug component instance details using Object Plus, a customized TMS FNC Object inspector, or register a plugin inspector based on class type. Learn more about Marshal at [https://swiftexpat.com](https://swiftexpat.com)

Marshal is available at the top of the demo (bootstrap) project for a test drive here, [Sneak Peek Marshal](https://swiftexpat.github.io/RunTime-ToolKit/MarshalDemo_Web/MarshalDemo.html) , source code is available in the GitHub repo to review the implemenation.

Planned release for Web Core is 2nd week February 2023 to allow feedback to determine priority of defects and enhancements. The goal is to provide most core functinonality and determine priority of missing items.

## Release Details - Web Core

* Object Plus (without screen captures)
* Pure code implementation only (add source path to project options and code api call in an event handler)
  * Details about this can be found [here](https://swiftexpat.com/marshal/marshal-implementation-options.html) and will be updated for Web Core
* Inspector plugins not supported - target is end of Q1 2023

## Resources for Migration

Here are some resources that I found most important to getting through migration:

### Null & NIL

A must read is here about the try except, after that you can review the sections relevant to your code.
https://wiki.freepascal.org/Pas2js_Transpiler#Translating_try..except

### Debugging

From the TMS Web Core dev guide pdf, read the debugging section and utility functions.  This will help to get you comfortable with your browser console and learn how to inspect null.

### TMS Support Center

There are a lot of good threads in support center to point you in the right direction and likely give a workaround. To get up to speed review the following [thread for new developers ](https://support.tmssoftware.com/t/tips-for-new-tms-web-core-developers-and-in-particular-for-seasoned-delphi-developers/15567/21). Review [await and async functions](https://support.tmssoftware.com/t/hashing-and-cryptography-in-web-core/12700/14) , I admit to reading this 4 times before the explaination made sense and wish I had read it before starting with async.

## Migration Notes

I will begin with stating not all of my code compiled under Web Core: overloaded operators had to change, class helpers needed re-work and the lack of TZipFile meant there was work to be done. What required changes? Marshal previously used a feature of FNC TreeView, the tree node dbkey field to match the components by hashcode and bind the tree and page control.  In the web hashcode does not exist, so the Marshal model was extended to fill the gap.

I began with re-writing my logger to get familiar with the new tools, moving to the web meant a new approach and changes had been on the todo list for a long time as well. This was a good learning exercise.

Migration continued with commenting out large blocks of code which did not compile till I had a minimal working version of Marshal. After a gap analysis and prototyping to address the gaps, I started the changes to make Marshal available on TMS Web Core. The Web core compiler is slower than VCL, so I saved time by making my model changes in VCL first and later working through them in Web Core. This allowed me to focus on the changes without learning some of compiler message differences, sometimes Web Core gives a different message than VCL.

## Next steps

The migrated code is now in the process of cleaning up compiler warnings and testing to resolve defects or declare them in the release notes. Documentation will be updated on my website to support the Web Core platform. Your feedback is appreciated and if you have questions or suggestions, you can leave a comment or reach out to me via email or use GitHub to create an issue or discussion.
