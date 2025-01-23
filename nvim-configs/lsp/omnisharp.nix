{
  plugins = {
    lsp = {
      servers = {
        omnisharp = {
          enable = true;
          cmd = [ "OmniSharp" "--languageserver" ];
          filetypes =
            [ "cs" "vb" "csproj" "sln" "slnx" "props" "csx" "targets" ];
          settings = {
            enableEditorConfigSuport = true;
            organizeImportOnFormat = true;
            enableMsBuildLoadProjectsOnDemand = null;
            enableRoslynAnalyzer = true;
            enableImportCompletion = true;
            analyzeOpenDocumentsOnly = null;
            sdkIncludePrereleases = true;
          };
        };
      };
    };
  };
}
