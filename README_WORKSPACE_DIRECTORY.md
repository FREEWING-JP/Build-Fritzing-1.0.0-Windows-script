# Changing the Fritzing Workspace Directory

By default, the Fritzing build scripts will use `\00_fritzing` as the workspace directory. If you want to use a different directory, you can set the `FRITZING_WORKSPACE_DIR` environment variable before running the scripts.

## Method 1: Set the environment variable temporarily in the command prompt

```
set FRITZING_WORKSPACE_DIR=D:\FritzingBuild
00_Download_Script.bat
```

## Method 2: Set the environment variable permanently in Windows

1. Right-click on "This PC" or "My Computer" and select "Properties"
2. Click on "Advanced system settings"
3. Click on the "Environment Variables" button
4. Under "System variables" or "User variables", click "New"
5. Variable name: `FRITZING_WORKSPACE_DIR`
6. Variable value: Your custom workspace path (e.g., `D:\FritzingBuild`)
7. Click "OK" to save

After setting the environment variable, run the scripts as usual. All Fritzing build operations will use your custom directory instead of the default `\00_fritzing`.

## Verifying the Workspace Directory

When you run `00_Download_Script.bat`, it will display the workspace directory it's using:

```
Using Fritzing workspace directory: D:\FritzingBuild
```

This confirms that your custom directory is being used correctly.

## How It Works

All the build scripts have been modified to:

1. Read the `qt_config.bat` file created by `00_Download_Script.bat`
2. Use the `FRITZING_WORKSPACE_DIR` environment variable for all workspace-related operations

This allows you to build Fritzing in a directory of your choice without having to modify each script individually.

## Important Notes

- Make sure the directory you specify exists or can be created by the script
- The directory should be empty when you start the build process
- All paths in the scripts are relative to this workspace directory
