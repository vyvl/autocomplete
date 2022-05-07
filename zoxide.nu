def "nu-complete zoxide" [] {
    [{value: "add", description: "Add a new directory or increment its rank"}, {value: "import", description: "Import entries from another application"}, {value: "init", description: "Generate shell configuration"}, {value: "query", description: "Search for a directory in the database"}, {value: "remove", description: "Remove a directory from the database"}]
} 

export extern "zoxide" [
command:string@"nu-complete zoxide"
--help(-h)	#Print help information
--version(-V)	#Print version information
]

export extern "zoxide add" [
...paths
--help(-h)	#Print help information
--version(-V)	#Print version information
]

export extern "zoxide import" [
path
--from	#Application to import from
--merge	#Merge into existing database
--help(-h)	#Print help information
--version(-V)	#Print version information
]

export extern "zoxide init" [
shell
--cmd	#Renames the 'z' command and corresponding aliases
--hook	#Chooses event upon which an entry is added to the database
--no-aliases	#Prevents zoxide from defining any commands
--help(-h)	#Print help information
--version(-V)	#Print version information
]

export extern "zoxide query" [
...keywords?
--exclude	#Exclude a path from results
--all	#Show deleted directories
--interactive(-i)	#Use interactive selection
--list(-l)	#List all matching directories
--score(-s)	#Print score with results
--help(-h)	#Print help information
--version(-V)	#Print version information
]

export extern "zoxide remove" [
...paths?
--interactive(-i)	#undefined
--help(-h)	#Print help information
--version(-V)	#Print version information
]
