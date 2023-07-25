FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY aspnetcoreapp/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY aspnetcoreapp/. .
RUN dotnet publish -c Release -o out

# Build runtime image

FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy 
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["aspnetcoreapp/dotnet", "aspnetcoreapp.dll"]
