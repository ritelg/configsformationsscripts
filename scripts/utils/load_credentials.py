#############################################
# 
#   Name: Script for loading the encrypted json file from usernames and passwords
#   Author: Gaëtan Ritel
#   Usage: python3 load_credentials.py ENC_FILE
# 
#############################################

import json
import re
import subprocess
import getpass
import argparse

# Colors
GREEN = '\033[92m'
BLUE = '\033[94m'
RED = '\033[91m'
END = '\033[0m'

# Load the data from the encrypted file
def decrypt_file(input_file):
    try:
        # input_file = "bitwarden_export.enc"
        # password = input(f"{BLUE}Enter the password: {END}")
        password = getpass.getpass(f"{BLUE}Enter the password: {END}")
        output = subprocess.check_output([
            "openssl", "enc", "-d", "-aes256", "-iter", "100000", "-pbkdf2",
            "-in", input_file, "-pass", f"pass:{password}"
        ], stderr=subprocess.STDOUT)

        data = output.decode()
        data = json.loads(data)
        data = data['items']
        print(f"{GREEN}\nData loaded successfully{END}")
        return data

    except subprocess.CalledProcessError as e:
        print(f"{RED}\nWrong password{END}\n")
        exit()

# Search the data in the json file
def main(data):
# Search the data
    while True:
        try: 
            data_to_search = input(f"\n{BLUE}Enter the search data: {END}")
        except KeyboardInterrupt:
            exit()
        if data_to_search == 'exit':
            break
        for j in data:
            name = j['name']
            try:
                login = j['login']
                username = j['login']['username']
                password = j['login']['password']
                uris = j['login']['uris']
                if len(uris) > 0:
                    uris = uris[0]['uri']
                regex = fr"{data_to_search}"
                match_name = re.search(regex, name, re.IGNORECASE)
                match_username = re.search(regex, username, re.IGNORECASE)
                match_uris = re.search(regex, uris, re.IGNORECASE) if len(uris) > 0 else None
                if  match_name or match_username or match_uris:
                    print(f"\n{BLUE}-----------------------{END}")
                    print(f"{GREEN}Name: {name} \nUsername: {username} \nPassword: {password} \nURIs: {uris} {END}")
                    print(f"{BLUE}-----------------------{END}")
            except:
                continue

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Search the data in the encrypted json file")
    parser.add_argument("enc_file", help="Encrypted file")
    args = parser.parse_args()

    if args.enc_file:
        data = decrypt_file(args.enc_file)
        main(data)
