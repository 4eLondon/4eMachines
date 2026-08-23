# C# Dev Container

Includes: .NET SDK 8.0 (LTS), NuGet

## Build

```bash
docker build -t dev-csharp .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-csharp

# Persist NuGet package cache between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v dotnet-nuget:/root/.nuget \
  dev-csharp
```

## Common commands inside the container

```bash
dotnet --version                     # confirm SDK version

# Create a project
dotnet new console -n MyApp          # console app
dotnet new classlib -n MyLib         # class library
dotnet new webapi -n MyApi           # ASP.NET Core Web API
dotnet new xunit -n MyTests          # xUnit test project

# Build and run
dotnet build                         # build
dotnet run                           # build and run
dotnet run --project MyApp           # run specific project

# Testing
dotnet test                          # run all tests

# Packages (NuGet)
dotnet add package <PackageName>     # add a NuGet package
dotnet add package Newtonsoft.Json   # example
dotnet remove package <PackageName>  # remove a package
dotnet restore                       # restore all packages
dotnet list package                  # list installed packages

# Publish
dotnet publish -c Release -o ./out   # publish release build
```

## Project layout (console app)

```
MyApp/
├── MyApp.csproj
└── Program.cs
```

See `packages.md` for common NuGet packages.
