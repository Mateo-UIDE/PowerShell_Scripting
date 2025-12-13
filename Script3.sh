#Nombre del autor: Esteban Trujillo
###############NOMBRE Y APELLIDO DEL AUTOR(A): ________####################
#Crear una carpeta si no existe
function New-FolderCreation {
#Declara una funsión
    [CmdletBinding()]
#Permite usar características avanzadas de cmdlets
    param(
        [Parameter(Mandatory = $true)]
        [string]$foldername
    )
#Define un parámetro obligatorio llamado $foldername
    $logpath = Join-Path -Path (Get-Location).Path -ChildPath $foldername
#Genera una ruta completa combinando la ubicación actual con el nombre de la carpeta
    if (-not (Test-Path -Path $logpath)) {
        New-Item -Path $logpath -ItemType Directory -Force | Out-Null
    }
#Si la carpeta no existe, la crea.
    return $logpath
}
#Devuelve la ruta creada
[CmdletBinding()]
param(
#Define los parámetros del cmdlet
[Parameter(Mandatory = $true, ParameterSetName = 'Create')]
[Alias('Names')]
[object]$Name,
#Nombre de archivo a crear
[Parameter(Mandatory = $true, ParameterSetName = 'Create')]
[string]$Ext,
#Extensión del archivo
[Parameter(Mandatory = $true, ParameterSetName = 'Create')]
[string]$folder,
#Carpeta donde se guardarán los logs
[Parameter(ParameterSetName = 'Create', Position = 0)]
[switch]$Create,
#Activa el modo "Crear archivo"
[Parameter(Mandatory = $true, ParameterSetName = 'Message')]
[string]$message,
#Mensaje a escribir en el log
[Parameter(Mandatory = $true, ParameterSetName = 'Message')]
[string]$path,
#Ruta del archivo log donde se escribirá
[Parameter(Mandatory = $false, ParameterSetName = 'Message')]
[ValidateSet('Information','Warning','Error')]
[string]$Severity = 'Information',
#Nivel del mensaje (Info, Warning o Error)
switch ($PsCmdlet.ParameterSetName) {
#Determina si se usa modo Create o Message
$created = @()
#Lista donde se guardan las rutas de los archivos creados
$namesArray = @()
#Convierte el parámetro Name en un array por si vienen varios nombres
$date1 = (Get-Date -Format "yyyy-MM-dd")
$time  = (Get-Date -Format "HH-mm-ss")
#Crea fecha y hora para agregar a los nombres de archivo
$folderPath = New-FolderCreation -foldername $folder
#Crea la carpeta usando la primera función
#Bucle que crea cada archivo
foreach ($n in $namesArray) {
$fileName = "${baseName}_${date1}_${time}.$Ext"
#Arma el nombre final del archivo
New-Item -Path $fullPath -ItemType File -Force -ErrorAction Stop | Out-Null
#Crea el archivo vacío
$parent = Split-Path -Path $path -Parent
#Obtiene la carpeta del archivo
if ($parent -and -not (Test-Path -Path $parent)) {
    New-Item -Path $parent -ItemType Directory -Force | Out-Null
}
#Crea la carpeta si no existe
$date = Get-Date
$concatmessage = "|$date| |$message| |$Severity|"
#Formatea el mensaje para agregarlo al .log
Write-Host $concatmessage -ForegroundColor Green/Yellow/Red
#Muestra el mensaje en colores según severidad
Add-Content -Path $path -Value $concatmessage -Force
#Escribe el mensaje al archivo log
$logPaths = Write-Log -Name "Name-Log" -folder "logs" -Ext "log" -Create
$logPaths
#Llama a la función para crear el archivo log
#Muestra la ruta del archivo creado
