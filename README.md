To Use in an XCode Project:

    Add the XC-Frameworks to the project (link, but do not embed)
    Copy $HOME/build/lib/iphoneos_arm64/share/proj into project
    In the app’s code set PROJ_LIB environment variable so that proj can find proj.db (and other contents it may require?) setenv("PROJ_LIB", projLibBundleURL.cString(using: .ascii), 1)
    In Build Settings, add the value, “—deep”, to ‘Other Code Signing Flags’ (if somebody can figure out how to correctly code-sign these XC-Frameworks in such a way that XCode will accept it, I'd like to know)
    Create module.map file to generate Swift wrappers of C functions (details of this are beyond the scope of this post)
