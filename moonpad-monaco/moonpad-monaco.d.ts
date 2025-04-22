import * as lsp from 'vscode-languageserver-protocol';

declare function compile(params: CompileParams): Promise<CompileResult>;

declare type CompileParams = {
    libInputs: Input[];
    testInputs?: Input[];
    debugMain?: boolean;
    enableValueTracing?: boolean;
};

declare type CompileResult = {
    kind: "success";
    js: Uint8Array;
} | {
    kind: "error";
    diagnostics: Diagnostic[];
};

declare type Diagnostic = {
    level: "warning" | "error";
    loc: {
        path: string;
        start: Position;
        end: Position;
    };
    message: string;
    error_code: number;
};

export declare function init(params: initParams): typeof moon;

declare function init_2(factory: () => Worker): void;

declare type initParams = {
    onigWasmUrl: string;
    lspWorker: Worker;
    mooncWorkerFactory: () => Worker;
    codeLensFilter?: (lens: lsp.CodeLens) => boolean;
};

declare type Input = [name: string, content: string];

declare namespace moon {
    export {
        compile,
        init_2 as init,
        run,
        test
    }
}

declare type Position = {
    line: number;
    col: number;
};

declare function run(js: Uint8Array): ReadableStream<string>;

declare function test(js: Uint8Array): ReadableStream<TestOutput>;

declare type TestOutput = {
    kind: "stdout";
    stdout: string;
} | ({
    kind: "result";
} & TestResult);

declare type TestResult = {
    package: string;
    filename: string;
    test_name: string;
    message: string;
};

export declare function traceCommandFactory(): (uri: string) => Promise<string | undefined>;

export { }
