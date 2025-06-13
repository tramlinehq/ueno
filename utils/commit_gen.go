package main

import (
	"flag"
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"time"
)

var (
	prefixes = []string{"CX", "APP", "DATA", "OPS", "ENG", "SEC", "UI", "API", "DB", "FEAT", "BUG", "PERF"}

	actions = []string{
		"Fix", "Implement", "Add", "Update", "Refactor", "Remove", "Optimize",
		"Improve", "Enable", "Disable", "Upgrade", "Configure", "Adjust", "Enhance",
	}

	subjects = []string{
		"clipped text on report cards",
		"animation for instant modals",
		"ETL script for clarity",
		"private subnet for DB connections",
		"debounce on input filters",
		"CORS on internal APIs",
		"inconsistent font weights",
		"API retry on 429s",
		"view for archived records",
		"nginx to v1.25.2",
		"memory leak in worker process",
		"responsive layout for mobile",
		"caching layer for user data",
		"validation for email inputs",
		"error handling in payment flow",
		"pagination for large datasets",
		"loading spinner on search",
		"dark mode theme support",
		"auto-save for draft content",
		"rate limiting on login attempts",
		"SSL certificate renewal",
		"database connection pooling",
		"logging format for structured data",
		"session timeout handling",
		"file upload progress indicator",
		"dropdown menu accessibility",
		"password strength requirements",
		"notification badge counter",
		"search highlighting",
		"infinite scroll performance",
		"tooltip positioning",
		"form validation messages",
		"header navigation layout",
		"sidebar collapse animation",
		"modal backdrop click handling",
		"table sorting functionality",
		"chart data visualization",
		"export functionality for reports",
		"breadcrumb navigation",
		"user profile image upload",
	}

	files = []string{
		"TEST_1.md",
		"TEST_2.md",
	}
)

func main() {
	var count = flag.Int("count", 10, "Number of commits to generate")
	var dryRun = flag.Bool("dry-run", false, "Print commits without actually committing")
	flag.Parse()

	if *dryRun {
		fmt.Printf("Generating %d fake commits (dry run):\n\n", *count)
		for i := 0; i < *count; i++ {
			commit := generateCommitMessage()
			fmt.Printf("* %s\n", commit)
		}
		return
	}

	// Check if we're in a git repository
	if !isGitRepo() {
		fmt.Println("Error: Not in a git repository. Please run this command from within a git repository.")
		os.Exit(1)
	}

	fmt.Printf("Generating %d fake commits...\n\n", *count)

	for i := 0; i < *count; i++ {
		commit := generateCommitMessage()
		file := getRandomFile()

		fmt.Printf("Creating commit %d/%d: %s\n", i+1, *count, commit)

		// Make a small change to a random file
		if err := makeRandomChange(file); err != nil {
			fmt.Printf("Error modifying file %s: %v\n", file, err)
			continue
		}

		// Add the file to git
		if err := gitAdd(file); err != nil {
			fmt.Printf("Error adding file %s: %v\n", file, err)
			continue
		}

		// Commit the change
		if err := gitCommit(commit); err != nil {
			fmt.Printf("Error committing: %v\n", err)
			continue
		}

		// Small delay to make commits have different timestamps
		time.Sleep(100 * time.Millisecond)
	}

	fmt.Println("\nDone! Generated", *count, "fake commits.")
}

func generateCommitMessage() string {
	prefix := prefixes[rand.Intn(len(prefixes))]
	ticketNum := rand.Intn(9000) + 1000 // Generate numbers between 1000-9999
	action := actions[rand.Intn(len(actions))]
	subject := subjects[rand.Intn(len(subjects))]
	prNum := rand.Intn(500) + 1000 // Generate PR numbers between 1000-1499

	return fmt.Sprintf("%s-%d: %s %s (#%d)", prefix, ticketNum, action, subject, prNum)
}

func getRandomFile() string {
	return files[rand.Intn(len(files))]
}

func makeRandomChange(filename string) error {
	// Create directory if it doesn't exist
	dir := filepath.Dir(filename)
	if err := os.MkdirAll(dir, 0755); err != nil {
		return err
	}

	// Read existing file or create new content
	var content string
	if data, err := os.ReadFile(filename); err == nil {
		content = string(data)
	} else {
		// Create basic content based on file extension
		content = generateInitialContent(filename)
	}

	// Add a random comment or line
	timestamp := time.Now().Unix()
	randomChange := fmt.Sprintf("// Auto-generated change %d", timestamp)

	if strings.Contains(filename, ".md") {
		randomChange = fmt.Sprintf("<!-- Auto-generated change %d -->", timestamp)
	} else if strings.Contains(filename, ".yml") || strings.Contains(filename, ".yaml") {
		randomChange = fmt.Sprintf("# Auto-generated change %d", timestamp)
	} else if strings.Contains(filename, ".json") {
		// For JSON files, we'll just add a comment-like field
		randomChange = fmt.Sprintf("\"_comment_%d\": \"auto-generated\"", timestamp)
	}

	content = content + "\n" + randomChange + "\n"

	return os.WriteFile(filename, []byte(content), 0644)
}

func generateInitialContent(filename string) string {
	ext := filepath.Ext(filename)

	switch ext {
	case ".md":
		return "# " + filepath.Base(filename) + "\n\nThis is a sample markdown file."
	default:
		return "# Sample file\n# Generated content"
	}
}

func isGitRepo() bool {
	cmd := exec.Command("git", "rev-parse", "--git-dir")
	cmd.Stdout = nil
	cmd.Stderr = nil
	return cmd.Run() == nil
}

func gitAdd(filename string) error {
	cmd := exec.Command("git", "add", filename)
	return cmd.Run()
}

func gitCommit(message string) error {
	cmd := exec.Command("git", "commit", "-m", message)
	return cmd.Run()
}

func init() {
	rand.Seed(time.Now().UnixNano())
}
