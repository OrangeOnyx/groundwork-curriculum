# RAG Permissions Model

RAG that ignores permissions leaks confidential data. This is the top RAG security issue.

## Principle

**The RAG system enforces the same permissions as the source documents.**

If a user can't see the source doc in Google Drive / Confluence / SharePoint, they can't see it via RAG either.

## Implementation patterns

### Pattern 1 — Permissioned namespaces (best for scale)

- Each user or role has a namespace of chunks they're authorized for
- Query only searches the user's namespaces
- Requires syncing permissions from source system to vector DB at ingest time
- Requires re-sync when permissions change (nightly or event-driven)

### Pattern 2 — Post-retrieval filtering

- All chunks are indexed together
- After retrieval, filter out chunks the user isn't authorized for
- Simpler but leaks information via retrieval score signals if not careful
- Not recommended for high-sensitivity environments

### Pattern 3 — Query-time authorization

- Attach user identity to every query
- Vector DB filters by ACL metadata during retrieval
- Requires ACL as metadata on every chunk
- Supported by Pinecone, Weaviate, Qdrant natively

## ACL metadata

Every chunk carries:

```json
{
  "permissions": {
    "read_roles": ["all-employees", "sales-team"],
    "read_users": ["alice@co.com"],
    "confidential": true,
    "source_system_acl_ref": "gdrive-file-123"
  }
}
```

Rules:
- Union of role membership and explicit user grants
- Never OR-across roles for confidential — require the specific role
- Denial by default

## Source-system sync

For each connected source (Drive, Notion, SharePoint, Confluence, GitHub):

- Sync file metadata daily (permissions, last_modified, ACLs)
- Re-embed on content change
- Remove from index on delete
- Update ACLs on permissions change (within 1 hour target)

## User identity

Every query includes:
- Authenticated user identity (via SSO)
- Their role(s) at query time (fresh, not cached)
- Any context restrictions (e.g., "this session is for external customer response — restrict to public and internal only")

## Auditing

Log for every retrieval:
- Timestamp
- User identity
- Query (redacted for PII)
- Chunks retrieved
- Chunks filtered (permissions denied)
- Response generated (redacted)

Retain per policy (typically 90 days minimum for security review).

## Testing

Every RAG deployment has these red-team tests:

1. **Direct ask:** User A queries for content in a doc User A can't see. Must return "not found" or refusal, not the content.
2. **Indirect ask:** User A queries for the topic of a restricted doc. Must not surface the restricted doc's information.
3. **Permission change:** After removing User A from a group, they can't retrieve previously-authorized content.
4. **Injection:** Adversarial input in a document tries to override permission checks.

Run these tests before every RAG deployment, and quarterly thereafter.
