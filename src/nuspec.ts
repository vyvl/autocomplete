import completionSpec from './http';
import Arg = Fig.Arg;


const defs = [] as Array<string>

const externs = [] as Array<string>

function loadSubCommand(spec: Fig.Subcommand, name: string) {
    const flagsString = getFlagsString(spec);
    let command = '';
    const args = getArgsString(spec);
    const def = getDefString(spec, name);
    if(args){
        command = `${args}`;
    }
    else if(def){
        defs.push(def);
        command = `command:string@"nu-complete ${name}"`
    }

    const externBody = command.trim() ? `${command}\n${flagsString}` : `${flagsString}`;
    const extern = `export extern "${name}" [
${externBody}
]`;
    externs.push(extern);

    spec.subcommands?.forEach(it => loadSubCommand(it, name + ' ' + it.name));

}

function getArgsString(spec: Fig.Subcommand):string {
    if(!spec.args) return null;
    const args = singleOrArrayToArray(spec.args);
    let anyOpt = false;
    return args.map(it => {
        const arg = it as Arg;
        let result = '';
        if (arg.isVariadic) {
            result = `...`;
        }
        result += `${arg.name}`;
        if (arg.isOptional || anyOpt) {
            anyOpt = true;
            result += `?`;
        }
        return result;
    }).join('\n')

}

function getFlagsString(spec: Fig.Subcommand): string {
    return spec.options.map(
        option => {
            let flagName = ''
            if (option.name instanceof Array) {
                if (option.name[0].startsWith('--')) {
                    flagName = `${option.name[0]}(${option.name[1]})`
                } else {
                    flagName = `${option.name[1]}(${option.name[0]})`
                }
            } else {
                flagName = option.name
            }
            const description = option.description?.split("\n").map(it => it.trim()).filter(it => it).join('.')
            return `${flagName}\t#${description}`;
        }
    ).join("\n")
}


function getDefString(spec: Fig.Subcommand, name: string) {

    let cmdStr = '';

    if (spec.subcommands?.length > 0) {
        cmdStr = spec.subcommands.map(
            cmd => `{value: "${cmd.name}", description: "${cmd.description}"}`
        ).join(', ')

    }
    if(cmdStr){
    return `def "nu-complete ${name}" [] {
    [${cmdStr}]
}`;
        }
    return null;
}

function singleOrArrayToArray<T>(it: T | Array<T>): Array<T> {
    if (it instanceof Array) {
        return it;
    }
    else {
        return [it];
    }
}

loadSubCommand(completionSpec, completionSpec.name);

console.log(defs.join('\n\n'),"\n");
console.log(externs.join('\n\n'));