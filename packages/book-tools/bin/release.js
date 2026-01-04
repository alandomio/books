#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { execSync } from 'child_process';

async function main() {
    console.log('--- Book Release Tool ---');

    const cwd = process.cwd();
    const pkgPath = path.join(cwd, 'package.json');

    if (!fs.existsSync(pkgPath)) {
        console.error('Error: No package.json found in current directory.');
        process.exit(1);
    }

    const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf-8'));

    const version = pkg.version;
    const bookConfig = pkg.book || {};

    if (!version) {
        console.error('Error: No version specified in package.json');
        process.exit(1);
    }

    console.log(`Releasing ${pkg.name} v${version}`);

    // Determine artifacts
    const artifacts = [];
    if (bookConfig.pdf) artifacts.push(bookConfig.pdf);
    if (bookConfig.epub) artifacts.push(bookConfig.epub);

    // If no explicit config, try defaults or look for files
    if (artifacts.length === 0) {
        console.log('No artifacts specified in package.json (book.pdf, book.epub). Checking common defaults...');
        // This is valid fallback? Maybe not safely.
    }

    // Verify artifacts exist
    const missing = artifacts.filter(f => !fs.existsSync(path.join(cwd, f)));
    if (missing.length > 0) {
        console.error(`Error: Missing artifacts: ${missing.join(', ')}`);
        console.error('Did you run the build script?');
        process.exit(1);
    }

    if (artifacts.length === 0) {
        console.error('Error: No artifacts found to release.');
        process.exit(1);
    }

    // Create Release
    const tag = `v${version}`; // Or just version if it already has v
    // changesets often bump to x.y.z. So we usually tag vX.Y.Z or just X.Y.Z.
    // We'll assume the user wants 'v' prefix if not present.
    const tagName = version.startsWith('v') ? version : `v${version}`;

    // Tag format might need to be unique per package if in monorepo, 
    // BUT changesets handles tags like @scope/pkg@version.
    // HOWEVER, the user asked for a script that uses data from package.json for publishing.
    // If we are using `gh release create`, we are creating a GitHub Release.
    // GitHub Releases are git tags.
    // If we have multiple books, we can't have duplicate tags.
    // So we should probably use `${pkg.name}@${version}` or similar IF they are distinct.
    // Current `release_github.py` used `vYYYY.MM.DD`.
    // If we use changesets, we should follow changesets tagging pattern or allow customization.
    // Standard changeset tag: pkg-name@version

    // Check for gh CLI
    try {
        execSync('gh --version', { stdio: 'ignore' });
    } catch (e) {
        console.error('Error: GitHub CLI (gh) is not installed or not in PATH.');
        console.error('Please install it: https://cli.github.com/');
        process.exit(1);
    }

    const releaseTag = `${pkg.name}@${version}`;

    console.log(`Creating GitHub release: ${releaseTag}`);
    console.log(`Artifacts: ${artifacts.join(', ')}`);

    const cmd = `gh release create "${releaseTag}" ${artifacts.map(a => `"${a}"`).join(' ')} --title "${pkg.name} ${version}" --generate-notes`;

    console.log(`Running: ${cmd}`);

    try {
        execSync(cmd, { stdio: 'inherit' });
        console.log('Release created successfully!');
    } catch (e) {
        console.error('Failed to create release.');
        process.exit(1);
    }
}

main().catch(err => {
    console.error(err);
    process.exit(1);
});
