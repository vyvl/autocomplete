 

export extern "http" [
METHOD?
URL?
...REQUEST_ITEM?
--json(-j)	#Data items from the command line are serialized as a JSON object. The Content-Type and Accept headers are set to application/json
--form(-f)	#fData items from the command line are serialized as form fields..The Content-Type is set to application/x-www-form-urlencoded (if not.specified). The presence of any file fields results in a.multipart/form-data request.
--multipart	#Similar to --form, but always sends a multipart/form-data request (i.e., even without files)
--boundary	#Specify a custom boundary string for multipart/form-data requests. Has effect only together with --form
--compress(-x)	#Content compressed (encoded) with Deflate algorithm. The Content-Encoding header is set to deflate
--pretty	#Controls output processing. The value can be "none" to not prettify.the output (default for redirected output), "all" to apply both colors.and formatting (default for terminal output), "colors", or "format".
--style(-s)	#undefined
--unsorted	#Disables all sorting while formatting output
--sorted	#Re-enables all sorting options while formatting output
--format-options	#Controls output formatting
--print(-p)	#String specifying what the output should contain..'H' request headers;.'B' request body;.'h' response headers;.'b' response body;
--headers(-h)	#Print only the response headers. Shortcut for --print=h
--body(-b)	#Print only the response body. Shortcut for --print=b
--verbose(-v)	#Verbose output. Print the whole request as well as the response. Also print.any intermediary requests/responses (such as redirects)..It's a shortcut for: --all --print=BHbh
--all	#By default, only the final request/response is shown. Use this flag to show.any intermediary requests/responses as well. Intermediary requests include.followed redirects (with --follow), the first unauthorized request when.Digest auth is used (--auth=digest), etc.
--history-print(-P)	#The same as --print, -p but applies only to intermediary requests/responses.(such as redirects) when their inclusion is enabled with --all. If this.options is not specified, then they are formatted the same way as the final.response.
--stream(-S)	#Always stream the response body by line, i.e., behave like `tail -f'
--output(-o)	#Save output to FILE instead of stdout. If --download is also set, then only.the response body is saved to FILE. Other parts of the HTTP exchange are.printed to stderr.
--download(-d)	#Do not print the response body to stdout. Rather, download it and store it.in a file. The filename is guessed unless specified with --output.[filename]. This action is similar to the default behaviour of wget.
--continue(-c)	#Resume an interrupted download. Note that the --output option needs to be specified as well
--quiet(-q)	#Do not print to stdout or stderr..stdout is still redirected if --output is specified..Flag doesn't affect behaviour of download beyond not printing to terminal.
--session	#Create, or reuse and update a session. Within a session, custom headers,.auth credential, as well as any cookies sent by the server persist between.requests.
--session-read-only	#Create or read a session without updating it form the request/response exchange
--auth(-a)	#If only the username is provided (-a username), HTTPie will prompt for the password
--auth-type(-A)	#The authentication mechanism to be used. Defaults to "basic"
--ignore-netrc	#Ignore credentials from .netrc
--offline	#Build the request and print it but don’t actually send it
--proxy	#String mapping protocol to the URL of the proxy.(e.g. http:http://foo.bar:3128). You can specify multiple proxies with.different protocols. The environment variables $ALL_PROXY, $HTTP_PROXY,.and $HTTPS_proxy are supported as well.
--follow(-F)	#Follow 30x Location redirects
--max-redirects	#By default, requests have a limit of 30 redirects (works with --follow)
--max-headers	#The maximum number of response headers to be read before giving up (default 0, i.e., no limit)
--timeout	#The connection timeout of the request in seconds..The default value is 0, i.e., there is no timeout limit.
--check-status	#By default, HTTPie exits with 0 when no network or other fatal errors.occur. This flag instructs HTTPie to also check the HTTP status code and.exit with an error if the status indicates one.
--path-as-is	#Bypass dot segment (/../ or /./) URL squashing
--chunked	#Enable streaming via chunked transfer encoding
--verify	#Set to "no" (or "false") to skip checking the host's SSL certificate..Defaults to "yes" ("true"). You can also pass the path to a CA_BUNDLE file.for private certs.
--ssl	#The desired protocol version to use. This will default to.SSL v2.3 which will negotiate the highest protocol that both.the server and your installation of OpenSSL support.
--ciphers	#A string in the OpenSSL cipher list format
--cert	#You can specify a local cert to use as client side SSL certificate..This file may either contain both private key and certificate or you may.specify --cert-key separately.
--cert-key	#The private key to use with SSL. Only needed if --cert is given and the certificate file does not contain the private key
--ignore-stdin(-I)	#Do not attempt to read stdin
--help	#Show the help message and exit
--version	#Show version and exit
--traceback	#Prints the exception traceback should one occur
--default-scheme	#The default scheme to use if not specified in the URL
--debug	#Prints the exception traceback should one occur, as well as other.information useful for debugging HTTPie itself and for reporting bugs.
]
