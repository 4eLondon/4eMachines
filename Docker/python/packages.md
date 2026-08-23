# Python — Common Packages

Install with `pip install <package>`.

## Web / HTTP
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `fastapi`    | Modern async API framework (+ `uvicorn` to serve) |
| `flask`      | Lightweight web framework                         |
| `django`     | Full-stack web framework                          |
| `httpx`      | Async HTTP client (modern requests replacement)   |
| `requests`   | HTTP client (classic, synchronous)                |
| `aiohttp`    | Async HTTP client and server                      |
| `uvicorn`    | ASGI server for FastAPI/Starlette                 |

## Data Science / Numerics
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `numpy`      | Arrays, linear algebra, numerical computing       |
| `pandas`     | DataFrames, CSV/Excel processing                  |
| `scipy`      | Scientific computing                              |
| `matplotlib` | Plotting and charts                               |
| `seaborn`    | Statistical data visualisation                    |
| `polars`     | Fast DataFrame library (Rust-backed)              |

## Machine Learning / AI
| Package        | Description                                     |
|----------------|-------------------------------------------------|
| `scikit-learn` | Classic ML algorithms                           |
| `torch`        | PyTorch — deep learning                         |
| `tensorflow`   | TensorFlow — deep learning                      |
| `transformers` | HuggingFace — pretrained models (LLMs etc.)     |
| `anthropic`    | Anthropic Claude API client                     |
| `openai`       | OpenAI API client                               |

## Database
| Package         | Description                                    |
|-----------------|------------------------------------------------|
| `sqlalchemy`    | ORM + SQL toolkit                              |
| `alembic`       | Database migrations (works with SQLAlchemy)    |
| `psycopg2-binary` | PostgreSQL driver                            |
| `pymysql`       | MySQL driver                                   |
| `aiosqlite`     | Async SQLite                                   |

## CLI
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `click`      | CLI framework                                     |
| `typer`      | CLI framework built on click (type-hint based)    |
| `rich`       | Beautiful terminal output, tables, progress bars  |
| `textual`    | TUI (terminal UI) framework                       |
| `argparse`   | Built-in stdlib CLI parsing (no install needed)   |

## Parsing / Data Formats
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `pydantic`   | Data validation with type hints                   |
| `pyyaml`     | YAML parsing                                      |
| `tomllib`    | TOML parsing (built-in stdlib in 3.11+)           |
| `beautifulsoup4` | HTML/XML parsing (web scraping)               |
| `lxml`       | Fast XML/HTML parser                              |
| `pypdf`      | PDF reading                                       |

## Dev / Testing
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `pytest`     | Test framework                                    |
| `pytest-asyncio` | Async test support                            |
| `black`      | Code formatter                                    |
| `ruff`       | Fast linter + formatter                           |
| `mypy`       | Static type checker                               |
| `ipython`    | Enhanced interactive shell                        |

## Async / Concurrency
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `asyncio`    | Built-in async stdlib (no install needed)         |
| `anyio`      | Async compatibility layer                         |
| `celery`     | Distributed task queue                            |

## Graphics / Games
| Package      | Description                                       |
|--------------|---------------------------------------------------|
| `pygame`     | 2D game development                               |
| `pyglet`     | Windowing + multimedia                            |
| `arcade`     | Modern 2D game framework                          |
| `pillow`     | Image processing (PIL fork)                       |
| `opencv-python` | Computer vision                                |
