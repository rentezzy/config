#!/usr/bin/env python3

import sys
import re
import os

def get_key_from_line(line):
    """Extracts the key from a binding line, returns None if it's not a binding."""
    stripped_line = line.strip()
    if not stripped_line or stripped_line.startswith('#'):
        return None
    if '=' in stripped_line:
        return stripped_line.split('=', 1)[0].strip()
    return None

def main():
    """
    Generates the aerospace.toml config by populating main-mode bindings
    into other modes, respecting overrides.
    """
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <template_file>", file=sys.stderr)
        sys.exit(1)

    template_path = sys.argv[1]
    if not os.path.exists(template_path):
        print(f"Error: Template file '{template_path}' not found", file=sys.stderr)
        sys.exit(1)

    output_path = "aerospace.toml"

    main_binding_lines = []
    overrides = {}
    current_mode = None

    # First pass: Collect all main bindings and identify overrides in other modes.
    with open(template_path, 'r') as f:
        for line in f:
            match = re.match(r'\[mode\.([^\]]+)\.binding\]', line)
            if match:
                current_mode = match.group(1)
                if current_mode != 'main' and current_mode not in overrides:
                    overrides[current_mode] = set()
                continue
            
            if line.strip().startswith('['):
                current_mode = None
                continue

            if not current_mode:
                continue

            key = get_key_from_line(line)
            if current_mode == 'main':
                main_binding_lines.append(line)
            elif key:
                overrides[current_mode].add(key)
    
    # Second pass: Write the new config file, performing the substitution.
    with open(output_path, 'w') as out_f, open(template_path, 'r') as in_f:
        current_mode_gen = None
        for line in in_f:
            match = re.match(r'\[mode\.([^\]]+)\.binding\]', line)
            if match:
                current_mode_gen = match.group(1)
            elif line.strip().startswith('['):
                current_mode_gen = None
            
            if line.strip() == '#[[[mode.main.binding]]]':
                if current_mode_gen and current_mode_gen != 'main':
                    mode_overrides = overrides.get(current_mode_gen, set())
                    for main_line in main_binding_lines:
                        key = get_key_from_line(main_line)
                        if not key or key not in mode_overrides:
                            out_f.write(main_line)
            else:
                out_f.write(line)
                
    print(f"Generated config file: {output_path}")

if __name__ == "__main__":
    main() 