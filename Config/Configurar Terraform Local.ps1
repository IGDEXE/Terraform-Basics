# Configurar o Terraform localmente
# Ivo Dias

# Funcao para validar as pastas
function Validar-Pasta {
    param (
        [parameter(position=0,Mandatory=$True)]
        $caminho
    )
    # Verifica se ja existe
    $Existe = Test-Path -Path $caminho
    # Cria a pasta
    if ($Existe -eq $false) {
        Write-Host "Configurando pasta: $caminho"
        try {
            $noReturn = New-Item -ItemType directory -Path $caminho # Cria a pasta
            Write-Host "Pasta configurada com sucesso"
        }
        catch {
            $ErrorMessage = $_.Exception.Message # Recebe o erro
            Write-Host "Ocorreu um erro durante a configuracao da pasta" # Mostra a mensagem
            Write-Host "Erro: $ErrorMessage"
        }
    }
}

# Configuracoes
$caminhoTerraform = "$PSScriptRoot\Terraform-EXE.zip"
$pastaPadrao = "$env:USERPROFILE\Documents\Terraform"

# Faz a configuracao
try {
    # Cria um pasta em documentos
    Write-Host "Configurando ambiente"
    Validar-Pasta $pastaPadrao
    $env:Path += ";$pastaPadrao" # Configura a variavel de ambiente

    # Extrai o executavel do Terraform
    Write-Host "Instalando o Terraform"
    Expand-Archive -Path "$caminhoTerraform" -DestinationPath "$pastaPadrao"    

    # Finaliza
    Write-Host "Procedimento concluido"    
}
catch {
    $ErrorMessage = $_.Exception.Message # Recebe o erro
    Write-Host "Ocorreu um erro durante a configuracao do Terraform" # Mostra a mensagem
    Write-Host "Erro: $ErrorMessage"
}
Pause