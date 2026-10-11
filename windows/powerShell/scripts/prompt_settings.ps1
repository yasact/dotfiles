# ─────────────────────────────────────────────────────────────
# Custom prompt (self-made, no oh-my-posh / starship)
#
#   ┌[<folder> ~\…\output\fetish_gacha\scripts] (<branch> master)
#   └>
#
# - $HOME is shown as "~"
# - Deep paths are truncated to the last $PromptMaxDepth segments
# - Current git branch is shown when inside a repository
# - Icons need a Nerd Font (e.g. "Cascadia Code NF")
# ─────────────────────────────────────────────────────────────

# Nerd Font glyphs, written as escapes so they survive any editor/font
$global:PromptIconHome   = "`u{F015}"   # nf-fa-home
$global:PromptIconFolder = "`u{F07C}"   # nf-fa-folder_open
$global:PromptIconBranch = "`u{E0A0}"   # nf-pl-branch

# How many trailing path segments to keep before truncating with "…"
$global:PromptMaxDepth = 3

function Get-PromptPath
{
    $path = (Get-Location).Path

    # Replace home directory with "~"
    if ($path -eq $HOME)
    {
        return "~"
    }
    if ($path.StartsWith($HOME, [System.StringComparison]::OrdinalIgnoreCase))
    {
        $path = "~" + $path.Substring($HOME.Length)
    }

    # Split into segments, keep drive/root + last N segments
    $sep = [System.IO.Path]::DirectorySeparatorChar
    $parts = $path.Split($sep, [System.StringSplitOptions]::RemoveEmptyEntries)

    if ($parts.Count -le ($global:PromptMaxDepth + 1))
    {
        return $path
    }

    $root = $parts[0]
    $tail = $parts[($parts.Count - $global:PromptMaxDepth)..($parts.Count - 1)]
    return ($root, "…") + $tail -join $sep
}

function Get-PromptGitBranch
{
    # Skip when git is not installed
    if (-not (Get-Command git -ErrorAction SilentlyContinue))
    {
        return $null
    }

    # Cheap check: are we inside a work tree?
    $inside = git rev-parse --is-inside-work-tree 2>$null
    if ($inside -ne "true")
    {
        return $null
    }

    $branch = git branch --show-current 2>$null
    if ([string]::IsNullOrWhiteSpace($branch))
    {
        # Detached HEAD: show short SHA
        $branch = git rev-parse --short HEAD 2>$null
        if ($branch) { $branch = "@$branch" }
    }
    return $branch
}

function prompt()
{
    # Preserve the exit status of the last command
    $lastSuccess = $?

    $path = Get-PromptPath
    $pathIcon = if ($path -eq "~") { $global:PromptIconHome } else { $global:PromptIconFolder }

    Write-Host -NoNewline "┌[" -ForegroundColor DarkYellow
    Write-Host -NoNewline "$pathIcon $path" -ForegroundColor DarkCyan
    Write-Host -NoNewline "]" -ForegroundColor DarkYellow

    $branch = Get-PromptGitBranch
    if ($branch)
    {
        Write-Host -NoNewline " (" -ForegroundColor DarkYellow
        Write-Host -NoNewline "$($global:PromptIconBranch) $branch" -ForegroundColor Magenta
        Write-Host -NoNewline ")" -ForegroundColor DarkYellow
    }
    Write-Host ""

    Write-Host -NoNewline "└" -ForegroundColor DarkYellow
    if ($lastSuccess)
    {
        Write-Host -NoNewline ">" -ForegroundColor DarkYellow
    }
    else
    {
        Write-Host -NoNewline ">" -ForegroundColor Red
    }
    return " "
}
