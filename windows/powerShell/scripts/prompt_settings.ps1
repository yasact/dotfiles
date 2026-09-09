# ─────────────────────────────────────────────────────────────
# Custom prompt (self-made, no oh-my-posh / starship)
#
#   ┌[~\…\output\fetish_gacha\scripts] (master)
#   └>
#
# - $HOME is shown as "~"
# - Deep paths are truncated to the last $PromptMaxDepth segments
# - Current git branch is shown when inside a repository
# ─────────────────────────────────────────────────────────────

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

    Write-Host -NoNewline "┌[" -ForegroundColor DarkYellow
    Write-Host -NoNewline (Get-PromptPath) -ForegroundColor DarkCyan
    Write-Host -NoNewline "]" -ForegroundColor DarkYellow

    $branch = Get-PromptGitBranch
    if ($branch)
    {
        Write-Host -NoNewline " (" -ForegroundColor DarkYellow
        Write-Host -NoNewline $branch -ForegroundColor Magenta
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
