# Personal conventions

## Commit messages

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
