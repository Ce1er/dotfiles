#!/usr/bin/env python
# vim:foldmethod=marker:
import subprocess


def main():
    sites = {
        # Add sites here "Name": "URL"
        # Sites {{{
        # }}} 
    }

    result = subprocess.run(
        ["wofi", "--show", "dmenu"],
        input=("\n".join(sites.keys())).encode("utf-8"),
        capture_output=True,
        check=False,
    )
    choice = result.stdout.decode().strip()

    if choice == "":
        return

    subprocess.run(["xdg-open", sites[choice]], check=False)


if __name__ == "__main__":
    main()
