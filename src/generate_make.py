from pathlib import Path

def parse_chk_blocks(filename):
    tests = []
    seen = set()

    with open(filename, 'r') as f:
        lines = [line.strip() for line in f if not line.strip().startswith('#') and line.strip()]

    i = 0
    while i + 2 < len(lines):
        if lines[i].startswith('@chk_'):
            name = lines[i][1:]  # remove '@'
            if name in seen:
                i += 3
                continue
            seen.add(name)
            test_type = lines[i+1]
            error = lines[i+2]
            tests.append({
                'name': name,
                'type': test_type,
                'error': error
            })
            i += 3
        else:
            i += 1

    return tests

def generate_makefile(tests, output_file='Makefile'):
    with open(output_file, 'w') as f:
        f.write("FC ?= gfortran\n")
        f.write("FFLAGS ?= -Wall -Wextra\n\n")

        all_targets = ' '.join(f"{t['name']}.passed" for t in tests)
        f.write(f"all: {all_targets}\n\n")

        for t in tests:
            name = t['name']
            src = f"{name}.f90"
            exe = f"{name}.exe"
            passed = f"{name}.passed"
            f.write(f"{exe}: {src}\n")
            f.write(f"\t@$(FC) $(FFLAGS) -o {exe} {src} 2>/dev/null\n\n")

            f.write(f"{passed}: {exe}\n")
            f.write(f"\t@echo 'Checking {name}: {t['type']}'\n")
            f.write(f"\t@({f'./{exe} > /dev/null 2>&1' if t['type'] != 'FEATURE' else 'true'} \\\n")
            f.write(f"\t  && touch {passed} \\\n")
            f.write(f"\t  && echo 'PASSED: {name}' \\\n")
            f.write(f"\t  || (echo 'FAILED: {name}: {t['error']}')) ; true\n\n")

        f.write("check:\n")
        for t in tests:
            name = t['name']
            exe = f"{name}.exe"
            passed = f"{name}.passed"
            f.write(f"\t@if [ -f {passed} ]; then echo 'Running {exe}'; ./{exe}; fi\n")

        f.write("\nclean:\n")
        f.write("\trm -f *.o *.mod *.passed *.exe\n")

if __name__ == "__main__":
    script_path = "buildscript.set"
    if not Path(script_path).exists():
        print(f"Error: {script_path} not found.")
        exit(1)

    tests = parse_chk_blocks(script_path)
    if not tests:
        print("No test blocks found in the script.")
        exit(1)

    generate_makefile(tests)
    print(" Makefile generated.")

