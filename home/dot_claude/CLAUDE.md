# Personal conventions

## Comments

Code comments should be clear and concise. They should not explain what code
does; the code should be self-documenting in its choice of variable and function
names. Comments should only add context that could not be discerned from reading
the code itself.

## Writing style

Avoid using the following words and any of their variants (e.g. conjugations,
plurality, etc.) in commits, comments, and documentation:

- "Carries", as in having a responsibility
- "Mints" as in a factory minting something
- "Invariant" as used in computer science

## Code style

- When the file being edited already follows an obvious convention, match it
  over the directives below.

### Shell scripts

- Start bash scripts with `set -euo pipefail`.
- Use long-form options when they exist for better readability.
- If a variant references a file or a dir, name it as such; for example:
  `$target_file`, `$source_file`, `$parent_dir`, etc.
- When a command has many options, break it across lines with a trailing
  backslash and indent the continuation lines one level deeper.
- Prefer logging what's happening instead of annotating in comments.
- Use the following conventions when logging output:
    - Informative, usually right before doing something:
      `echo "💬 Processing $file"`
    - Success, usually right before exiting zero:
      `echo "✅ Finished processing $file"`
    - Error, usually right before exiting non-zero:
      `echo "❌ Could not find $file" >&2`
    - Warning: `echo "🚧 Skipping step due to $reason" >&2`
    - Link: `echo "🔗 https://example.com/docs"`

## Git practices

### Staging and committing

- Do not stage nor commit changes without specifically being prompted to do so.
- When renaming or removing a file, do not use `git mv` or `git rm` unless
  actually intended to stage.

### Commit messages

- Subject line:
    - Describe the kind of change rather than its details, such as "add
      <feature>", "improve <behavior>", "fix <issue>".
    - Max 50 characters, imperative mood, lead with a lowercase verb, no scope
      prefixes, no trailing period.
- Body:
    - Record the why, not the what. The diff already shows what changed. Explain
      the motivation, the alternatives rejected, non-obvious constraints, or
      anything someone chasing a bug months from now would want to know.
    - When a commit bundles several unrelated small changes, list them as brief
      bullets so each is findable later. This is the one case where "what"
      belongs in the body.
    - Omit it when the subject already says everything worth recording.
    - Separate from the subject with a blank line, wrap at 72 characters, and
      use markdown without headings.
