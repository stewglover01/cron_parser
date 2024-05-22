# Cron Parser

## Overview

Cron Parser is a command-line application that parses cron strings and expands each field to show the times at which the job will run. 
It supports the standard cron format with five time fields (minute, hour, day of month, month, and day of week) plus a command.

## Features

- Parses cron strings into human-readable format
- Supports standard cron expressions
- Outputs times in a table format

## Prerequisites

- Ruby 3.3.0 or higher
- Bundler (for managing dependencies)

## Installation

### Using Bundler

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/cron_parser.git
   cd cron_parser
    ```
2. Bundle

    ```sh
    bundle install
    ```

## Usage

  ```sh
  ruby bin/parser_main "*/15 0 1,15 * 1-5 /usr/bin/find"
  ```
Output

  ```
  minute              0 15 30 45
  hour                0
  day of month        1 15
  month               1 2 3 4 5 6 7 8 9 10 11 12
  day of week         1 2 3 4 5
  command             /usr/bin/find
  ```

## Testing

  ```sh
  bundle exec rspec
  ```

## Linting

  ```sh
  bundle exec rubocop
  ```

## Security

  ```sh
  bundle exec brakeman --force
  ```


 
