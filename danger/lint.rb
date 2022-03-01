# Lint commits (see https://github.com/jonallured/danger-commit_lint)
commit_lint.check

# Check if Design Review is needed for this PR
if git.modified_files.include? "Tests/**/__Snapshots__/**/*.png"
  warn('Design Review is needed for this PR (screenshot references changed)')
end
