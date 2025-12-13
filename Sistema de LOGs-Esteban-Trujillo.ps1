###############NOMBRE Y APELLIDO DEL AUTOR(A): [Tu Nombre Completo]####################

# Define la primera función para crear carpetas de log.
function New-FolderCreation {
    # Habilita funcionalidades avanzadas de cmdlet (como soporte para -Verbose, etc.).
    [CmdletBinding()]
    # Define el bloque de parámetros de la función.
    param(
        # Declara el parámetro $foldername como obligatorio.
        [Parameter(Mandatory = $true)]
        # Define $foldername como un tipo string.
        [string]$foldername
    )

    # Comentario: Crear la ruta absoluta de la carpeta relativa a la ubicación actual.
    # Combina la ruta de la ubicación actual (Get-Location).Path con el nombre de la carpeta ($foldername).
    $logpath = Join-Path -Path (Get-Location).Path -ChildPath $foldername
    # Verifica si la ruta $logpath NO existe.
    if (-not (Test-Path -Path $logpath)) {
        # Si no existe, crea un nuevo elemento (carpeta) en esa ruta.
        # -ItemType Directory especifica que es una carpeta. -Force la crea si falta la ruta padre.
        # | Out-Null suprime la salida (objeto) de la creación para no ensuciar la consola.
        New-Item -Path $logpath -ItemType Directory -Force | Out-Null
    }

    # Retorna la ruta absoluta de la carpeta creada o existente.
    return $logpath
}

# Define la segunda función principal, que maneja la creación de archivos y la escritura de logs.
function Write-Log {
    # Habilita funcionalidades avanzadas de cmdlet y gestión de parámetros.
    [CmdletBinding()]
    # Define el bloque de parámetros de la función.
    param(
        # Comentario: Configuración del conjunto de parámetros 'Create' (para crear archivos).
        
        # Parámetro obligatorio para el conjunto 'Create', acepta un objeto (cadena o array de nombres).
        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        # Define un alias 'Names' para el parámetro $Name.
        [Alias('Names')]
        [object]$Name,

        # Parámetro obligatorio para la extensión del archivo (ej. "log", "txt").
        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [string]$Ext,

        # Parámetro obligatorio para el nombre de la carpeta de destino.
        [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
        [string]$folder,

        # Un switch para activar explícitamente el conjunto 'Create' (opcional en posición 0).
        [Parameter(ParameterSetName = 'Create', Position = 0)]
        [switch]$Create,

        # Comentario: Configuración del conjunto de parámetros 'Message' (para escribir en un log existente).
        
        # Parámetro obligatorio para el mensaje de log.
        [Parameter(Mandatory = $true, ParameterSetName = 'Message')]
        [string]$message,

        # Parámetro obligatorio para la ruta completa del archivo de log.
        [Parameter(Mandatory = $true, ParameterSetName = 'Message')]
        [string]$path,

        # Parámetro opcional para la severidad del mensaje.
        [Parameter(Mandatory = $false, ParameterSetName = 'Message')]
        # Restringe los valores de entrada a solo estos tres.
        [ValidateSet('Information','Warning','Error')]
        # Establece 'Information' como valor por defecto.
        [string]$Severity = 'Information',

        # Un switch para activar explícitamente el conjunto 'Message' (opcional en posición 0).
        [Parameter(ParameterSetName = 'Message', Position = 0)]
        [switch]$MSG
    )

    # Usa una estructura switch para ejecutar código basado en el conjunto de parámetros utilizado.
    switch ($PsCmdlet.ParameterSetName) {
        # Inicio del bloque de código para el conjunto 'Create'.
        "Create" {
            # Inicializa un array vacío para almacenar las rutas de los archivos creados.
            $created = @()

            # Inicializa un array vacío para manejar los nombres.
            $namesArray = @()
            # Verifica si el parámetro $Name fue proporcionado.
            if ($null -ne $Name) {
                # Si $Name es un array (múltiples nombres), lo asigna directamente a $namesArray.
                if ($Name -is [System.Array]) { $namesArray = $Name }
                # Si es un solo nombre, lo convierte en un array de un solo elemento.
                else { $namesArray = @($Name) }
            }

            # Formatea la fecha como YYYY-MM-DD.
            $date1 = (Get-Date -Format "yyyy-MM-dd")
            # Formatea la hora como HH-MM-SS.
            $time  = (Get-Date -Format "HH-mm-ss")

            # Llama a la función anterior para crear la carpeta de destino y obtiene su ruta.
            $folderPath = New-FolderCreation -foldername $folder

            # Itera sobre cada nombre proporcionado en $namesArray.
            foreach ($n in $namesArray) {
                
                # Convierte el nombre actual a string base.
                $baseName = [string]$n

                # Construye el nombre del archivo: NombreBase_Fecha_Hora.Extensión
                $fileName = "${baseName}_${date1}_${time}.$Ext"

                # Combina la ruta de la carpeta con el nombre del archivo para obtener la ruta completa.
                $fullPath = Join-Path -Path $folderPath -ChildPath $fileName

                # Inicia un bloque de manejo de errores.
                try {
                    # Crea el nuevo archivo en la ruta completa.
                    # -ItemType File especifica que es un archivo. -Force sobrescribe si ya existe.
                    # -ErrorAction Stop asegura que cualquier error sea capturado por el catch.
                    New-Item -Path $fullPath -ItemType File -Force -ErrorAction Stop | Out-Null

                    # Agrega la ruta completa del archivo creado al array $created.
                    $created += $fullPath
                }
                # Captura cualquier error que ocurra durante la creación del archivo.
                catch {
                    # Muestra una advertencia en la consola con el error.
                    Write-Warning "Failed to create file '$fullPath' - $_"
                }
            }

            # Retorna las rutas completas de todos los archivos de log que fueron creados.
            return $created
        }

        # Inicio del bloque de código para el conjunto 'Message'.
        "Message" {
            # Obtiene la ruta del directorio padre del archivo de log.
            $parent = Split-Path -Path $path -Parent
            # Verifica si hay un directorio padre y si ese directorio NO existe.
            if ($parent -and -not (Test-Path -Path $parent)) {
                # Si no existe, crea el directorio padre recursivamente.
                New-Item -Path $parent -ItemType Directory -Force | Out-Null
            }

            # Obtiene la marca de tiempo actual.
            $date = Get-Date
            # Concatena la marca de tiempo, el mensaje y la severidad en el formato deseado.
            $concatmessage = "|$date| |$message| |$Severity|"

            # Usa un switch para manejar la salida en consola según la severidad.
            switch ($Severity) {
                # Si es 'Information', lo escribe en verde.
                "Information" { Write-Host $concatmessage -ForegroundColor Green }
                # Si es 'Warning', lo escribe en amarillo.
                "Warning"     { Write-Host $concatmessage -ForegroundColor Yellow }
                # Si es 'Error', lo escribe en rojo.
                "Error"       { Write-Host $concatmessage -ForegroundColor Red }
            }
            # Agrega el mensaje concatenado al final del archivo especificado en $path.
            Add-Content -Path $path -Value $concatmessage -Force

            # Retorna la ruta del archivo de log al que se le escribió.
            return $path
        }

        # Maneja el caso si se llama a la función sin usar ninguno de los conjuntos de parámetros definidos.
        default {
            # Lanza un error indicando que se usó un conjunto de parámetros desconocido.
            throw "Unknown parameter set: $($PsCmdlet.ParameterSetName)"
        }
    }
}

# --- Ejecución de Demostración del Script ---

# Llama a la función Write-Log para crear un archivo de log:
# -Name: El nombre base del log ("Name-Log").
# -folder: La carpeta de destino ("logs").
# -Ext: La extensión del archivo ("log").
# -Create: Usa el conjunto de parámetros "Create".
$logPaths = Write-Log -Name "Name-Log" -folder "logs" -Ext "log" -Create
# Muestra la ruta completa del archivo(s) de log recién creado(s).
$logPaths