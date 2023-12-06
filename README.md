# libasm

## Usage

### Compile the library

```sh
make libasm
```

### Compile the testers

```sh
make testers
```

### Compile the tester for a specific function

```sh
make function_name
```

Note: The function name does not include the `ft_` prefix.

### Lauch the tester

```sh
./test.sh [function_to_test]...
```

If no arguments are passed, the tester will launch the tests for all functions.
Otherwise, only the specified functions will be tested.
All invalid function name will be ignored.

## Workflow

-   [x] mandatory
    -   [x] strlen
    -   [x] strcpy
    -   [x] strcmp
    -   [x] write
    -   [x] read
    -   [x] strdup
-   [x] bonus (won't do 125%)
    -   [x] ft_atoi_base
-   [/] tester
    -   [ ] automatic tests for str_dup
    -   [ ] automatic tests for atoi_base
    -   [ ] selecting of the tests to be done
