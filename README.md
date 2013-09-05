DMLocalizedString
=================

This is a simple String localizer that uses JSON files to store the key-value couples corresponding to the strings to be localized.

The usage of this class is completely similar to NSLocalizedString() since the syntax is pretty much identical. In the sample project you can find (in the App delegate) a simple NSLog that uses DMLocalizedStrings.

The Localized files must be named Localized_xx.json where xx is the locale identifier of the language used in it.

Keep in mind that the file should use a well formed JSON syntax; an example is provided below:

{
    "KEY1" : "Value",
    "KEY2" : "Value2",
    ...
    "KEY_N" : "ValueN" *** no final comma here!!! ***
}

The MIT License (MIT)

Copyright (c) <2013> <DMDigital s.r.l.>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
