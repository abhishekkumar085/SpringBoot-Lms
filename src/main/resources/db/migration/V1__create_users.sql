
CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,

                       is_active BOOLEAN NOT NULL DEFAULT TRUE,
                       is_deleted BOOLEAN NOT NULL DEFAULT FALSE,

                       created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

                       created_by UUID,
                       updated_by UUID,

                       CONSTRAINT uq_users_email UNIQUE (email),

                       CONSTRAINT fk_users_created_by
                           FOREIGN KEY (created_by) REFERENCES users(id),

                       CONSTRAINT fk_users_updated_by
                           FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE INDEX idx_users_created_at
    ON users (created_at);