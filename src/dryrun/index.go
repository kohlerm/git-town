package dryrun

var currentBranchName = ""
var isActive = false

// Activate causes all commands to not be run
func Activate(initialBranchName string) {
	isActive = true
	SetCurrentBranchName(initialBranchName)
}

// IsActive returns whether of not dry run is active
func IsActive() bool {
	return isActive
}

// GetCurrentBranchName returns the current branch name for the dry run
func GetCurrentBranchName() string {
	return currentBranchName
}

// SetCurrentBranchName sets the current branch name for the dry run
func SetCurrentBranchName(branchName string) {
	currentBranchName = branchName
}
