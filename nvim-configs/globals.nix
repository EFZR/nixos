{
  globals = {
    ui_select_sync.__raw = ''
      function(items, opts)
        local co = assert(coroutine.running())
        vim.schedule(function()
          vim.ui.select(items, opts, function(selected)
            coroutine.resume(co, selected)
          end)
        end)
        return coroutine.yield()
      end
    '';

    dotnet_select_project.__raw = ''
      --- @class OmnisharpWorkspaceInformation
      --- @field MsBuild OmnisharpMsBuildProjects

      --- @class OmnisharpMsBuildProjects
      --- @field Projects OmnisharpProjectInformation[]

      --- @class OmnisharpProjectInformation
      --- @field AssemblyName string
      --- @field IsExe boolean
      --- @field OutputPath string The output relative path
      --- @field Path string the project absolute path
      --- @field TargetPath string The target dll absolute path

      --- @async
      --- @return string|nil
      function()
         local buffer = vim.api.nvim_get_current_buf()
         local clients = vim.lsp.get_clients({ buffer = buffer })
         local omnisharp_client

         -- Check if Omnisharp client is available
         for _, client in ipairs(clients) do
            if client.name == "omnisharp" then
               omnisharp_client = client
               break
            end
         end

         if omnisharp_client == nil then
            vim.notify("Omnisharp client not found.", vim.log.levels.ERROR)
            return
         end

         -- Request project information from Omnisharp
         local request_method = "o#/projects"
         local request = { ExcludeSourceFiles = true }
         local response = omnisharp_client.request_sync(request_method, request, 1000, buffer)

         if response == nil or response.err ~= nil then
            vim.notify("Failed to fetch project information.", vim.log.levels.ERROR)
            return
         end

         --- @type OmnisharpWorkspaceInformation
         local workspace_information = response.result
         if workspace_information == nil then
            vim.notify("No workspace information found.", vim.log.levels.ERROR)
            return
         end

         --- @type OmnisharpProjectInformation[]
         local executable_projects = {}
         for _, project in ipairs(workspace_information.MsBuild.Projects) do
            if project.IsExe then
               table.insert(executable_projects, project)
            end
         end

         --- @type OmnisharpProjectInformation|nil
         local selected_project
         if #executable_projects == 0 then
            vim.notify("No executable projects found.", vim.log.levels.ERROR)
            return
         elseif #executable_projects == 1 then
            selected_project = executable_projects[1]
         else
            selected_project = vim.g.ui_select_sync(executable_projects, {
               prompt = "Select Project:",
               format_item = function(item)
                  return item.AssemblyName
               end,
            })
         end

         if selected_project == nil or not selected_project.Path then
            vim.notify("No projects selected or invalid data.", vim.log.levels.ERROR)
            return
         end

         print(selected_project)
         --- @type string
         local project_folder_path = vim.fn.fnamemodify(selected_project.Path, ":h")

         --- @type string
         local dll_path = vim.fn.glob(
            project_folder_path
            .. "/bin/Debug/net*/"
            .. vim.fn.fnamemodify(project_folder_path, ":t")
            .. ".dll"
         )

         if dll_path == "" then
            vim.notify("Dll path not found.", vim.log.levels.ERROR)
            return
         end

         return dll_path
      end
    '';

    dotnet_build_project.__raw = ''
      function()
        local default_path = vim.fn.getcwd() .. '/'

        if vim.g['dotnet_last_proj_path'] ~= nil then
            default_path = vim.g['dotnet_last_proj_path']
        end

        local path = vim.fn.input('Path to your *proj file', default_path, 'file')

        vim.g['dotnet_last_proj_path'] = path

        local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'

        print("")
        print('Cmd to execute: ' .. cmd)

        local f = os.execute(cmd)

        if f == 0 then
            print('\nBuild: ✔️ ')
        else
            print('\nBuild: ❌ (code: ' .. f .. ')')
        end
      end
    '';

    dotnet_get_dll_path.__raw = ''
      function()
        local request = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end

        if vim.g['dotnet_last_dll_path'] == nil then
            vim.g['dotnet_last_dll_path'] = request()
        else
            if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
                vim.g['dotnet_last_dll_path'] = request()
            end
        end

        return vim.g['dotnet_last_dll_path']
      end
    '';

  };
}

