@echo off
REM ============================
REM Script para configurar dois ambientes virtuais
REM .venv_gensim e .venv_spacy
REM ============================

setlocal

echo Criando ambiente: .venv_spacy
python -m venv .venv_spacy

echo Atualizando pip no .venv_spacy
call .venv_spacy\Scripts\activate
python -m pip install --upgrade pip
if exist requirements_spacy.txt (
    echo Instalando dependências do requirements_spacy.txt
    pip install -r requirements_spacy.txt
) else (
    echo [ERRO] Arquivo requirements_spacy.txt não encontrado!
)

echo Desativando ambiente .venv_spacy
call .venv_spacy\Scripts\deactivate.bat >nul 2>&1

echo Criando ambiente: .venv_gensim
python -m venv .venv_gensim

echo Atualizando pip no .venv_gensim
call .venv_gensim\Scripts\activate
python -m pip install --upgrade pip
if exist requirements_gensim.txt (
    echo Instalando dependências do requirements_gensim.txt
    pip install -r requirements_gensim.txt
) else (
    echo [ERRO] Arquivo requirements_gensim.txt não encontrado!
)

echo Desativando ambiente .venv_gensim
call .venv_gensim\Scripts\deactivate.bat >nul 2>&1

endlocal

echo =====================================
echo AMBIENTES CONFIGURADOS COM SUCESSO!
echo Ative manualmente com:
echo    .venv_gensim\Scripts\activate
echo ou .venv_spacy\Scripts\activate
echo =====================================
pause
