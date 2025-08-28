lobsters-go/
├── cmd/                           # 应用程序入口点
│   ├── api/                      # API 服务器
│   │   ├── main.go
│   │   └── server.go
│   ├── worker/                   # 后台工作进程
│   │   ├── main.go
│   │   └── worker.go
│   └── cron/                     # 定时任务
│       ├── main.go
│       └── scheduler.go
│
├── internal/                     # 内部包（不对外暴露）
│   ├── domain/                   # 领域层（核心业务逻辑）
│   │   ├── entities/            # 实体
│   │   │   ├── user.go
│   │   │   ├── story.go
│   │   │   ├── comment.go
│   │   │   ├── tag.go
│   │   │   ├── category.go
│   │   │   ├── vote.go
│   │   │   ├── invitation.go
│   │   │   ├── hat.go
│   │   │   ├── domain.go
│   │   │   └── origin.go
│   │   ├── valueobjects/        # 值对象
│   │   │   ├── email.go
│   │   │   ├── username.go
│   │   │   ├── short_id.go
│   │   │   ├── password.go
│   │   │   └── time_range.go
│   │   ├── aggregates/          # 聚合根
│   │   │   ├── story_aggregate.go
│   │   │   ├── user_aggregate.go
│   │   │   └── comment_aggregate.go
│   │   ├── repositories/        # 仓储接口
│   │   │   ├── user_repository.go
│   │   │   ├── story_repository.go
│   │   │   ├── comment_repository.go
│   │   │   ├── tag_repository.go
│   │   │   └── vote_repository.go
│   │   ├── services/            # 领域服务
│   │   │   ├── user_service.go
│   │   │   ├── story_service.go
│   │   │   ├── comment_service.go
│   │   │   ├── moderation_service.go
│   │   │   ├── search_service.go
│   │   │   └── notification_service.go
│   │   ├── events/              # 领域事件
│   │   │   ├── story_events.go
│   │   │   ├── user_events.go
│   │   │   └── comment_events.go
│   │   └── errors/              # 领域错误
│   │       ├── domain_errors.go
│   │       └── validation_errors.go
│   │
│   ├── application/             # 应用层（用例和编排）
│   │   ├── usecases/           # 用例
│   │   │   ├── user/           # 用户相关用例
│   │   │   │   ├── register_user.go
│   │   │   │   ├── login_user.go
│   │   │   │   ├── update_profile.go
│   │   │   │   └── request_invitation.go
│   │   │   ├── story/          # 故事相关用例
│   │   │   │   ├── create_story.go
│   │   │   │   ├── update_story.go
│   │   │   │   ├── delete_story.go
│   │   │   │   └── list_stories.go
│   │   │   ├── comment/        # 评论相关用例
│   │   │   │   ├── create_comment.go
│   │   │   │   ├── update_comment.go
│   │   │   │   └── delete_comment.go
│   │   │   ├── moderation/     # 审核相关用例
│   │   │   │   ├── moderate_story.go
│   │   │   │   ├── moderate_comment.go
│   │   │   │   └── ban_user.go
│   │   │   └── search/         # 搜索相关用例
│   │   │       ├── search_stories.go
│   │   │       └── search_users.go
│   │   ├── commands/           # 命令
│   │   │   ├── user_commands.go
│   │   │   ├── story_commands.go
│   │   │   └── comment_commands.go
│   │   ├── queries/            # 查询
│   │   │   ├── story_queries.go
│   │   │   ├── user_queries.go
│   │   │   └── comment_queries.go
│   │   └── handlers/           # 应用层处理器
│   │       ├── user_handlers.go
│   │       ├── story_handlers.go
│   │       └── comment_handlers.go
│   │
│   ├── infrastructure/         # 基础设施层
│   │   ├── database/          # 数据库相关
│   │   │   ├── mysql/         # MySQL 实现
│   │   │   │   ├── connection.go
│   │   │   │   ├── user_repository.go
│   │   │   │   ├── story_repository.go
│   │   │   │   └── comment_repository.go
│   │   │   ├── sqlite/        # SQLite 实现
│   │   │   │   └── ...
│   │   │   └── migrations/    # 数据库迁移
│   │   │       ├── 001_create_users.sql
│   │   │       ├── 002_create_stories.sql
│   │   │       └── 003_create_comments.sql
│   │   ├── cache/             # 缓存
│   │   │   ├── redis.go
│   │   │   └── memory.go
│   │   ├── queue/             # 消息队列
│   │   │   ├── rabbitmq.go
│   │   │   └── memory_queue.go
│   │   ├── search/            # 搜索引擎
│   │   │   ├── elasticsearch.go
│   │   │   └── bleve.go
│   │   ├── email/             # 邮件服务
│   │   │   ├── smtp.go
│   │   │   └── sendgrid.go
│   │   ├── auth/              # 认证服务
│   │   │   ├── jwt.go
│   │   │   ├── oauth.go
│   │   │   └── two_factor.go
│   │   ├── storage/           # 文件存储
│   │   │   ├── local.go
│   │   │   └── s3.go
│   │   └── external/          # 外部服务集成
│   │       ├── mastodon.go
│   │       ├── github.go
│   │       └── pushover.go
│   │
│   ├── interfaces/            # 接口层（适配器）
│   │   ├── http/             # HTTP 接口
│   │   │   ├── handlers/     # HTTP 处理器
│   │   │   │   ├── user_handlers.go
│   │   │   │   ├── story_handlers.go
│   │   │   │   ├── comment_handlers.go
│   │   │   │   ├── auth_handlers.go
│   │   │   │   ├── search_handlers.go
│   │   │   │   └── moderation_handlers.go
│   │   │   ├── middleware/   # 中间件
│   │   │   │   ├── auth.go
│   │   │   │   ├── cors.go
│   │   │   │   ├── logging.go
│   │   │   │   ├── rate_limit.go
│   │   │   │   └── recovery.go
│   │   │   ├── routes.go     # 路由定义
│   │   │   └── server.go     # HTTP 服务器
│   │   ├── grpc/             # gRPC 接口（可选）
│   │   │   ├── handlers/
│   │   │   ├── middleware/
│   │   │   └── server.go
│   │   ├── cli/              # 命令行接口
│   │   │   ├── commands/
│   │   │   │   ├── user_commands.go
│   │   │   │   ├── story_commands.go
│   │   │   │   └── moderation_commands.go
│   │   │   └── cli.go
│   │   └── websocket/        # WebSocket 接口
│   │       ├── handlers/
│   │       └── server.go
│   │
│   ├── shared/               # 共享组件
│   │   ├── config/          # 配置管理
│   │   │   ├── config.go
│   │   │   ├── database.go
│   │   │   ├── redis.go
│   │   │   └── email.go
│   │   ├── logger/          # 日志
│   │   │   └── logger.go
│   │   ├── validator/       # 验证器
│   │   │   └── validator.go
│   │   ├── crypto/          # 加密工具
│   │   │   ├── password.go
│   │   │   └── hash.go
│   │   ├── utils/           # 工具函数
│   │   │   ├── time.go
│   │   │   ├── string.go
│   │   │   └── url.go
│   │   └── constants/       # 常量定义
│   │       ├── roles.go
│   │       ├── status.go
│   │       └── errors.go
│   │
│   └── jobs/                # 后台任务
│       ├── email_jobs.go
│       ├── notification_jobs.go
│       ├── search_index_jobs.go
│       └── cleanup_jobs.go
│
├── pkg/                     # 可导出的包
│   ├── client/             # 客户端库
│   │   └── api_client.go
│   ├── sdk/                # SDK
│   │   └── lobsters_sdk.go
│   └── tools/              # 工具
│       ├── migration_tool.go
│       └── data_import_tool.go
│
├── web/                    # 前端资源（可选）
│   ├── static/
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   └── templates/
│       ├── layout.html
│       ├── stories/
│       ├── users/
│       └── admin/
│
├── scripts/                # 脚本文件
│   ├── setup.sh
│   ├── migrate.sh
│   ├── seed.sh
│   └── deploy.sh
│
├── docs/                   # 文档
│   ├── api/
│   ├── architecture/
│   ├── deployment/
│   └── development/
│
├── tests/                  # 测试
│   ├── unit/              # 单元测试
│   │   ├── domain/
│   │   ├── application/
│   │   └── infrastructure/
│   ├── integration/       # 集成测试
│   │   ├── api/
│   │   ├── database/
│   │   └── external/
│   ├── e2e/              # 端到端测试
│   └── fixtures/         # 测试数据
│
├── deployments/           # 部署配置
│   ├── docker/
│   │   ├── Dockerfile
│   │   ├── docker-compose.yml
│   │   └── docker-compose.prod.yml
│   ├── kubernetes/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── ingress.yaml
│   └── terraform/
│       ├── main.tf
│       └── variables.tf
│
├── go.mod
├── go.sum
├── Makefile
├── README.md
├── .env.example
├── .gitignore
└── docker-compose.yml