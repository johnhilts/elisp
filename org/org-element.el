Common Lisp the Language, 2nd Edition 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
next
up
previous
contents
index

Next: Input/Output Up: Streams Previous: Creating New Streams 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

21.3. Operations on Streams

This section contains discussion of only those operations that are common to all streams. Input and output is rather complicated and is discussed separately in chapter 22. The interface between streams and the file system is
discussed in chapter 23. 

[Function]
streamp object

streamp is true if its argument is a stream, and otherwise is false. 


(streamp x) == (typep x 'stream)

change_begin
X3J13 voted in January 1989 (CLOSED-STREAM-OPERATIONS)  to specify that streamp is unaffected by whether its argument, if a stream, is open or closed. In either case it returns true. 
change_end

change_begin

[Function]
open-stream-p stream

X3J13 voted in January 1989 (STREAM-ACCESS)  to add the predicate open-stream-p. It is true if its argument (which must be a stream) is open, and otherwise is false. 

A stream is always created open; it remains open until closed with the close function. The macros with-open-stream, with-input-from-string, with-output-to-string, and with-open-file automatically close
the created stream as control leaves their bodies, in effect imposing dynamic extent on the openness of the stream. 
change_end

[Function]
input-stream-p stream

This predicate is true if its argument (which must be a stream) can handle input operations, and otherwise is false. 

[Function]
output-stream-p stream

This predicate is true if its argument (which must be a stream) can handle output operations, and otherwise is false. 

[Function]
stream-element-type stream

A type specifier is returned to indicate what objects may be read from or written to the argument stream, which must be a stream. Streams created by open will have an element type restricted to a subset of character or
integer, but in principle a stream may conduct transactions using any Lisp objects. 

[Function]
close stream &key :abort

The argument must be a stream. The stream is closed. No further input/output operations may be performed on it. However, certain inquiry operations may still be performed, and it is permissible to close an already closed stream. 

change_begin
X3J13 voted in January 1989 (CLOSED-STREAM-OPERATIONS)  and revised the vote in March 1989 to specify that if close is called on an open stream, the stream is closed and t is returned; but if close is called on a closed
stream, it succeeds without error and returns an unspecified value. (The rationale for not specifying the value returned for a closed stream is that in some implementations closing certain streams does not really have an effect on
them-for example, closing the *terminal-io* stream might not ``really'' close it-and it is not desirable to force such implementations to keep otherwise unnecessary state. Portable programs will of course not rely on such
behavior.) 

X3J13 also voted in January 1989 to specify exactly which inquiry functions may be applied to closed streams: 


streamp            pathname-host         namestring 
pathname           pathname-device       file-namestring 
truename           pathname-directory    directory-namestring 
merge-pathnames    pathname-name         host-namestring 
open               pathname-type         enough-namestring 
probe-file         pathname-version      directory 
See the individual descriptions of these functions for more information on how they operate on closed streams. 

X3J13 voted in January 1989 (CLOSE-CONSTRUCTED-STREAM)  to clarify the effect of closing various kinds of streams. First some terminology: 

* A composite stream is one that was returned by a call to make-synonym-stream, make-broadcast-stream, make-concatenated-stream, make-two-way-stream, or make-echo-stream. 

* The constituents of a composite stream are the streams that were given as arguments to the function that constructed it or, in the case of make-synonym-stream, the stream that is the symbol-value of the symbol that was
 given as an argument. (The constituent of a synonym stream may therefore vary over time.) 

* A constructed stream is either a composite stream or one returned by a call to make-string-input-stream, make-string-output-stream, with-input-from-string, or with-output-to-string. 

The effect of applying close to a constructed stream is to close that stream only. No input/output operations are permitted on the constructed stream once it has been closed (though certain inquiry functions are still permitted, as
described above). 

Closing a composite stream has no effect on its constituents; any constituents that are open remain open. 

If a stream created by make-string-output-stream is closed, the result of then applying get-output-stream-string to the stream is unspecified. 
change_end

If the :abort parameter is not nil (it defaults to nil), it indicates an abnormal termination of the use of the stream. An attempt is made to clean up any side effects of having created the stream in the first place. For example, if
the stream performs output to a file that was newly created when the stream was created, then if possible the file is deleted and any previously existing file is not superseded. 

change_begin
X3J13 voted in January 1989 (STREAM-ACCESS)  to add the following accessor functions for obtaining information about streams. 

[Function]
broadcast-stream-streams broadcast-stream

The argument must be of type broadcast-stream. A list of the constituent output streams (whether open or not) is returned. 

[Function]
concatenated-stream-streams concatenated-stream

The argument must be of type concatenated-stream. A list of constituent streams (whether open or not) is returned. This list represents the ordered set of input streams from which the concatenated stream may yet read; the
stream from which it is currently reading is first in the list. The list may be empty if no more streams remain to be read. 

[Function]
echo-stream-input-stream echo-stream 
echo-stream-output-stream echo-stream

The argument must be of type echo-stream. The function echo-stream-input-stream returns the constituent input stream; echo-stream-output-stream returns the constituent output stream. 

[Function]
synonym-stream-symbol synonym-stream

The argument must be of type synonym-stream. This function returns the symbol for whose value the synonym-stream is a synonym. 

[Function]
two-way-stream-input-stream two-way-stream 
two-way-stream-output-stream two-way-stream

The argument must be of type two-way-stream. The function two-way-stream-input-stream returns the constituent input stream; two-way-stream-output-stream returns the constituent output stream. 

[Function]
interactive-stream-p stream

X3J13 voted in June 1989 (STREAM-CAPABILITIES)  to add the predicate interactive-stream-p, which returns t if the stream is interactive and otherwise returns nil. A type-error error is signalled if the argument is not
of type stream. 

The precise meaning of interactive-stream-p is implementation-dependent and may depend on the underlying operating system. The intent is to distinguish between interactive and batch (background, command-file)
operations. Some characteristics that might distinguish a stream as interactive: 

* The stream is connected to a person (or the equivalent) in such a way that the program can prompt for information and expect to receive input that might depend on the prompt.

* The program is expected to prompt for input and to support ``normal input editing protocol'' for that operating environment.

* A call to read-char might hang waiting for the user to type something rather than quickly returning a character or an end-of-file indication.

The value of *terminal-io* might or might not be interactive. 

[Function]
stream-external-format stream

X3J13 voted in June 1989 (MORE-CHARACTER-PROPOSAL)  to add the function stream-external-format, which returns a specifier for the implementation-recognized scheme used for representing characters in the argument
stream. See the :external-format argument to open. 

change_end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
next
up
previous
contents
index

Next: Input/Output Up: Streams Previous: Creating New Streams 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

AI.Repository@cs.cmu.edu 