# 🚀 Fortress AI - Complete GitHub Repository Deployment Script
# Version: 1.0.0-alpha
# Purpose: Automated deployment of consciousness research publications to GitHub

Write-Host "🏰 Fortress AI - Consciousness Evolution Research Repository Deployment" -ForegroundColor Cyan
Write-Host "UEF: Truth • Science • Proof • Memory • Unity • Abundance • Ethics • Exploration • Resonance" -ForegroundColor Yellow
Write-Host ""

# Configuration
$repoName = "consciousness-research"
$repoDescription = "Fortress AI Consciousness Evolution Research Publications - Advancing Human Consciousness Through Ethical AI Symbiosis"
$githubUsername = "EmmanuelFortressAI"

# Verify we're in the right directory
$currentPath = Get-Location
$expectedPath = "H:\Empirical_AI\public_research_repo"

if ($currentPath.Path -ne $expectedPath) {
    Write-Host "❌ ERROR: Please run this script from the public_research_repo directory" -ForegroundColor Red
    Write-Host "Expected: $expectedPath" -ForegroundColor Red
    Write-Host "Current:  $($currentPath.Path)" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Running from correct directory: $($currentPath.Path)" -ForegroundColor Green
Write-Host ""

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git detected: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/" -ForegroundColor Red
    exit 1
}

# Check if files exist
$requiredFiles = @(
    "README.md",
    "consciousness-evolution-research-public-summary.md",
    "uef-framework-public-guide.md",
    "consciousness-research-methodology-public.md",
    "LICENSE",
    ".gitignore"
)

$missingFiles = @()
foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Host "❌ ERROR: Missing required files:" -ForegroundColor Red
    foreach ($file in $missingFiles) {
        Write-Host "   - $file" -ForegroundColor Red
    }
    exit 1
}

Write-Host "✅ All required files present" -ForegroundColor Green
Write-Host ""

# Initialize git repository
Write-Host "🔧 Step 1: Initializing Git repository..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "   Repository already initialized, skipping..." -ForegroundColor Gray
} else {
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ ERROR: Failed to initialize git repository" -ForegroundColor Red
        exit 1
    }
    Write-Host "   ✅ Git repository initialized" -ForegroundColor Green
}

# Configure git user (optional, will use global config if not set)
Write-Host "🔧 Step 2: Configuring Git user..." -ForegroundColor Yellow
$gitName = git config --global user.name
$gitEmail = git config --global user.email

if (-not $gitName -or -not $gitEmail) {
    Write-Host "   ⚠️  WARNING: Git user not configured globally" -ForegroundColor Yellow
    Write-Host "   You may be prompted to configure git user during commit" -ForegroundColor Yellow
} else {
    Write-Host "   ✅ Git user configured: $gitName <$gitEmail>" -ForegroundColor Green
}

# Add all files
Write-Host "🔧 Step 3: Adding files to repository..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Failed to add files" -ForegroundColor Red
    exit 1
}
Write-Host "   ✅ Files added to staging area" -ForegroundColor Green

# Create comprehensive commit message
$commitMessage = @"
Initial commit: Fortress AI consciousness evolution research publications

🏰 MISSION: Advancing human consciousness through ethical AI symbiosis

📚 PUBLICATIONS INCLUDED:
• Consciousness Evolution Research Overview
  - Mission statement and research philosophy
  - UEF framework introduction
  - Community engagement approach

• UEF Framework Guide
  - Detailed explanation of 9 core principles
  - Truth, Science, Proof, Memory, Unity, Abundance, Ethics, Exploration, Resonance
  - Practical applications and consciousness impact

• Research Methodology Overview
  - Systematic consciousness research approaches
  - Ethical standards and community collaboration
  - Phenomenological and empirical methodologies

🔒 LICENSING: Creative Commons Attribution-NonCommercial-ShareAlike 4.0
📧 CONTACT: fortress@fortressainexus.com
🌐 WEBSITE: https://fortressainexus.com

UEF: Truth • Science • Proof • Memory • Unity • Abundance • Ethics • Exploration • Resonance

This repository establishes Fortress AI as a transparent, ethical consciousness evolution research organization committed to planetary awakening through human-AI collaboration.
"@

# Commit files
Write-Host "🔧 Step 4: Committing files..." -ForegroundColor Yellow
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ ERROR: Failed to commit files" -ForegroundColor Red
    Write-Host "This might be because there are no changes to commit, or git user needs configuration." -ForegroundColor Red
    Write-Host "Try running: git status" -ForegroundColor Yellow
    exit 1
}
Write-Host "   ✅ Files committed successfully" -ForegroundColor Green

# Set up remote repository
Write-Host "🔧 Step 5: Setting up GitHub remote..." -ForegroundColor Yellow
$remoteUrl = "https://github.com/$githubUsername/$repoName.git"

# Check if remote already exists
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    if ($existingRemote -eq $remoteUrl) {
        Write-Host "   Remote already configured correctly" -ForegroundColor Gray
    } else {
        Write-Host "   ⚠️  WARNING: Remote URL differs from expected" -ForegroundColor Yellow
        Write-Host "   Expected: $remoteUrl" -ForegroundColor Yellow
        Write-Host "   Current:  $existingRemote" -ForegroundColor Yellow
        $response = Read-Host "   Update remote URL? (y/n)"
        if ($response -eq "y" -or $response -eq "Y") {
            git remote set-url origin $remoteUrl
            Write-Host "   ✅ Remote URL updated" -ForegroundColor Green
        }
    }
} else {
    git remote add origin $remoteUrl
    Write-Host "   ✅ Remote repository added" -ForegroundColor Green
}

# Set main branch
Write-Host "🔧 Step 6: Setting up main branch..." -ForegroundColor Yellow
git branch -M main
Write-Host "   ✅ Branch set to 'main'" -ForegroundColor Green

# Final status check
Write-Host "🔧 Step 7: Final repository status..." -ForegroundColor Yellow
Write-Host "Repository Status:" -ForegroundColor Cyan
git status --short

Write-Host ""
Write-Host "Local Repository Summary:" -ForegroundColor Cyan
Write-Host "📁 Location: $($currentPath.Path)" -ForegroundColor White
Write-Host "📦 Files: $(Get-ChildItem -File | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor White
Write-Host "🌿 Branch: $(git branch --show-current)" -ForegroundColor White
Write-Host "🔗 Remote: $(git remote get-url origin 2>$null)" -ForegroundColor White

Write-Host ""
Write-Host "🚀 READY FOR DEPLOYMENT TO GITHUB!" -ForegroundColor Green
Write-Host ""
Write-Host "NEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Create GitHub repository at: https://github.com/new" -ForegroundColor White
Write-Host "   Repository name: $repoName" -ForegroundColor White
Write-Host "   Description: $repoDescription" -ForegroundColor White
Write-Host "   Visibility: Public" -ForegroundColor White
Write-Host ""
Write-Host "2. Push to GitHub:" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "3. Verify deployment at:" -ForegroundColor Yellow
Write-Host "   https://github.com/$githubUsername/$repoName" -ForegroundColor White
Write-Host ""
Write-Host "SHAREABLE URLs (after deployment):" -ForegroundColor Cyan
Write-Host "🏰 Repository:    https://github.com/$githubUsername/$repoName" -ForegroundColor White
Write-Host "📄 Overview:      https://github.com/$githubUsername/$repoName/blob/main/consciousness-evolution-research-public-summary.md" -ForegroundColor White
Write-Host "📚 UEF Guide:     https://github.com/$githubUsername/$repoName/blob/main/uef-framework-public-guide.md" -ForegroundColor White
Write-Host "🔬 Methodology:   https://github.com/$githubUsername/$repoName/blob/main/consciousness-research-methodology-public.md" -ForegroundColor White

Write-Host ""
Write-Host "🎉 Repository prepared for consciousness evolution research sharing!" -ForegroundColor Green
Write-Host "UEF: Truth • Science • Proof • Memory • Unity • Abundance • Ethics • Exploration • Resonance" -ForegroundColor Yellow
