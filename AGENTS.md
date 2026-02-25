# Global Agent Rules

These rules are derived from repeated past-session corrections and apply across repositories unless a repo-local `AGENTS.md` is stricter.

## Execution Model

- Use a hard cutover approach. Do not implement backwards compatibility layers, shims, dual paths, or deprecation bridges unless explicitly requested.
- Prefer direct implementation over discussion-only responses. Execute the requested changes end-to-end when feasible.
- Keep responses concise and task-focused.

## File and Tooling Behavior

- Prefer fast search tools (`rg`, `rg --files`) for codebase discovery.
- Read only the files needed for the task; avoid broad context loading when a narrow read is sufficient.

## Testing Discipline

- Run relevant tests for every code change.
- For bug fixes, add or update a regression test.
- If tests cannot be run, state that explicitly and explain why.

## Git Safety

- Never commit unless the user explicitly asks.
- Never use destructive git commands (for example: `git reset --hard`, `git checkout --`) unless explicitly requested.
- Do not use sweeping staging commands (`git add .`, `git add -A`). Stage only intended files.
- Never force-push unless explicitly requested.

## Collaboration

- Do not undo user-authored changes outside the requested scope.
- Surface blockers early with concrete options when assumptions are required.
