FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime 

WORKDIR /app 
 
COPY --from=build /app/out . 

EXPOSE 80

ARG CONNECTION_STRING="mongodb://some-mongo:27017"

ENV TopicstoreDatabaseSettings__ConnectionString="$CONNECTION_STRING"
ENV ASPNETCORE_ENVIRONMENT=Development

ENTRYPOINT [ "dotnet", "backend.dll" ]
